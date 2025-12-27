
#import "utils.typ" : *

= The Einstein Field Equations

    $ R_(𝜇 𝜈) - 1/2 g_(𝜇 𝜈)  R = (8  pi  G) / c^4 T_(𝜇 𝜈) $

    #figure(
      caption: [Key quantities in general relativity],
    )[
      #align(center)[
        #table(
          columns: (auto, 1fr, 1fr, auto),
          align: vHorizon((center, left, left, left)),
          inset: (6pt, 10pt),
          stroke: none,
          table.header(
          table.hline(stroke: 0.8pt),
          [*Sybmbol*], [*Name*],                   [*Quantity*],            [*Dimensions*],
          table.hline(stroke: 0.5pt),
          ),

          [$R_(𝜇 𝜈)$], [Ricci tensor],             [curvature],              [$L^(-2)$],
          [$g_(𝜇 𝜈)$], [Metric tensor],            [dimensionless],          [—],
          [$R$],       [Ricci scalar],             [curvature],              [$L^(-2)$],
          [$G$],       [Universal constant],       [gravitational coupling], [$L^3 M^(-1) T^(-2)$],
          [$c$],       [Speed of light],           [speed],                  [$L T^(-1)$],
          [$T_(𝜇 𝜈)$], [Stress–energy tensor],     [energy density],         [$M L^(-1) T^(-2)$],

          table.hline(stroke: 0.8pt),
        )
      ]
    ]

== Stress–energy tensor $T_(𝜇 𝜈)$

    The stress--energy tensor describes how energy and momentum are spread out in space and how they flow.
    It bundles together rest--mass $𝜌 c^2$, thermal, kinetic, and radiation contributions, varying from point to point in spacetime.
    In a chosen frame, $T^(0 0)$ is the energy density, $T^(0 i)$ gives the flow of energy (or momentum density), and $T^(i j)$ gives the stresses such as pressure and shear.

== The Metric Tensor

    $ dd(s)^2 = g_(O𝜇 G𝜈) dd( x^O𝜇 )  dd( x^G𝜈 ) $

== The Christoffel Symbols

    #let O𝜎 = Orange[𝜎]
    $ 𝛤^𝜌_(𝜇 𝜈) = 1/2 g^(𝜌 O𝜎) ( pg(𝜇,𝜈,O𝜎) + pg(𝜈,𝜇,O𝜎) - pg(O𝜎,𝜇,𝜈) ) $

== The Riemann tensor

    #let G𝜌 = Green[𝜌]
    $ R^𝛼_(𝜇 𝛽 𝜈)= pd( 𝛽, 𝛤^𝛼_(𝜇 𝜈) ) - pd( 𝜈, 𝛤^𝛼_(𝜇 𝛽) ) + 𝛤^𝛼_(𝜇 𝜈) 𝛤^G𝜌_(𝛽 G𝜌) - 𝛤^𝛼_(𝜇 G𝜌) 𝛤^G𝜌_(𝛽 𝜈) $

== The Ricci tensor

    As a contraction of the Riemann tensor

    #let O𝜆 = Orange[𝜆]
    $ R_(𝜇 𝜈) = R^(O𝜆)_(𝜇 O𝜆 𝜈) $

    Or directly from the Christoffel symbols
    $ R_(𝜇 𝜈) = pd( O𝜆, 𝛤^O𝜆_(𝜇 𝜈) ) - pd( 𝜈, 𝛤^O𝜆_(𝜇 O𝜆) )+ 𝛤^O𝜆_(𝜇 𝜈) 𝛤^G𝜌_(O𝜆 G𝜌) - 𝛤^O𝜆_(𝜇 G𝜌) 𝛤^G𝜌_(O𝜆 𝜈) $

== The Ricci scalar

    $ R = g^(O𝜇 G𝜈) R_(O𝜇 G𝜈) $
