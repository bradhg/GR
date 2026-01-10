//
// Copyright 2025 Brad Garn
//

#import "utils.typ" : *

#pagebreak()
= The Schwarzschild Metric Applications

== Time Dilation (Stationary)

Consider two stationary clocks in the Schwarzschild geometry, located at fixed radii $r_1$ and $r_2$:

$
& x_1^𝜇 (𝜏_1) &&= ( c t_1(𝜏_1), r_1, 𝜃_0, 𝜑_0 ) \
& x_2^𝜇 (𝜏_2) &&= ( c t_2(𝜏_2), r_2, 𝜃_0, 𝜑_0 )
$

Solve for $(dd((c t))) / (dd(𝜏))$ of a motionless object using the Schwarzschild metric

$ -c^2 dd(𝜏)^2 = g_(O𝜇 G𝜈) dd(x)^O𝜇 dd(x)^G𝜈 $
#{
    let (gRm, gRh, _) = makeVariants2( (i1,i2) => $g^(i1 i2) dd(x)^i1 dd(x)^i2$)

    let (_, gD2h, _) = makeVariants2( (i1,i2) => $g^(i1 i2) (dd(x)^i1)^2$)

    $
    -c^2 dd(𝜏)^2 &= gRm(𝜇,𝜈) \
                 &= gRh(t,t) + gRh(r,r) + gRh(𝜃,𝜃) + gRh(𝜑,𝜑) \
                 &= gD2h(t,t) + gD2h(r,r) + gD2h(𝜃,𝜃) + gD2h(𝜑,𝜑) \
                 &= -f(r) (dd((c t)))^2 + f(r)^(-1) dd(r)^2 + r^2 dd(𝜃)^2 + r^2 sin^2 𝜃 dd(𝜑)^2
     $
}

Divide both sides by $dd(𝜏)^2$ and recall that in this case the positional derivatives are zero

$ -c^2 = -f(r)(dd((c t)) / dd(𝜏))^2 + f(r)^(-1) cancel(((dd(r)) / (dd(𝜏)))^2) + r^2 cancel(((dd(𝜃)) / (dd(𝜏)))^2) + r^2 sin^2 𝜃 cancel(((dd(𝜑)) / (dd(𝜏)))^2) $



$ (dd((c t))) / (dd(𝜏)) = c sqrt(f(r)^(-1)) $


Divide both sides by the speed of light $c$ to get the rate of change of coordinate time $t$ with respect to proper time $𝜏$:

$ dv(t, 𝜏) = 1 / sqrt(f(r)) $

Inverting provides the rate of change of proper time with respect to coordinate time:

$ dot(𝜏) = dv(𝜏, t) = sqrt(f(r)) $

Given a coordinate time interval $𝛥 t$, we can compute the proper time interval $𝛥 𝜏$:

$ 𝛥 𝜏 = integral_(t = t_0)^(t_0 + 𝛥 t) dot(𝜏) dd(t) $

Because in this case $dot(𝜏)$ is constant with respect to $t$:

$
& &&= dot(𝜏) integral_(t = t_0)^(t_0 + 𝛥 t) dd(t) \
& &&= dot(𝜏) bar_(t_0)^(t_0 + 𝛥 t) \
& &&= dot(𝜏) 𝛥 t
$

Compute the difference in elapsed proper times between two radii:

$
& 𝛥 𝜏_(21) &&:= 𝛥 𝜏_2 - 𝛥 𝜏_1 \
& &&= dot(𝜏)_2 𝛥 t - dot(𝜏)_1 𝛥 t \
& &&= (dot(𝜏)_2 - dot(𝜏)_1) 𝛥 t \
& &&= (dot(𝜏)_2 - dot(𝜏)_1) (𝛥 𝜏_1 / dot(𝜏)_1) \
& &&= (dot(𝜏)_2 / dot(𝜏)_1 - 1) 𝛥 𝜏_1 \
& &&= ( sqrt(f(r_2)) / sqrt(f(r_1)) - 1 ) 𝛥 𝜏_1 \
& &&= ( sqrt(f(r_2) / f(r_1)) - 1 ) 𝛥 𝜏_1 \
$

