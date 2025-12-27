
\documentclass[GR.tex]{subfiles}

\begin{document}

    \newpage
    \section{The Schwarzschild Metric Applications}



    \subsection{Time Dilation}

    \begin{align}
        \shortintertext{Consider two stationary clocks in the Schwarzschild geometry, located at fixed radii $r_1$ and $r_2$}
        x_1^𝜇(𝜏1) &= ( c\,t_1(𝜏_1),r_1,𝜃_0,𝜑_0 )  \\
        x_2^𝜇(𝜏2) &= ( c\,t_2(𝜏_2),r_2,𝜃_0,𝜑_0)  \\
        \shortintertext{using previously computed $B(r)$ gives}
        \dv{(ct)}{𝜏} &= c\,\sqrt{\recip{1 - \frac{2\,G\,M}{c^2\,r}} }  \\
        \shortintertext{ the rate of change of coordinate time with respect to proper time }
        \dv{t}{𝜏} &= \recip{\sqrt{1 - \frac{2\,G\,M}{c^2\,r}} }    \\
        \shortintertext{or the rate of change of proper time with respect to coordinate time  }
        \dot{𝜏} = \dv{𝜏}{t} =  \sqrt{1 - \frac{2\,G\,M}{c^2\,r}}
        \shortintertext{give a coordinate time interval $𝛥t$ we can compute the proper time interval $𝛥𝜏$}
        𝛥𝜏 &= \int_{t = t_0}^{t_0 + 𝛥t} \dot{𝜏} \dd{t}
        \shortintertext{because in this case $\dot{𝜏}$ is constant with respect to t}
        &= \dot{𝜏}\,\int_{t = t_0}^{t_0 + 𝛥t}  \dd{t} \\
        &= \dot{𝜏}\,\Big|_{t_0}^{t_0 + 𝛥t} \\
        &= \dot{𝜏}\,𝛥t
        \shortintertext{Compute the difference in elapsed proper times between two radii}
        𝛥𝜏_{21} &\equiv 𝛥𝜏_2 - 𝛥𝜏_1                \\
        &= \dot{𝜏}_2\,𝛥t - \dot{𝜏}_1\,𝛥t   \\
        &= (\dot{𝜏}_2 - \dot{𝜏}_1)\,𝛥t     \\
        &= (\dot{𝜏}_2 - \dot{𝜏}_1)\,\frac{𝛥𝜏_1}{\dot{𝜏}_1}    \\
        &= \qty(\frac{\dot{𝜏}_2}{\dot{𝜏}_1} - 1)\,𝛥𝜏_1 \\
        &= \qty(\frac{ \sqrt{1 - \frac{2\,G\,M}{c^2\,r_2}} }{ \sqrt{1 - \frac{2\,G\,M}{c^2\,r_1}}} - 1  )\,𝛥𝜏_1 \\
        &= \qty(\sqrt{ \frac{1 - \frac{2\,G\,M}{c^2\,r_2}} { 1 - \frac{2\,G\,M}{c^2\,r_1}} } - 1)\,𝛥𝜏_1 \\
    \end{align}

    \begin{luacode*}
        G = 6.67430e-11  -- m^3/(kg s^2)
        c = 299792458    -- m/s

        function schwarzschildRadius(aMass)
            return 2*G*aMass/c^2   -- m
        end

        function schwarzschildFactor(aMass, aRadius)
            return 1 - schwarzschildRadius(aMass)/aRadius  -- dimensionless
        end

        function print_mm(aLengthMeters)
            printf("\\SI{%.2f}{\\milli\\meter}",aLengthMeters * 1000)
        end

        function print_km(aLengthMeters)
            printf("\\SI{%.2f}{\\kilo\\meter}",aLengthMeters / 1000 )
        end


        function tauDotStationary(aMass, aRadius)
            return math.sqrt( schwarzschildFactor(aMass,aRadius ) )
        end


        mSun = 1.989e30  -- kg

        mEarth = 5.97219e24   -- kg
        rEarth = 6.371e6      -- mean radius, m

        r_s_earth =  schwarzschildRadius(mEarth)
        r_s_sun =  schwarzschildRadius(mSun)


        -- Compute Δτ_{21} = ( τdot2 / τdot1 - 1) * Δτ1
        function deltaTau21(tauDot2, tauDot1, deltaTau1)
            return (tauDot2 / tauDot1 - 1) * deltaTau1
        end


    function printAltitudeTableRows(mass, r1, radii, offset, scale)

        local tauDot1      = tauDotStationary(mass, r1)
        local deltaTau1Day  = 86400
        local deltaTau1Year = 365.25 * deltaTau1Day


        for _, loc in ipairs(radii) do
            local name, r2 = loc.name, loc.radius

            local elev = (r2 - offset) / scale
            --local r2         = r1 + elev
            local tauDot2    = tauDotStationary(mass, r2)

            tex.print(string.format(
                "%s & %s & %.16f & ",
                name,
                commas(elev),
                tauDot2
            ))

            if r1 == r2 then
                -- Print blank cells for Δτ columns
                tex.print(" &   \\\\")
            else

                local dTau21_day  = deltaTau21(tauDot2, tauDot1, deltaTau1Day)
                local dTau21_year = deltaTau21(tauDot2, tauDot1, deltaTau1Year)

                tex.print(string.format(
                    "%s & %s \\\\",
                    formatSecondsAuto(dTau21_day),
                    formatSecondsAuto(dTau21_year)
                ))
            end
        end

        -- Infinity row
        local tauDot2    = 1.0
        local dTau21_day_inf  = deltaTau21(tauDot2, tauDot1, deltaTau1Day)
        local dTau21_year_inf = deltaTau21(tauDot2, tauDot1, deltaTau1Year)

        tex.print(string.format(
            "Infinity & $\\infty$ & %.16f & %s & %s \\\\",
            tauDot1,
            formatSecondsAuto(dTau21_day_inf),
            formatSecondsAuto(dTau21_year_inf)
        ))
    end

    local R = function(n, radius_m) return {name=n, radius=radius_m} end

    function earthTimeDilationRows()
        locations = {
           R("Dead Sea", rEarth - 430),
           R("Death Valley", rEarth - 86),
           R("Sea Level", rEarth),
           R("1 meter", rEarth + 1),
           R("Chandler, AZ", rEarth + 370),
           R("Mount Everest", rEarth + 8848),
           R("Passenger Jet", rEarth + 10000),
           R("ISS Orbit", 6.78e6),
           R("GPS Orbit", 2.656e7),
           R("Geosynchronous Orbit", 4.2164e7),
           R("Moon Orbit", 3.844e8),
        }

        printAltitudeTableRows(mEarth, rEarth, locations, rEarth, 1)
    end

    function sunTimeDilationRows()
        rOrbitEarth = 1.49598e11

        orbits = {
            R("Sun Surface", 6.9634e8),
            R("Mercury", 5.7909e10),
            R("Venus", 1.0821e11),
            R("Earth", rOrbitEarth),
            R("Mars", 2.27939e11),
            R("Jupiter", 7.78412e11),
            R("Saturn", 1.42666e12),
            R("Uranus", 2.87099e12),
            R("Neptune", 4.49825e12),
        }

        printAltitudeTableRows(mSun,rOrbitEarth, orbits, 0, 1000)
    end
    \end{luacode*}

    \[
        R_s = \frac{2\,G\,M}{c^2},
    \]
    is called the Schwarzschild radius.
    It's the key scaling parameter in Schwarzschild geometry.
    For earth its value is,
    \[
        R_⊕ = \frac{2\,G\,M_⊕}{c^2} = \directlua{print_mm(r_s_earth)}.
    \]
    This would be the radius of the event horizon of a black hole with the mass of earth.


    The following table shows the gravitational time dilation caused by the earth relative to a clock at sea level ($r_1$)
    These do not take into account the time dilation caused by the velocity of the clocks.
    It's as if the clocks are "hovering" at the given altitude.
    The next section will account for the velocity of the clocks.

    \begin{table}[h!]
        \centering
        \caption{Earth Gravitational time dilation relative to Sea Level $(r_1$.}
        \begin{tabular}{l r r r r }
            \toprule
            &                             &                       & \bold{$𝛥𝜏_1$ (1 day)} &  \bold{$𝛥𝜏_1$ (1 year)} \\
            \bold{Name} & \bold{$r_2$ = Altitude (m)} & \bold{$\dot{\tau}_2$} &      \bold{$𝛥𝜏_{21}$} &        \bold{$𝛥𝜏_{21}$} \\
            \midrule
            \directlua{earthTimeDilationRows()}
            \bottomrule
        \end{tabular}
    \end{table}

    For the sun the Schwarzschild radius is,
    \[
        R_☉ = \frac{2\,G\,M_☉}{c^2} = \directlua{print_km(r_s_sun)}.
    \]

    This table show the time dilation caused by the sun relative to a clock "hovering" at the radius of the earth's orbit $(r_1)$.

    \begin{table}[h!]
        \centering
        \caption{Sun Gravitational time dilation relative to Earth  Orbit $(r_1)$.}
        \begin{tabular}{l r r r r }
            \toprule
            &                            &                       & \bold{$𝛥𝜏_1$ (1 day)} &  \bold{$𝛥𝜏_1$ (1 year)} \\
            \bold{Name} & \bold{$r_2$ = Radius (km)} & \bold{$\dot{\tau}_2$} &      \bold{$𝛥𝜏_{21}$} &        \bold{$𝛥𝜏_{21}$} \\
            \midrule
            \directlua{sunTimeDilationRows()}
            \bottomrule
        \end{tabular}
    \end{table}


\end{document}