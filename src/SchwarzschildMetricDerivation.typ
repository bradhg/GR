\documentclass[GR.tex]{subfiles}

\begin{document}

    \newpage
    \section{The Schwarzschild Metric Derivation}

    \subsection{The metric and it inverse}

    The Schwarzschild Metric is for the empty space near a spherically symmetric non-rotating chargeless mass.
    The coordinates are $x^𝜇 = (ct,\,r,\,𝜃,\,𝜑)$.
    We will begin with the standard ansatz for the Schwarzschild metric when $A$ and $B$ are unknow functions of $r$.
    The other two non-zero terms in the metric are determined by requiring spherical symmetry.
    Being static makes all $g_{ti}$ and $g_{it}$ terms equal zero.
    Spherical symmetry requires all $g_{r𝜃} \text{, } g_{r𝜑} \text{, and } g_{𝜃𝜑}$ terms to be zero.

    \[
        g_{𝜇𝜈} =
        \begin{bmatrix}
            A & 0 & 0   & 0           \\
            0 & B & 0   & 0           \\
            0 & 0 & r^2 & 0           \\
            0 & 0 & 0   & r^2\,\sin^2𝜃
        \end{bmatrix}
    \]

    Because the metric is diagonal the inverse metric is simply the reciprocal of each element.
    \[
        g^{𝜇𝜈} =
        \begin{bmatrix}
            \recip{A} & 0         & 0           & 0           \\
            0         & \recip{B} & 0           & 0           \\
            0         & 0         & \recip{r^2} & 0           \\
            0         & 0         & 0           & \recip{r^2\,\sin^2𝜃}
        \end{bmatrix}
    \]

    \subsection{The Partial Derivatives}

    \begin{align*}
        \pg{rtt} &= A' \\
        \pg{rrr} &= B' \\
        \pg{r𝜃𝜃} &= 2r \\
        \pg{r𝜑𝜑} &= 2r\,\sin^2𝜃 \\
        \pg{𝜃𝜑𝜑} &= 2r^2\,\sin𝜃\,\cos𝜃 \\
        others &= 0
    \end{align*}

    \subsection{The Christoffel Symbols}
    Because the metric is diagonal the Christoffel Symbols equations simplifies to the following:

    \[
        𝛤^𝜌_{𝜇𝜈} = ½ g^{𝜌𝜌} \left( \pg{𝜇𝜈𝜌} + \pg{𝜈𝜇𝜌} - \pg{𝜌𝜇𝜈} \right) \qquad \text{(no sum on $𝜌$)}
    \]

    With three indexes in 4d spacetime there are 64 Christoffel Symbols.
    But they are symmetric in the lower index so that leaves only 40.
    And because there are only 5 partial derivatives of the metric that are non-zero only the following Christoffel Symbols are non-zero.


    \begin{alignat*}{2}
        𝛤^t_{tr} = 𝛤^t_{rt} & = ½ g^{tt}\,\left( \pgz{trt} +         \pg {rtt} - \pgz{ttr}  \right) & & = \frac{ A'}{2A}                \\
        𝛤^r_{tt}            & = ½ g^{rr}\,\left( \pgz{ttr} +         \pgz{ttr} - \pg {rtt}  \right) & & = \frac{-A'}{2B}                \\
        𝛤^r_{rr}            & = ½ g^{rr}\,\left( \pg {rrr} + \cancelto{0}{\pg {rrr} - \pg {rrr}} \right) & & = \frac{ B'}{2B}           \\
        𝛤^r_{𝜃𝜃}            & = ½ g^{rr}\,\left( \pgz{𝜃𝜃r} +         \pgz{𝜃𝜃r} - \pg{r𝜃𝜃}    \right) & &= \frac{-2r}{2B} = \frac{-r}{B}  \\
        𝛤^r_{𝜑𝜑}            & = ½ g^{rr}\,\left( \pgz{𝜑𝜑r} +        \pgz{𝜑𝜑r} - \pg{r𝜑𝜑}    \right) & &= \frac{-2r\,\sin^2𝜃}{2B} = \frac{-r\,\sin^2𝜃}{B}  \\
        𝛤^𝜃_{𝜃r} = 𝛤^𝜃_{r𝜃} & = ½ g^{𝜃𝜃}\,\left( \pgz{𝜃r𝜃} +         \pg {r𝜃𝜃} - \pgz{𝜃𝜃r}   \right) & &= \frac{2r}{2r^2} = \recip{r}    \\
        𝛤^𝜃_{𝜑𝜑}            & = ½ g^{𝜃𝜃}\,\left( \pgz{𝜑𝜑𝜃} +        \pgz{𝜑𝜑𝜃} - \pg{𝜃𝜑𝜑}    \right) & &= \frac{-2r^2\,\sin𝜃\,\cos𝜃}{2 r^2} = -\sin𝜃\,\cos𝜃\\
        𝛤^𝜑_{𝜑r} = 𝛤^𝜑_{r𝜑} & = ½ g^{𝜑𝜑}\,\left( \pgz{𝜑r𝜑} +        \pg {r𝜑𝜑} - \pgz{𝜑𝜑r}   \right) & &= \frac{2r\,\sin^2𝜃}{2 r^2\,\sin^2𝜃} = \recip{r}  \\
        𝛤^𝜑_{𝜑𝜃} = 𝛤^𝜑_{𝜃𝜑} & = ½ g^{𝜑𝜑}\,\left( \pgz{𝜑𝜃𝜑} +        \pg {𝜃𝜑𝜑} - \pgz{𝜑𝜑𝜃}   \right) & &= \frac{2r^2\,\sin𝜃\,\cos𝜃}{2 r^2\,\sin^2𝜃} = \cot𝜃 \\
    \end{alignat*}

    \subsection{The Ricci Tensor}

    \subsubsection{$R_{tt}$ Component of the Ricci Tensor}
    \[
        R_{tt} = ∂_{\O𝜆} 𝛤^{\O𝜆}_{tt} - ∂_{t} 𝛤^{\O𝜆}_{t\O𝜆} + 𝛤^{\O𝜆}_{tt} 𝛤^{\G𝜌}_{\O𝜆\G𝜌} - 𝛤^{\O𝜆}_{t\G𝜌} 𝛤^{\G𝜌}_{\O𝜆t}
    \]

    \paragraph{$R_{tt}$ First Term} Only the partial with respect to $r$ will be non-zero{

                        % Ricci tt Initial-term
        \NewDocumentCommand{\RttI}{m}{\ensuremath{          ∂_{\O#1}\,𝛤^{\O#1}_{tt} }}
        \NewDocumentCommand{\RttIc}{m}{\ensuremath{\cancelto{0}{ ∂_{\O#1}\,𝛤^{\O#1}_{tt} }}}

        \begin{align*}
            \RttI{𝜆} &= \RttIc{t} + \RttI{r} + \RttIc{𝜃} + \RttIc{𝜑} \\
            &= ∂_r\,\frac{-A'}{2B} \\
            &= \frac{(-2B')(-A') + (-A'')(2B)}{4B^2} \\
            &= \frac{A'B'}{2B^2} - \frac{A''}{2B} \\
        \end{align*}
    }

    \paragraph{$R_{tt}$ Second Term} All partials with respect to $t$ are zero. \nopagebreak[4]{

        \NewDocumentCommand{\RttS}{m}{\ensuremath{          ∂_{t}\,𝛤^{\O#1}_{t\O#1} }}
        \NewDocumentCommand{\RttSc}{m}{\ensuremath{\cancelto{0}{ ∂_{t}\,𝛤^{\O#1}_{t\O#1} }}}

        \begin{align*}
            \RttS{𝜆} &= \RttSc{t} + \RttSc{r} + \RttSc{𝜃} + \RttSc{𝜑} \\
            &= 0
        \end{align*}
    }

    \paragraph{$R_{tt}$ Third Term} The only value of $𝜆$ that has a non-zero Christoffel is $r$ and then all values of $𝜌$ will have non-zero Christoffel Symbols.{

                        % Ricci tt Third-term
        \NewDocumentCommand{\RttT}{mm}{\ensuremath{          𝛤^{\O{#1}}_{tt} 𝛤^{\G{#2}}_{\O{#1}\G{#2}} }}
        \NewDocumentCommand{\RttTc}{mm}{\ensuremath{\cancelto{0}{ 𝛤^{\O{#1}}_{tt} 𝛤^{\G{#2}}_{\O{#1}\G{#2}} }}}

        \begin{align*}
            \RttT 𝜆𝜌 &=\quad\RttTc tt + \RttTc tr  + \RttTc t𝜃 + \RttTc t𝜑 \\
            &\quad+\RttT  rt + \RttT  rr + \RttT  r𝜃 + \RttT  r𝜑 \\
            &\quad+\RttTc 𝜃t + \RttTc 𝜃r + \RttTc 𝜃𝜃 + \RttTc 𝜃𝜑 \\
            &\quad+\RttTc 𝜑t + \RttTc 𝜑r + \RttTc 𝜑𝜃 + \RttTc 𝜑𝜑 \\
            %
            &= \frac{-A'}{2B} \frac{ A'}{2A} + \frac{-A'}{2B} \frac{ B'}{2B}  + \frac{-A'}{2B}\recip{r}  +\frac{-A'}{2B} \recip{r}      \\
            &= -\frac{A'^2}{4AB} - \frac{A'B'}{4B^2} + \frac{-A'}{rB} \\
        \end{align*}
    }

    \paragraph{$R_{tt}$ Fourth Term} The only non-zero Christoffel symbols have one $r$ and two $t$ indices.{

                        % Ricci tt Fourth-term
        \NewDocumentCommand{\RttF}{mm}{\ensuremath{          𝛤^{\O{#1}}_{t\G{#2}} 𝛤^{\G{#2}}_{\O{#1}t} }}
        \NewDocumentCommand{\RttFc}{mm}{\ensuremath{\cancelto{0}{ 𝛤^{\O{#1}}_{t\G{#2}} 𝛤^{\G{#2}}_{\O{#1}t} }}}

        \begin{align*}
            \RttF 𝜆𝜌 &=\quad\RttFc tt  + \RttF tr  + \RttFc t𝜃 + \RttFc t𝜑 \\
            &\quad+\RttF  rt + \RttFc rr + \RttFc r𝜃 + \RttFc r𝜑 \\
            &\quad+\RttFc 𝜃t + \RttFc 𝜃r + \RttFc 𝜃𝜃 + \RttFc 𝜃𝜑 \\
            &\quad+\RttFc 𝜑t + \RttFc 𝜑r + \RttFc 𝜑𝜃 + \RttFc 𝜑𝜑 \\
            %
            &=\frac{-A'}{2B}\frac{ A'}{2A} + \frac{ A'}{2A}\frac{-A'}{2B} \\
            &=\frac{-A'^2}{2AB}
        \end{align*}
    }

    \paragraph{$R_{tt}$ Complete}

    \begin{align*}
        r_{tt} &= \frac{A'B'}{2B^2} - \frac{A''}{2B} - 0 + \frac{-A'^2}{4AB} - \frac{A'B'}{4B^2} + \frac{-A'}{rB} -\frac{-A'^2}{2AB}  \\
        &= \frac{-A''}{2B} + \frac{A'B'}{4B^2} + \frac{A'^2}{4AB} + \frac{-A'}{rB}
    \end{align*}

    \subsubsection{$R_{rr}$ Component of the Ricci Tensor}
    \[
        R_{rr} = ∂_{\O𝜆} 𝛤^{\O𝜆}_{rr} - ∂_{r} 𝛤^{\O𝜆}_{r\O𝜆} + 𝛤^{\O𝜆}_{rr} 𝛤^{\G𝜌}_{\O𝜆\G𝜌} - 𝛤^{\O𝜆}_{r\G𝜌} 𝛤^{\G𝜌}_{\O𝜆r}
    \]

    \paragraph{$R_{rr}$ First Term} Only the partial with respect to $r$ will be non-zero{

                        % Ricci rr Initial-term
        \NewDocumentCommand{\RrrI}{m}{\ensuremath{          ∂_{\O#1}\,𝛤^{\O#1}_{rr} }}
        \NewDocumentCommand{\RrrIc}{m}{\ensuremath{\cancelto{0}{ ∂_{\O#1}\,𝛤^{\O#1}_{rr} }}}

        \begin{align*}
            \RrrI{𝜆} &= \RrrIc{t} + \RrrI{r} + \RrrIc{𝜃} + \RrrIc{𝜑} \\
            &= ∂_r\, \frac{ B'}{2B}  \\
            &= \frac{(-2B')(B') + (B'')(2B)}{4B^2} \\
            &= \frac{-B'^2}{2B^2} + \frac{B''}{2B} \\
        \end{align*}
    }

    \paragraph{$R_{rr}$ Second Term} {

    % Ricci rr Second-term
        \NewDocumentCommand{\RrrS}{m}{\ensuremath{          ∂_{r}\,𝛤^{\O#1}_{r\O#1} }}
        \NewDocumentCommand{\RrrSc}{m}{\ensuremath{\cancelto{0}{ ∂_{r}\,𝛤^{\O#1}_{r\O#1} }}}

        \begin{align*}
            \RrrS{𝜆} &= \RrrS{t} + \RrrS{r} + \RrrS{𝜃} + \RrrS{𝜑} \\
            &= ∂_{r}\,\frac{ A'}{2A} + ∂_{r}\,\frac{ B'}{2B} + ∂_{r}\,\recip{r} + ∂_{r}\,\recip{r} \\
            &= \frac{(-2A')(A') + (A'')(2A)}{4A^2} + \frac{(-2B')(B') + (B'')(2B)}{4B^2} + \frac{-1}{r^2} + \frac{-1}{r^2} \\
            &= \frac{-A'^2}{2A^2} + \frac{A''}{2A} + \frac{-B'^2}{2B^2} + \frac{B''}{2B} + \frac{-2}{r^2}
        \end{align*}
    }

    \paragraph{$R_{rr}$ Third Term} The only non-zero Christoffel symbols have one $r$ and two $t$ indices.{

                        % Ricci rr Third-term
        \NewDocumentCommand{\RrrT}{mm}{\ensuremath{          𝛤^{\O{#1}}_{rr} 𝛤^{\G{#2}}_{\O{#1}\G{#2}} }}
        \NewDocumentCommand{\RrrTc}{mm}{\ensuremath{\cancelto{0}{ 𝛤^{\O{#1}}_{rr} 𝛤^{\G{#2}}_{\O{#1}\G{#2}} }}}

        \begin{align*}
            \RrrT 𝜆𝜌 &=\quad\RrrTc tt + \RrrTc tr  + \RrrTc t𝜃 + \RrrTc t𝜑 \\
            &\quad+\RrrT  rt + \RrrT  rr + \RrrT  r𝜃 + \RrrT  r𝜑 \\
            &\quad+\RrrTc 𝜃t + \RrrTc 𝜃r + \RrrTc 𝜃𝜃 + \RrrTc 𝜃𝜑 \\
            &\quad+\RrrTc 𝜑t + \RrrTc 𝜑r + \RrrTc 𝜑𝜃 + \RrrTc 𝜑𝜑 \\
            %
            &=  \frac{ B'}{2B} \frac{ A'}{2A}  + \frac{ B'}{2B}\frac{ B'}{2B} + \frac{ B'}{2B} \recip{r}    +\frac{ B'}{2B} \recip{r}  \\
            &=  \frac{ A'B'}{4AB} + \frac{ B'^2}{4B^2} + \frac{ B'}{rB}  \\
        \end{align*}
    }

    \paragraph{$R_{rr}$ Fourth Term} The only non-zero Christoffel symbols have one $r$ and two $t$ indices.{

                        % Ricci rr Fourth-term
        \NewDocumentCommand{\RrrF}{mm}{\ensuremath{          𝛤^{\O{#1}}_{r\G{#2}} 𝛤^{\G{#2}}_{\O{#1}r} }}
        \NewDocumentCommand{\RrrFc}{mm}{\ensuremath{\cancelto{0}{ 𝛤^{\O{#1}}_{r\G{#2}} 𝛤^{\G{#2}}_{\O{#1}r} }}}

        \begin{align*}
            \RrrF 𝜆𝜌 &=\quad\RrrF  tt + \RrrFc tr + \RrrFc t𝜃 + \RrrFc t𝜑 \\
            &\quad+\RrrFc rt + \RrrF  rr + \RrrFc r𝜃 + \RrrFc r𝜑 \\
            &\quad+\RrrFc 𝜃t + \RrrFc 𝜃r + \RrrF  𝜃𝜃 + \RrrFc 𝜃𝜑 \\
            &\quad+\RrrFc 𝜑t + \RrrFc 𝜑r + \RrrFc 𝜑𝜃 + \RrrF  𝜑𝜑 \\
            %
            &=  \frac{ A'}{2A}\,\frac{ A'}{2A} + \frac{ B'}{2B}\,\frac{ B'}{2B} + \recip{r}\recip{r} + \recip{r}\recip{r}  \\
            &=  \frac{ A'^2}{4A^2} + \frac{ B'^2}{4B^2} + \frac{2}{r^2} \\
        \end{align*}
    }

    \paragraph{$R_{rr}$ Complete}

    \begin{align*}
        r_{rr} &=\quad \frac{-B'^2}{2B^2} + \frac{B''}{2B} \\
        &\quad- \left( \frac{-A'^2}{2A^2} + \frac{A''}{2A} + \frac{-B'^2}{2B^2} + \frac{B''}{2B} + \frac{-2}{r^2}  \right) \\
        &\quad+ \frac{ A'B'}{4AB} + \frac{ B'^2}{4B^2} + \frac{ B'}{rB} \\
        &\quad- \left(  \frac{ A'^2}{4A^2} + \frac{ B'^2}{4B^2} + \frac{2}{r^2} \right) \\
        &=\quad \frac{-A''}{2A} + \frac{ A'B'}{4AB} +\frac{ A'^2}{4A^2}  + \frac{ B'}{rB}
    \end{align*}


    \subsubsection{$R_{𝜃𝜃}$ Component of the Ricci Tensor}
    \[
        R_{𝜃𝜃} = ∂_{\O𝜆} 𝛤^{\O𝜆}_{𝜃𝜃} - ∂_{𝜃} 𝛤^{\O𝜆}_{𝜃\O𝜆} + 𝛤^{\O𝜆}_{𝜃𝜃} 𝛤^{\G𝜌}_{\O𝜆\G𝜌} - 𝛤^{\O𝜆}_{𝜃\G𝜌} 𝛤^{\G𝜌}_{\O𝜆𝜃}
    \]

    \paragraph{$R_{𝜃𝜃}$ First Term}{

    % Ricci 𝜃𝜃 Initial-term
        \NewDocumentCommand{\RhhI}{m}{\ensuremath{          ∂_{\O#1}\,𝛤^{\O#1}_{𝜃𝜃} }}
        \NewDocumentCommand{\RhhIc}{m}{\ensuremath{\cancelto{0}{ ∂_{\O#1}\,𝛤^{\O#1}_{𝜃𝜃} }}}

        \begin{align*}
            \RhhI{𝜆} &= \RhhIc{t} + \RhhI{r} + \RhhIc{𝜃} + \RhhIc{𝜑} \\
            &= ∂_r\,  \frac{-r}{B}  \\
            &=  \frac{(-B')(-r) + (-1)(B)}{B^2} \\
            &=  \frac{rB'}{B^2} + \frac{-1}{B}\\
        \end{align*}
    }

    \paragraph{$R_{𝜃𝜃}$ Second Term} {

    % Ricci 𝜃𝜃 Second-term
        \NewDocumentCommand{\RhhS}{m}{\ensuremath{          ∂_{𝜃}\,𝛤^{\O#1}_{𝜃\O#1} }}
        \NewDocumentCommand{\RhhSc}{m}{\ensuremath{\cancelto{0}{ ∂_{𝜃}\,𝛤^{\O#1}_{𝜃\O#1} }}}

        \begin{align*}
            \RhhS{𝜆} &= \RhhSc{t} + \RhhSc{r} + \RhhSc{𝜃} + \RhhS{𝜑} \\
            &= ∂_{𝜃}\,\cot𝜃 \\
            &=  \frac{-1}{\sin^2𝜃}\\
            &=  - csc^2𝜃  \\
        \end{align*}
    }

    \paragraph{$R_{𝜃𝜃}$ Third Term} The only non-zero Christoffel symbols have one $r$ and two $t$ indices.{

                        % Ricci 𝜃𝜃 Third-term
        \NewDocumentCommand{\RhhT}{mm}{\ensuremath{          𝛤^{\O{#1}}_{𝜃𝜃} 𝛤^{\G{#2}}_{\O{#1}\G{#2}} }}
        \NewDocumentCommand{\RhhTc}{mm}{\ensuremath{\cancelto{0}{ 𝛤^{\O{#1}}_{𝜃𝜃} 𝛤^{\G{#2}}_{\O{#1}\G{#2}} }}}

        \begin{align*}
            \RhhT 𝜆𝜌 &=\quad\RhhTc tt + \RhhTc tr  + \RhhTc t𝜃 + \RhhTc t𝜑 \\
            &\quad+\RhhT  rt + \RhhT  rr + \RhhT  r𝜃 + \RhhT  r𝜑 \\
            &\quad+\RhhTc 𝜃t + \RhhTc 𝜃r + \RhhTc 𝜃𝜃 + \RhhTc 𝜃𝜑 \\
            &\quad+\RhhTc 𝜑t + \RhhTc 𝜑r + \RhhTc 𝜑𝜃 + \RhhTc 𝜑𝜑 \\
            %
            &= \frac{-r}{B} \frac{ A'}{2A}   + \frac{-r}{B} \frac{ B'}{2B}  + \frac{-r}{B} \recip{r}   + \frac{-r}{B} \recip{r}     \\
            &= \frac{-rA'}{2AB}             + \frac{-rB'}{2B^2}             + \frac{-2}{B}      \\
        \end{align*}
    }

    \paragraph{$R_{𝜃𝜃}$ Fourth Term} The only non-zero Christoffel symbols have one $r$ and two $t$ indices.{

                        % Ricci 𝜃𝜃 Fourth-term
        \NewDocumentCommand{\RhhF}{mm}{\ensuremath{          𝛤^{\O{#1}}_{𝜃\G{#2}} 𝛤^{\G{#2}}_{\O{#1}𝜃} }}
        \NewDocumentCommand{\RhhFc}{mm}{\ensuremath{\cancelto{0}{ 𝛤^{\O{#1}}_{𝜃\G{#2}} 𝛤^{\G{#2}}_{\O{#1}𝜃} }}}

        \begin{align*}
            \RhhF 𝜆𝜌 &=\quad\RhhFc tt + \RhhFc tr + \RhhFc t𝜃 + \RhhFc t𝜑 \\
            &\quad+\RhhFc rt + \RhhFc rr + \RhhF  r𝜃 + \RhhFc r𝜑 \\
            &\quad+\RhhFc 𝜃t + \RhhF  𝜃r + \RhhFc 𝜃𝜃 + \RhhFc 𝜃𝜑 \\
            &\quad+\RhhFc 𝜑t + \RhhFc 𝜑r + \RhhFc 𝜑𝜃 + \RhhF  𝜑𝜑 \\
            %
            &= \left(\frac{-r}{B}\right) \left(\recip{r}\right)  + \left(\recip{r}\right) \left(\frac{-r}{B}\right) + (\cot𝜃)(\cot𝜃) \\
            &=  \frac{-2}{B} + \cot^2𝜃   \\
        \end{align*}
    }

    \paragraph{$R_{𝜃𝜃}$ Complete}

    \begin{align*}
        r_{𝜃𝜃} &=\quad  \frac{rB'}{B^2} + \frac{-1}{B} \\
        &\quad- \left( - csc^2𝜃  \right) \\
        &\quad+ \frac{-rA'}{2AB}             + \frac{-rB'}{2B^2}             + \frac{-2}{B}   \\
        &\quad- \left( \frac{-2}{B} + \cot^2𝜃   \right) \\
        &= \frac{-rA'}{2AB} + \frac{rB'}{2B^2} + \frac{-1}{B} + csc^2𝜃 -\cot^2𝜃  \\
        &= \frac{-rA'}{2AB} + \frac{rB'}{2B^2} + \frac{-1}{B} + 1
    \end{align*}

    %===================================================================================================================
    \subsubsection{$R_{𝜑𝜑}$ Component of the Ricci Tensor}
    \[
        R_{𝜑𝜑} = ∂_{\O𝜆} 𝛤^{\O𝜆}_{𝜑𝜑} - ∂_{𝜑} 𝛤^{\O𝜆}_{𝜑\O𝜆} + 𝛤^{\O𝜆}_{𝜑𝜑} 𝛤^{\G𝜌}_{\O𝜆\G𝜌} - 𝛤^{\O𝜆}_{𝜑\G𝜌} 𝛤^{\G𝜌}_{\O𝜆𝜑}
    \]

    \paragraph{$R_{𝜑𝜑}$ First Term}{

    % Ricci 𝜑𝜑 Initial-term
        \NewDocumentCommand{\RppI}{m}{\ensuremath{          ∂_{\O#1}\,𝛤^{\O#1}_{𝜑𝜑} }}
        \NewDocumentCommand{\RppIc}{m}{\ensuremath{\cancelto{0}{ ∂_{\O#1}\,𝛤^{\O#1}_{𝜑𝜑} }}}

        \begin{align*}
            \RppI{𝜆} &= \RppIc{t} + \RppI{r} + \RppI{𝜃} + \RppIc{𝜑} \\
            &= ∂_r\left(\frac{-r\,\sin^2𝜃}{B}\right) + ∂_{𝜃}(-\sin𝜃\,\cos𝜃)  \\
            &= \frac{(B)(-\sin^2𝜃) - (-r\,\sin^2𝜃)(B')}{B^2} + (-\sin𝜃)(-\sin𝜃) + (\cos𝜃)(-\cos𝜃) \\
            &= \frac{-\sin^2𝜃}{B} + \frac{r\,\sin^2𝜃\,B'}{B^2} + \sin^2𝜃 -\cos^2𝜃   \\
        \end{align*}
    }

    \paragraph{$R_{𝜑𝜑}$ Second Term} {

    % Ricci 𝜑𝜑 Second-term
        \NewDocumentCommand{\RppS}{m}{\ensuremath{          ∂_{𝜑}\,𝛤^{\O#1}_{𝜑\O#1} }}
        \NewDocumentCommand{\RppSc}{m}{\ensuremath{\cancelto{0}{ ∂_{𝜑}\,𝛤^{\O#1}_{𝜑\O#1} }}}

        \begin{align*}
            \RppS{𝜆} &= \RppSc{t} + \RppSc{r} + \RppSc{𝜃} + \RppSc{𝜑} \\
            &= 0 \\
        \end{align*}
    }

    \paragraph{$R_{𝜑𝜑}$ Third Term} The only non-zero Christoffel symbols have one $r$ and two $t$ indices.\nopagebreak[4]{

    % Ricci 𝜑𝜑 Third-term

        \NewDocumentCommand{\RppT}{mm}{\ensuremath{               𝛤^{\O{#1}}_{𝜑𝜑} 𝛤^{\G{#2}}_{\O{#1}\G{#2}} }}
        \NewDocumentCommand{\RppTc}{mm}{\ensuremath{\cancelto{0}{ 𝛤^{\O{#1}}_{𝜑𝜑} 𝛤^{\G{#2}}_{\O{#1}\G{#2}} }}}


        \begin{align*}
            \RppT 𝜆𝜌 &=\quad\RppTc tt + \RppTc tr  + \RppTc t𝜃 + \RppTc t𝜑 \\
            &\quad+\RppT  rt + \RppT  rr + \RppT  r𝜃 + \RppT  r𝜑 \\
            &\quad+\RppTc 𝜃t + \RppTc 𝜃r + \RppTc 𝜃𝜃 + \RppT 𝜃𝜑 \\
            &\quad+\RppTc 𝜑t + \RppTc 𝜑r + \RppTc 𝜑𝜃 + \RppTc 𝜑𝜑 \\
            %
            &= \mathsmaller{
                \frap{-r\,\sin^2𝜃}{B} \frap{ A'}{2A} + \frap{-r\,\sin^2𝜃}{B} \frap{ B'}{2B}  + \frap{-r\,\sin^2𝜃}{B} \frap{1}{r} + \frap{-r\,\sin^2𝜃}{B} \frap{1}{r}
            }\\
            &\quad + (-\sin𝜃\,\cos𝜃)(\cot𝜃)   \\
            &=  \frac{-r\,\sin^2𝜃\,A'}{2AB} + \frac{-r\,\sin^2𝜃\,B'}{2B^2} + \frac{-2\sin^2𝜃}{B} - \cos^2𝜃  \\
        \end{align*}
    }

    \paragraph{$R_{𝜑𝜑}$ Fourth Term} The only non-zero Christoffel symbols have one $r$ and two $t$ indices.{

                        % Ricci 𝜑𝜑 Fourth-term
        \NewDocumentCommand{\RppF}{mm}{\ensuremath{          𝛤^{\O{#1}}_{𝜑\G{#2}} 𝛤^{\G{#2}}_{\O{#1}𝜑} }}
        \NewDocumentCommand{\RppFc}{mm}{\ensuremath{\cancelto{0}{ 𝛤^{\O{#1}}_{𝜑\G{#2}} 𝛤^{\G{#2}}_{\O{#1}𝜑} }}}

        \begin{align*}
            \RppF 𝜆𝜌 &=\quad\RppFc tt + \RppFc tr + \RppFc t𝜃 + \RppFc t𝜑 \\
            &\quad+\RppFc rt + \RppFc rr + \RppFc r𝜃 + \RppF  r𝜑 \\
            &\quad+\RppFc 𝜃t + \RppFc 𝜃r + \RppFc 𝜃𝜃 + \RppF  𝜃𝜑 \\
            &\quad+\RppFc 𝜑t + \RppF  𝜑r + \RppF 𝜑𝜃 + \RppFc  𝜑𝜑 \\
            %
            &=\quad \frap{-r\,\sin^2𝜃}{B} \frap{1}{r} + (-\sin𝜃\,\cos𝜃)(\cot𝜃) \\
            &\quad+ \frap{1}{r}\frap{-r\,\sin^2𝜃}{B} + (\cot𝜃)(-\sin𝜃\,\cos𝜃)  \\
            &=  \frac{-2\sin^2𝜃}{B} - 2\cos^2𝜃     \\
        \end{align*}
    }

    \paragraph{$R_{𝜑𝜑}$ Complete}

    \begin{align*}
        r_{𝜑𝜑} &=\quad \frac{-\sin^2𝜃}{B} + \frac{r\,\sin^2𝜃\,B'}{B^2}  + \sin^2𝜃 -\cos^2𝜃  \\
        &\quad- 0  \\
        &\quad+  \frac{-r\,\sin^2𝜃\,A'}{2AB} + \frac{-r\,\sin^2𝜃\,B'}{2B^2} + \frac{-2\sin^2𝜃}{B} - \cos^2𝜃  \\
        &\quad- \left( \frac{-2\sin^2𝜃}{B} - 2\cos^2𝜃   \right) \\
        &= \frac{-r\,\sin^2𝜃\,A'}{2AB} + \frac{r\,\sin^2𝜃\,B'}{2B^2} + \frac{-\sin^2𝜃}{B} + \sin^2𝜃 \\
        &= \sin^2𝜃 \left( \frac{-rA'}{2AB} + \frac{rB'}{2B^2} + \frac{-1}{B} + 1 \right)  \\
    \end{align*}



    \subsubsection{The Ricci Tensor}

    {\tiny
        \[
            \begin{bmatrix}
                \frac{-A''}{2B} + \frac{A'B'}{4B^2} + \frac{A'^2}{4AB} + \frac{-A'}{rB} & 0 & 0   & 0           \\
                0 &  \frac{-A''}{2A} + \frac{ A'B'}{4AB} +\frac{ A'^2}{4A^2}  + \frac{ B'}{rB} & 0   & 0           \\
                0 & 0 & \frac{-rA'}{2AB} + \frac{rB'}{2B^2} + \frac{-1}{B} + 1 & 0           \\
                0 & 0 & 0   & \sin^2𝜃 \left( \frac{-rA'}{2AB} + \frac{rB'}{2B^2} + \frac{-1}{B} + 1 \right)
            \end{bmatrix}
        \]
    }

    In the normal derivation of the Schwarzschild metric, at this point the fact that the Ricci Tensor is all zeros is used.
    However, I could not convince myself of the truth of that statement, so I decided to continue without it.

    \subsection{The Ricci scalar}

    \begin{align*}
        R &= g^{\O𝜇\G𝜈}\,R_{\O𝜇\G𝜈} \\[6pt]
        %
        R &=\quad \recip{A}\left( \frac{-A''}{2B} + \frac{A'B'}{4B^2} + \frac{A'^2}{4AB} + \frac{-A'}{rB}\right)       \\
        &\quad+ \recip{B}\left( \frac{-A''}{2A} + \frac{ A'B'}{4AB} +\frac{ A'^2}{4A^2}  + \frac{ B'}{rB} \right)   \\
        &\quad+ \recip{r^2}\left( \frac{-rA'}{2AB} + \frac{rB'}{2B^2} + \frac{-1}{B} + 1 \right) \\
        &\quad+ \recip{r^2\,\sin^2𝜃}\left( \sin^2𝜃 \left( \frac{rA'}{2AB} + \frac{rB'}{2B^2} + \frac{-1}{B} + 1 \right) \right) \\[6pt]
        %
        &=\quad \frac{-A''}{2AB} + \frac{A'B'}{4AB^2} +\frac{A'^2}{4A^2 B} + \frac{-A'}{rAB}       \\
        &\quad+ \frac{-A''}{2AB} + \frac{A'B'}{4AB^2} +\frac{A'^2}{4A^2 B} + \frac{B'}{rB^2}   \\
        &\quad+ \frac{-A'}{2rAB} + \frac{B'}{2rB^2} + \frac{-1}{r^2 B} + \recip{r^2}  \\
        &\quad+ \frac{-A'}{2rAB} + \frac{B'}{2rB^2} + \frac{-1}{r^2 B} + \recip{r^2}  \\[6pt]
        %
        &= \frac{-A''}{AB} + \frac{A'B'}{2AB^2} +\frac{A'^2}{2A^2 B} + \frac{-2A'}{rAB} + \frac{2B'}{rB^2} + \frac{-2}{r^2 B} + \frac{2}{r^2}      \\
    \end{align*}

    %===================================================================================================================
    \newpage
    \subsection{The Einstein Field Equation}
    \subsubsection{The $tt$ Einstein Field Equation}

    \begin{gather*}
        R_{tt} - ½\, g_{tt}\,R = 0 \\[6pt]
        %
        -\frac{A''}{2B} + \frac{A'B'}{4B^2} + \frac{A'^2}{4AB} - \frac{A'}{rB}            \\
        - ½\, A\,\left( - \frac{A''}{AB} + \frac{A'B'}{2AB^2} +\frac{A'^2}{2A^2 B} - \frac{2A'}{rAB} + \frac{2B'}{rB^2} - \frac{2}{r^2 B} + \frac{2}{r^2}   \right) = 0 \\
        \shortintertext{distribute $-1/2\,A$}
        - \frac{A''}{2B} + \frac{A'B'}{4B^2} + \frac{A'^2}{4AB} - \frac{A'}{rB}            \\
        +\frac{A''}{2B} - \frac{A'B'}{4B^2} -\frac{A'^2}{4A B} + \frac{A'}{rB} - \frac{AB'}{rB^2} + \frac{A}{r^2 B} - \frac{A}{r^2} = 0 \\
        \shortintertext{cancel opposites}
        - \frac{AB'}{rB^2} + \frac{A}{r^2 B} - \frac{A}{r^2}  = 0 \\
        \shortintertext{multiply by $-r/A$ and move the last term to the right hand side}
        \frac{B'}{B^2} - \recip{rB} = - \recip{r} \\
        \shortintertext{This is a Bernoulli differential equation. Substitute $V=-1/B$ and $V'=B'/B^2$}
        V' + \frac{V}{r}  = -\recip{r}  \\
        \shortintertext{compute integrating factor, $e^{\int 1/r\,dr} = e^{\ln r} = r$, and multiply by it}
        rV' + V = -1 \\
        (rV)' = -1  \\
        \shortintertext{integrate both sides}
        \int (rV)' = -\,\int 1\,dr \\
        rV = -r + C_1 \\
        V = -1 + C_1/r \\
        \shortintertext{recall $V = -1/B$ so $B = -1/V$}
        B = \frac{-1}{-1 +C_1/r}  \\
        \boxed{B = \recip{1 - C_1/r}}  \\
        \shortintertext{notice that this correctly matches the boundary condition $B(∞) = 𝜂_{rr} = 1$}
    \end{gather*}


    %-------------------------------------------------------------------------------------------------------------------
    \newpage
    \subsubsection{The $rr$ Einstein Field Equation}

    \begin{gather*}
        R_{rr} - ½\, g_{rr}\,R = 0  \\[6pt]
        %
        - \frac{A''}{2A} + \frac{ A'B'}{4AB} +\frac{ A'^2}{4A^2}  + \frac{ B'}{rB}       \\
        - ½\,B\,\left( - \frac{A''}{AB} + \frac{A'B'}{2AB^2} +\frac{A'^2}{2A^2 B} - \frac{2A'}{rAB} + \frac{2B'}{rB^2} - \frac{2}{r^2 B} + \frac{2}{r^2} \right) = 0 \\
        \shortintertext{distribute $- ½\,B$}
        - \frac{A''}{2A} + \frac{ A'B'}{4AB} +\frac{ A'^2}{4A^2} + \frac{B'}{rB}          \\
        +\frac{A''}{2A} - \frac{A'B'}{4AB} - \frac{A'^2}{4A^2} + \frac{A'}{rA} - \frac{B'}{rB} + \frac{1}{r^2} - \frac{B}{r^2} = 0 \\
        \shortintertext{cancel opposite terms}
        \frac{A'}{rA} + \frac{1}{r^2} - \frac{B}{r^2} = 0 \\
        \shortintertext{multiply remaining terms by r and separate variables}
        \frac{A'}{A} = \recip{r}B - \recip{r} \\
        \shortintertext{substitute the value of B derived from the $tt$ field equation}
        \frac{A'}{A} = \recip{r} \recip{1 - C_1/r} - \recip{r} \\
        \shortintertext{simplify}
        \frac{A'}{A} = \recip{r - C_1} - \recip{r} \\
        \shortintertext{integrate both sides}
        \int \frac{A'}{A} dr = \int \left( \recip{r - C_1} - \recip{r} \right) dr \\
        \ln|A| = \ln|r-C_1| - \ln(r) + C_2 \\
        \shortintertext{raise both sides to e}
        e^{ \ln|A|} = e^{ (\ln|r-C_1| - \ln(r) + C_2 )} \\
        \shortintertext{simplify}
        A = K (r-C_1)\recip{r} \\
        \shortintertext{distribute 1/r}
        A = K(1-C_1/r) \\
        \shortintertext{apply boundary condition $A(∞) = 𝜂_{tt} = -1$ to determine $K=-1$ }
        \boxed{A = -\,(1 - C_1/r)} \\
    \end{gather*}

    %-------------------------------------------------------------------------------------------------------------------
    \newpage
    \subsubsection{Solve for $C_1$}

    \paragraph{$A$ and $B$} along with the relationship between them and a derivative.
    \begin{gather*}
        A = -\,(1 - C_1/r)     \\
        B = \recip{1 - C_1/r} \\
        B = \frac{-1}{A} \\
        A' = \frac{-C_1}{r^2} \\
    \end{gather*}

    \paragraph{Spacetime Coordinates and Proper Time}

    \begin{gather*}
        \shortintertext{these are the spherical spacetime coordinates as functions of proper time $𝜏$.
        The $t$ coordinate is multiplied by $c$ so that all four coordinates will be in $length$ units.}
        x^𝜇 = (c\,t(𝜏),\, r(𝜏),\, 𝜃(𝜏),\, 𝜑(𝜏)) \\
        \shortintertext{where $𝜏$ is defined by the following relation}
        -c^2 d𝜏^2 = ds^2 = g_{\O𝜇 \G𝜈} dx^{\O𝜇} dx^{\G𝜈} \\
        \shortintertext{For a non moving obj at some distance $r$ from the center of a sphere the coordinates  are}
        x^𝜇 = (c\,t(𝜏),\, r,\, 𝜃,\, 𝜑 )
    \end{gather*}


    \paragraph{The Four-Velocity}

    \begin{align}
        \shortintertext{The four-velocity is the ordinary derivative of the spacetime coordinates with respect to proper time.}
        u^𝜇 = \frac{dx^u}{d𝜏} = \left( \frac{d(ct)}{d𝜏},\, \frac{dr}{d𝜏},\, \frac{d𝜃}{d𝜏},\, \frac{d𝜑}{d𝜏} \right) \\
        \shortintertext{For a motionless object this reduces to}
        u^𝜇 = \left( \frac{d(ct)}{d𝜏},\, 0,\, 0,\, 0 \right) \\
        \shortintertext{Solve for $\frac{d(ct)}{d𝜏}$ of a motionless object using the Schwarzschild metric }
        -c^2\,d𝜏^2 = g_{\O𝜇 \G𝜈}\,dx^{\O𝜇}\,dx^{\G𝜈} \\
        -c^2\,d𝜏^2 = A\,(d(ct))^2 + B\,dr^2 + r^2\,d𝜃^2 +  r^2\,\sin^2𝜃 d𝜑
        \shortintertext{divide both sides by $d𝜏^2$ and recall that in this case the positonal derivatives are zero}
        -c^2 = A\,\left( \frac{d(ct)}{d𝜏} \right)^2 + B\,\cancelto{0}{\left(\frac{dr}{d𝜏} \right)^2} + r^2\,\cancelto{0}{\left(\frac{d𝜃}{d𝜏} \right)^2} +  r^2\,\sin^2𝜃 \cancelto{0}{\left(\frac{d𝜑}{d𝜏} \right)^2} \\
    \end{align}

    \begin{align}
        \shortintertext{simplify}
        \frac{d(ct)}{d𝜏} &= \sqrt{\frac{-c^2}{A}} = c\,\sqrt{\frac{-1}{A}}  \\
        \shortintertext{recall $B=-1/A$}
        \frac{d(ct)}{d𝜏} &= c\,\sqrt{B}         \label{eq:dt_dtau_B}  \\
    \end{align}

    \begin{align}
        \shortintertext{so the four-velocity is}
        u^𝜇 = \left( c\,\sqrt{B},\, 0,\, 0,\, 0\, \right)
        \shortintertext{As a check, verify the following invariant}
        -c^2 ≟ u^𝜇\,u_𝜇 \\
        -c^2 ≟ g_{tt}\,u^t\,u^t \\
        -c^2 ≟ A \left(c\,\sqrt{B} \right) \left(c\,\sqrt{B}\right) \\
        -c^2 ≟ A\, c^2\,B \\
        \shortintertext{again recalling $B = -1/A$}
        -c^2 ≡ -c^2 \quad ✓ \\
    \end{align}


    \paragraph{The Four-Acceleration}

    \begin{gather*}
        \shortintertext{The four-acceleration is the Total Covariant Derivative with respect to proper time}
        a^𝜇 = \frac{Du^𝜇}{D𝜏} = \left( \frac{du^𝜇}{d𝜏} + 𝛤^{𝜇}_{\O𝜈\G𝜌}\,u^{\O𝜈}\,u^{\G𝜌} \right) \\
        \shortintertext{Compute the four-acceleration for a motionless object in Schwarzchild space. The only non-zero component will be $a^r$.}
        a^r = \frac{Du^r}{D𝜏} = \left( \cancelto{0}{\frac{du^r}{d𝜏}} + 𝛤^{r}_{\O𝜈\G𝜌}\,u^{\O𝜈}\,u^{\G𝜌} \right)  \\
        a^r = 𝛤^{r}_{tt}\,u^{t}\,u^{t} \\
        a^r = \frac{-A'}{2B} \left(c\,\sqrt{B}\right)^2 \\
        \shortintertext{the $B$s cancel}
        a^r = \frac{-c^2\,A'}{2} \\
        \shortintertext{So the four-acceleration is:}
        a^𝜇 = \left(0,\,\frac{-c^2\,A'}{2},\,0,\,0 \right)
        \shortintertext{The proper acceleration is the acceleration measured by an accelerometer. It is given by the following:}
        𝛼 = \sqrt{a^{\O𝜇}\,a_{\O𝜇}} = \sqrt{ g_{\O𝜇 \G𝜈}\,a^{\O𝜇}\,a^{\G𝜈}}
        \shortintertext{For Schwarschild, since only $a^r$ is non zero, this reduces to}
        𝛼 =\sqrt{a^r\,a_r} = \sqrt{g_{rr}\,a^r\,a^r} \\
        𝛼 = a^r\,\sqrt{g_{rr}} \\
        \shortintertext{substitute in the equations for $a^r$ and $g_{rr}$}
        𝛼 = \frac{-c^2\,A'}{2}\,\sqrt{B} \\
        \shortintertext{and then subsitute in the equations $A'$ and $B$}
        𝛼 = \frac{c^2\,C_1}{2\,r^2}\,\sqrt{ \recip{1 - C_1/r}}
        \shortintertext{Newtons law of universal gravitation is}
        F = \frac{G\,M\,m}{r^2}
        \shortintertext{divide by $m$ to get Newtonian gravitational acceleration}
        a = \frac{G\,M}{r^2}
        \shortintertext{Make Schwarschild GR proper acceleration approximate Newtonian graviatational acceleration.}
        \frac{G\,M}{r^2} ≈  \frac{c^2\,C_1}{2\,r^2} \sqrt{ \recip{1 - C_1/r}}
        \shortintertext{Guess that $C_1/r « 1$}
        \frac{G\,M}{r^2} ≈ \frac{c^2\,C_1}{2\,r^2} \cancelto{1}{\sqrt{ \recip{1 - \cancelto{«1}{C_1/r}}}} \\
        \shortintertext{solve for $C_1$}
        C_1 ≈ \frac{2\,G\,M}{c^2} \\
        \shortintertext{At the surface of the earth $C_1/r = 1.4 \times 10^{-9}$ which is $«1$.
        And Actually, since $G$ is measured and GR is the more accurate representations of reality, this is the exact value of $C_1$.}
        C_1 = \frac{2\,G\,M}{c^2} \\
        \shortintertext{Substituting $C_1$ into the equation for proper acceleration gives the exact GR equation.}
        𝛼 = \frac{G\,M}{r^2} \sqrt{ \recip{1 - \frac{2\,G\,M}{c^2\,r}}} \\
        \shortintertext{Which means the Newtonian equation is the approximation.}
        a ≈ \frac{G\,M}{r^2}
        \shortintertext{substitute $C_1$ into $A$ and $B$}
        \boxed{A = -\left(1 - \frac{2\,G\,M}{c^2\,r}\right)\quad B = \recip{1 - \frac{2\,G\,M}{c^2\,r}} } \\
    \end{gather*}

    \subsection{The Schwarzschild Metric}
    \[
        g_{𝜇𝜈} =
        \begin{bmatrix}
            -\left(1 - \frac{2\,G\,M}{c^2\,r}\right) & 0                                  & 0   & 0           \\
            0                                        & \recip{1 - \frac{2\,G\,M}{c^2\,r}} & 0   & 0           \\
            0                                        & 0                                  & r^2 & 0           \\
            0                                        & 0                                  & 0   & r^2\,\sin^2𝜃
        \end{bmatrix}
    \]

    \subsection{The Christoffel Symbols}

    \begin{gather*}
        B = \frac{-1}{A}     \\
        B' = \frac{A'}{A^2}
    \end{gather*}

    Use the above to eliminate $B$ and $B'$ from these Christoffel Symbols.

    \begin{alignat*}{2}
        𝛤^r_{tt}            &= \frac{-A'}{2B}  = \frac{A\,A'}{2}    \\
        𝛤^r_{rr}            &= \frac{ B'}{2B}  = \frac{\frac{A'}{A^2}}{2\frac{-1}{A}} = \frac{-A'}{2A}      \\
        𝛤^r_{𝜃𝜃}            &= \frac{-r}{B} = A\,r                  \\
        𝛤^r_{𝜑𝜑}            &= \frac{-r\,\sin^2𝜃}{B} = A\,r\,\sin^2𝜃  \\
    \end{alignat*}

    And then substitute,

    \begin{gather*}
        A = -\left(1 - \frac{2\,G\,M}{c^2\,r}\right)     \\
        A' = \frac{-2\,G\,M}{c^2\,r^2}
    \end{gather*}

    into the Christoffel Symbols and do a little simplification and reordering

    \begin{align*}
        𝛤^t_{tr} = 𝛤^t_{rt} &= \frac{ A'}{2A}  = \frac{\left(  \frac{-2\,G\,M}{c^2\,r^2} \right)}{2\,\left[-\left(1 - \frac{2\,G\,M}{c^2\,r}\right)\right]}  = \frac{G\,M}{r^2}\,\left( \recip{c^2\,\left(1 - \frac{2\,G\,M}{c^2\,r}\right) }\right)       \\
        𝛤^r_{tt}            &= \frac{A\,A'}{2} = \frac{-\,\left( 1 - \frac{2\,G\,M}{c^2\,r}\right)\,\left(  \frac{-2\,G\,M}{c^2\,r^2} \right)}{2} = \frac{G\,M}{r^2} \left( \frac{ 1 - \frac{2\,G\,M}{c^2\,r} }{c^2}\right)   \\
        𝛤^r_{rr}            &= \frac{-A'}{2A}  = -\,𝛤^t_{tr}= -\,\frac{G\,M}{r^2}\,\left( \recip{c^2\,\left(1 - \frac{2\,G\,M}{c^2\,r}\right) }\right)\\
        𝛤^r_{𝜃𝜃}            &= A\,r            = -\,\left( 1 - \frac{2\,G\,M}{c^2\,r} \right)\,r  = -\,r\,\left( 1 - \frac{2\,G\,M}{c^2\,r} \right)                \\
        𝛤^r_{𝜑𝜑}            &=  A\,r\,\sin^2𝜃 = -\,\left( 1 - \frac{2\,G\,M}{c^2\,r}\right) \,r\,\sin^2𝜃 = -\,r\,\sin^2𝜃\,\left( 1 - \frac{2\,G\,M}{c^2\,r}\right) \\
    \end{align*}

    \newcommand{\pos}{\mathmakebox[\widthof{$-\,$}]{}}

    Finally here are the Schwarzschild Christoffel symbols:

    \begin{align*}
        𝛤^t_{tr} = 𝛤^t_{rt} &= \pos \frac{G\,M}{r^2}\,\left( \recip{c^2\,\left(1 - \frac{2\,G\,M}{c^2\,r}\right) }\right)       \\
        𝛤^r_{tt}            &= \pos \frac{G\,M}{r^2} \left( \frac{ 1 - \frac{2\,G\,M}{c^2\,r} }{c^2}\right)   \\
        𝛤^r_{rr}            &=  -\, \frac{G\,M}{r^2}\,\left( \recip{c^2\,\left(1 - \frac{2\,G\,M}{c^2\,r}\right) }\right)\\
        𝛤^r_{𝜃𝜃}            &=  -\, r\,\left( 1 - \frac{2\,G\,M}{c^2\,r} \right)                \\
        𝛤^r_{𝜑𝜑}            &=  -\, r\,\sin^2𝜃\,\left( 1 - \frac{2\,G\,M}{c^2\,r}\right) \\
        𝛤^𝜃_{𝜃r} = 𝛤^𝜃_{r𝜃} &= \pos \recip{r}    \\
        𝛤^𝜃_{𝜑𝜑}            &= -\,  \sin𝜃\,\cos𝜃\\
        𝛤^𝜑_{𝜑r} = 𝛤^𝜑_{r𝜑} &= \pos \recip{r}  \\
        𝛤^𝜑_{𝜑𝜃} = 𝛤^𝜑_{𝜃𝜑} &= \pos \cot𝜃 \\
    \end{align*}

    \subsubsection{The Ricci Tensor is Zero}

    Previously, I noted that the Ricci tensor is zero, but I was not yet convinced of that fact.
    We will now use the following relationships to show that it is indeed equal to zero.

    \begin{gather*}
        B = -\,\frac{1}{A}                       \\
        B' = \frac{A'}{A^2}                     \\
        A = -\,\left(1 - \frac{C_1}{r} \right)   \\
        A' = -\,\frac{C_1}{r^2}                 \\
        A'' = \frac{2\,C_1}{r^3}                 \\
    \end{gather*}

    \paragraph{Ricci Tensor $R_{tt}$}

    \begin{gather*}
        \shortintertext{start with the equation we derived previously:}
        R_{tt} = \frac{-A''}{2B} + \frac{A'B'}{4B^2} + \frac{A'^2}{4AB} + \frac{-A'}{rB}          \\
        \shortintertext{substitute in $B$ and $B'$ to get everything in terms of $A$ and its derivatives}
        R_{tt} = \frac{A\,A''}{2} + \frac{A^2\,A'^2}{4A^2} -\frac{A\, A'^2}{4A} + \frac{A\,A'}{r} \\
        \shortintertext{cancel the $A$s in the middle terms}
        R_{tt} = \frac{A\,A''}{2} + \frac{A'^2}{4} -\frac{A'^2}{4} + \frac{A\,A'}{r}               \\
        \shortintertext{eliminate the middle terms because they are equal and opposite}
        R_{tt} = \frac{A\,A''}{2} + \frac{A\,A'}{r}                                                \\
        \shortintertext{factor out an $A$}
        R_{tt} = A\,\left(\frac{A''}{2} + \frac{A'}{r} \right)                                     \\
        \shortintertext{substitute in the equations for $A'$ and $A''$}
        R_{tt} = A\,\left(\frac{2\,C_1}{2\,r^3} + \frac{-C_1}{r^2\,r} \right) = A\,\left(\frac{C_1}{r^3} - \frac{C_1}{r^3} \right)  =A \cdot 0                  \\
        R_{tt} = 0
    \end{gather*}


    \paragraph{Ricci Tensor $R_{rr}$}

    \begin{gather*}
        \shortintertext{Start with the equation we derived previously:}
        R_{rr} = \frac{-A''}{2A} + \frac{ A'B'}{4AB} +\frac{ A'^2}{4A^2}  + \frac{ B'}{rB}          \\
        \shortintertext{substitute in $B'/B$ to get everything in terms of $A$ and its derivatives}
        R_{rr} = \frac{-A''}{2A} - \frac{A'^2}{4A^2} +\frac{A'^2}{4A^2} - \frac{A'}{rA} \\
        \shortintertext{eliminate the middle terms because they are equal and opposite}
        R_{rr} = \frac{-A''}{2A} - \frac{A'}{rA}                                                \\
        \shortintertext{factor out a $-1/A$}
        R_{rr} = -\recip{A}\,\left(\frac{A''}{2} + \frac{A'}{r} \right)                                     \\
        \shortintertext{notice that the term in parenthesis is zero as show above in the $R_{tt}$ section}
        R_{rr} = -\recip{A} \cdot 0  \\
        R_{rr} = 0
    \end{gather*}


    \paragraph{Ricci Tensor $R_{𝜃𝜃}$ equals zero}

    \begin{gather*}
        \shortintertext{Start with the equation we derived previously:}
        R_{𝜃𝜃} = \frac{-rA'}{2AB} + \frac{rB'}{2B^2} + \frac{-1}{B} + 1  \\
        \shortintertext{substitute in $B$ and $B'/B$ to get everything in terms of $A$ and its derivatives}
        R_{𝜃𝜃} =  \frac{r\,A\,A'}{2A} + \frac{r\,A\,A'}{2A} + A + 1 \\
        \shortintertext{simplify}
        R_{𝜃𝜃} = r\,A' + A + 1                          \\
        \shortintertext{substitute in $A'$ and A}
        R_{𝜃𝜃} =  r\,\frac{-C_1}{r^2} - \left(1 - \frac{C_1}{r} \right) + 1 \\
        \shortintertext{simplify}
        R_{𝜃𝜃} = -\,\frac{C_1}{r} - 1 + \frac{C_1}{r} + 1 \\
        \shortintertext{first two terms are equal and opposite of last two terms}
        R_{𝜃𝜃} = 0
    \end{gather*}

    \paragraph{Ricci Tensor $R_{𝜑𝜑}$ equals zero}
    \begin{gather*}
        \shortintertext{start with the equation we derived previously:}
        R_{𝜑𝜑} = \sin^2𝜃 \left( \frac{-rA'}{2AB} + \frac{rB'}{2B^2} + \frac{-1}{B} + 1 \right)
        \shortintertext{note that this the term in parentheses equals $R_{𝜃𝜃}$}
        R_{𝜑𝜑} = \sin^2𝜃 \left( R_{𝜃𝜃} \right) = \sin^2𝜃 \cdot 0\\
        R_{𝜑𝜑} = 0
    \end{gather*}

    This shows that for the Schwarzschild Metric the Ricci Tensor is zero.
    Which also means that the Ricci scalar is zero.


\end{document}