$ 𝛥 𝜏_(21) = ( sqrt( (1 - r_s/r_2) / (1 - r_s/r_1) ) - 1 ) 𝛥 𝜏_1 $

#let G = 6.67430e-11 // m^3 kg^-1 s-2
#let c = 299792458 // m/s
#let cSquared = c*c
#let sunMass = 1.98847e30 // kg
#let sunRadius = 695700000 // m
#let earthMass = 5.97219e24 // kg
#let earthRadius = 6.371e6 // m
#let earthOrbitRadius = 149597870700 //m


#let schwarzschildRadius(mass) = (2 * G * mass) / cSquared
#let schwarzschildFactor(mass, radius) = 1 - (schwarzschildRadius(mass) / radius)
#let tauDotStationary(mass, radius) = calc.sqrt(schwarzschildFactor(mass, radius))
#let deltaTau21(tauDot2, tauDot1, deltaTau1) = (tauDot2 / tauDot1 - 1) * deltaTau1

//--------------------------------------------------------------------------------------------------
// Display table of time dilation
#let dilationTable(
    caption: none,              // caption for the table
    mass: none,                 // The mass of the central gravitational body (in kg)
    r1: none,                   // Time dilations computed compared to a clock at this radius (in meters)
    locations: (),              // Array of dictionaries, each with a .name and .radius (in meters)
    radius_header: [Radius],    // The header for the "radius" column
    radius_transform: r => r    // A transform for the "radius" column data
) = {
  let td1 = tauDotStationary(mass, r1)
  let day = 86400.0
  let year = 365.25 * day
  figure(
    caption: caption,
    table(
      columns: (1.6fr, 1.2fr, 1.4fr, 1.1fr, 1.1fr),
      inset: 7pt,
      align: (left, right, right, right, right),
      stroke: none,
      table.hline(),
      table.header(
        [Name], radius_header, [$dot(𝜏)_2$], [$𝛥 𝜏_(21)$ (1d)], [$𝛥 𝜏_(21)$ (1y)]
      ),
      table.hline(stroke: 0.5pt),
      ..locations.map(loc => {
        let r2 = loc.radius
        let td2 = tauDotStationary(mass, r2)
        (
          loc.name,
          radius_transform(loc),
          fmt(td2, digits: 14),
          if r2 == r1 [] else { formatSecondsAuto(deltaTau21(td2, td1, day)) },
          if r2 == r1 [] else { formatSecondsAuto(deltaTau21(td2, td1, year)) },
        )
      }).flatten(),
      [Infinity],
      [$∞$],
      fmt(1, digits: 14),
      formatSecondsAuto(deltaTau21(1.0, td1, day)),
      formatSecondsAuto(deltaTau21(1.0, td1, year)),
      table.hline(),
    )
  )
}

=== Earth

For Earth, the Schwarzschild radius is:

$ R_(s,plus.o) = (2 G M_plus.o) / c^2 = #fmt(schwarzschildRadius(earthMass) * 1000, sigFigs:4) "mm" $

This would be the radius of the event horizon of a black hole with the mass of earth.

The following table shows the gravitational time dilation caused by the earth relative to a clock at sea level ($r_1$)
These do not take into account the time dilation caused by the velocity of the clocks.
It's as if the clocks are "hovering" at the given altitude.
The next section will account for the velocity of the clocks.

#let earth_locations = (
  // all in meters
  (name: "Dead Sea", radius: earthRadius - 430),
  (name: "Death Valley", radius: earthRadius - 86),
  (name: "Sea Level", radius: earthRadius),
  (name: "1 meter", radius: earthRadius + 1),
  (name: "Chandler, AZ", radius: earthRadius + 370),
  (name: "Mount Everest", radius: earthRadius + 8848),
  (name: "Passenger Jet", radius: earthRadius + 10000),
  (name: "ISS Orbit", radius: 6.78e6),
  (name: "GPS Orbit", radius: 2.656e7),
  (name: "Geosynchronous", radius: 4.2164e7),
  (name: "Moon Orbit", radius: 3.844e8),
)

#dilationTable(
  caption: [Earth Gravitational time dilation relative to Sea Level $(r_1)$.],
  mass: earthMass,
  r1: earthRadius,
  locations: earth_locations,
  radius_header: [Alt (m)],
  radius_transform: loc => fmt(loc.radius - earthRadius, digits: 0, commas: true) // display altitude relative to earth surface
)

=== Sun

For the sun, the Schwarzschild radius is:
$ R_(s,dot.o) = (2 G M_dot.o) / c^2 = #fmt(schwarzschildRadius(sunMass) / 1000, sigFigs:2) "km" $

This table show the time dilation caused by the sun relative to a clock "hovering" at the radius of the earth's orbit $(r_1)$.

#let sunOrbits = (
  // all in meters
  (name: "Sun Surface", radius: 695700000),
  (name: "Mercury",     radius: 57909050000),
  (name: "Venus",       radius: 108208000000),
  (name: "Earth",       radius: earthOrbitRadius), // Exactly 1 AU
  (name: "Mars",        radius: 227939200000),
  (name: "Jupiter",     radius: 778570000000),
  (name: "Saturn",      radius: 1433530000000),
  (name: "Uranus",      radius: 2872460000000),
  (name: "Neptune",     radius: 4495060000000),
)

#let AUtoMeters = 149597870700 //International Astronomical Union (IAU) has defined the astronomical unit (au) as an exact fixed value.

#dilationTable(
  caption: [Sun Gravitational time dilation relative to Earth Orbit $(r_1)$],
  mass: sunMass,
  r1: earthOrbitRadius,
  locations: sunOrbits,
  radius_header: [Radius (au)],
  radius_transform: loc => fmt( loc.radius / AUtoMeters , sigFigs:2)// convert to km for display
)

#let aStar = [A#h(-0.15em)#text(baseline: -0.1em)[$*$]] // A* using the math mode * moved up and closer
=== Sagittarius #aStar

#let sgrA = [Sgr#aStar]

#let sgrAMass = 4.297e6 * sunMass
#let RsSgrA = schwarzschildRadius(sgrAMass)

the Schwarzschild radius of Sagittarius #aStar#footnote[#aStar is pronounced "A Star"], the Black hole at the center of the Milky is:
$ R_sgrA = (2 G M_sgrA) / c^2 = #fmt(RsSgrA / 1000, sigFigs:4, commas: true) "km" $

#let lightYear = 365.25*86400*c
#let earthToSgrADistance = 26000 * lightYear


#let s2 = text(features: ("case",))[S2]  // make 2 the same height S

#let footnotePhotonSphere = footnote[The Radius that light orbits]
#let footnoteISCO = footnote[Innermost Stable Circular Orbit]
#let footnoteS2 = footnote[#s2 is a star with a highly eccentric orbit around #sgrA. Bothron from the Ancient Greek βόθρος (bóthros), "pit."]

#let sgrAPois = (
    (name: [Event Horizon $R_s$],                         radius: RsSgrA ),
    (name: [$R_s+1$ m],                                   radius: RsSgrA+1 ),
    (name: [Photon Sphere#footnotePhotonSphere $1.5R_s$], radius: 1.5 * RsSgrA ),
    (name: [ISCO#footnoteISCO $3R_s$],                    radius: 3 * RsSgrA ),
    (name: [#s2 Peribothron#footnoteS2],                  radius: 120 * AUtoMeters ),
    (name: [#s2 Apobothron],                              radius: 1838 * AUtoMeters ),
    (name: [Earth],                                       radius: earthToSgrADistance ),
    (name: [Andromeda Galaxy],                            radius: 2.5e6 * lightYear )
)

#dilationTable(
  caption: [Sagittarius #aStar Gravitational time dilation relative to Infinity $(r_1)$],
  mass: sgrAMass,
  r1: float.inf,
  locations: sgrAPois,
  radius_header: [Radius],
  radius_transform: loc => context{

    // Setup unit list for the alignment box
    let units_list = ([au], [ly])
    let widest = calc.max(..units_list.map(u => measure(u).width))

    if loc.radius < lightYear{
        fmt(loc.radius/AUtoMeters, sigFigs: 2, commas: true)
        sym.space.nobreak.narrow
        box(width: widest, align(left)[au])
    }else{
        fmt(loc.radius/lightYear, commas: true)
        sym.space.nobreak.narrow
        box(width: widest, align(left)[ly])
    }
  }
)
