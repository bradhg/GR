//
// Copyright 2025 Brad Garn
//
#import "utils.typ" : *

#pagebreak()
= The Schwarzschild Metric Derivation

== The metric and it inverse

    The Schwarzschild Metric is for the empty space near a spherically symmetric non-rotating chargeless mass.
    The coordinates are $x^𝜇 = (c t,r,𝜃,𝜑)$.
    We will begin with the standard ansatz for the Schwarzschild metric where $A$ and $B$ are unknow functions of $r$.
    The other two non-zero terms in the metric are determined by requiring spherical symmetry.
    Being static makes all $g_(t i)$ and $g_(i t)$ terms equal zero.
    Spherical symmetry requires all $g_(r 𝜃)$, $g_(r 𝜑)$, and $g_(𝜃 𝜑)$ terms to be zero.

    $ g_(μ ν) = diag4( A, B, r^2, r^2 sin^2 𝜃 ) $

    Because the metric is diagonal the inverse metric is simply the reciprocal of each element.
    $ g^(μ ν) = mat(
       1/A,   0, 0,     0;
         0, 1/B, 0,     0;
         0,   0, 1/r^2, 0;
         0,   0, 0,     1/(r^2 sin^2 θ )
    ) $

== The Partial Derivatives

    $
        pg(r,t,t) &= A' \
        pg(r,r,r) &= B' \
        pg(r,𝜃,𝜃) &= 2r \
        pg(r,𝜑,𝜑) &= 2r sin^2 𝜃 \
        pg(𝜃,𝜑,𝜑) &= 2r^2 sin 𝜃 cos 𝜃 \
        "others" &= 0
    $

== The Christoffel Symbols
    
    Because this metric is diagonal the Christoffel Symbols equations simplifies to the following:

    #eqNote[$ 𝛤^𝜌_(𝜇 𝜈) = 1/2 g^(𝜌 𝜌) ( pg(𝜇,𝜈,𝜌) + pg(𝜈,𝜇,𝜌) - pg(𝜌,𝜇,𝜈) ) $][no sum on $𝜌$]

    With three indexes in 4d spacetime there are 64 Christoffel Symbols.
    But they are symmetric in the lower index so that leaves only 40.
    And because there are only 5 partial derivatives of the metric that are non-zero only the following Christoffel Symbols are non-zero.

    $
    𝛤^t_(t r) = 𝛤^t_(r t)  & = 1/2 g^(t t) lr2( pgz(t,r,t) + pg(r,t,t) - pgz(t,t,r) ) && = A'/(2A) \
    𝛤^r_(t t)              & = 1/2 g^(r r) lr2( pgz(t,t,r) + pgz(t,t,r) - pg(r,t,t) ) && = (-A')/(2B) \
    𝛤^r_(r r)              & = 1/2 g^(r r) lr2( pg(r,r,r) + pg(r,r,r) - pg(r,r,r)  ) && = B'/(2B) \
    𝛤^r_(𝜃 𝜃)              & = 1/2 g^(r r) lr2( pgz(𝜃,𝜃,r) + pgz(𝜃,𝜃,r) - pg(r,𝜃,𝜃) ) &&= (-2r)/(2B) = (-r)/B \
    𝛤^r_(𝜑  𝜑)            & = 1/2 g^(r r) lr2( pgz(𝜑,𝜑,r) + pgz(𝜑,𝜑,r) - pg(r,𝜑,𝜑) ) &&= (-2r sin^2 𝜃)/(2B) = (-r sin^2 𝜃)/(B) \
    𝛤^𝜃_(𝜃 r) = 𝛤^𝜃_(r 𝜃)  & = 1/2 g^(𝜃 𝜃) lr2( pgz(𝜃,r,𝜃) + pg(r,𝜃,𝜃) - pgz(𝜃,𝜃,r) ) &&= (2r)/(2r^2) = 1/r \
    𝛤^𝜃_(𝜑 𝜑)             & = 1/2 g^(𝜃 𝜃) lr2( pgz(𝜑,𝜑,𝜃) + pgz(𝜑,𝜑,𝜃) - pg(𝜃,𝜑,𝜑) ) &&= (-2r^2 sin 𝜃 cos 𝜃)/(2 r^2) = -sin 𝜃 cos 𝜃 \
    𝛤^𝜑_(𝜑 r) = 𝛤^𝜑_(r 𝜑) & = 1/2 g^(𝜑 𝜑) lr2( pgz(𝜑,r,𝜑) + pg(r,𝜑,𝜑) - pgz(𝜑,𝜑,r) ) &&= (2r sin^2 𝜃)/(2 r^2 sin^2 𝜃) = 1/r \
    𝛤^𝜑_(𝜑 𝜃) = 𝛤^𝜑_(𝜃 𝜑) & = 1/2 g^(𝜑 𝜑) lr2( pgz(𝜑,𝜃,𝜑) + pg(𝜃,𝜑,𝜑) - pgz(𝜑,𝜑,𝜃) ) &&= (2r^2 sin 𝜃 cos 𝜃)/(2 r^2 sin^2 𝜃) = cot 𝜃 \
    $

== The Ricci Tensor

=== $R_(t t)$ Component of the Ricci Tensor

    #let O𝜆 = Orange[𝜆]
    #let G𝜌 = Green[𝜌]

    $ R_(t t) = pd(O𝜆, 𝛤^(O𝜆)_(t t)) - pd(t, 𝛤^(O𝜆)_(t O𝜆)) + 𝛤^(O𝜆)_(t t) 𝛤^(G𝜌)_(O𝜆 G𝜌) - 𝛤^(O𝜆)_(t G𝜌) 𝛤^(G𝜌)_(O𝜆 t) $

    *$R_(t t)$ First Term* Only the partial with respect to $r$ will be non-zero #{
        
        let (Rtt1m, Rtt1h, Rtt1c) = makeVariants1( (index) => $ pd(index, 𝛤^(index)_(t t)) $)
        $
        Rtt1m(𝜆) &= Rtt1c(t) + Rtt1h(r) + Rtt1c(𝜃) + Rtt1c(𝜑) \
                 &= pd(r, (-A')/(2B))   \
                 &= ((-2B')(-A') + (-A'')(2B))/(4B^2) \
                 &= (A'B')/(2B^2) - (A'')/(2B)
        $
    }

    *$R_(t t)$ Second Term* All partials with respect to $t$ are zero. #{

        let (Rtt2m,_,Rtt2c) = makeVariants1( (index) => $ pd(t, 𝛤^(index)_(t index)) $)
        $
        Rtt2m(𝜆) &= Rtt2c(t) + Rtt2c(r) + Rtt2c(𝜃) + Rtt2c(𝜑) \
                 &= 0
        $
    }
    
    *$R_(t t)$ Third Term* The only value of $𝜆$ that has a non-zero Christoffel is $r$ and then all values of $𝜌$ will have non-zero Christoffel Symbols. #{

        let (Rtt3m, Rtt3h, Rtt3c) = makeVariants2( (i1,i2) => $𝛤^(i1)_(t t) 𝛤^(i2)_(i1 i2)$)
        $
        Rtt3m(𝜆,𝜌) &= && Rtt3c(t,t) + Rtt3c(t,r)  + Rtt3c(t,𝜃) + Rtt3c(t,𝜑) \
                   && +&  Rtt3h(r,t)  + Rtt3h(r,r) + Rtt3h(r,𝜃) + Rtt3h(r,𝜑) \
                   && +&  Rtt3c(𝜃,t) + Rtt3c(𝜃,r) + Rtt3c(𝜃,𝜃) + Rtt3c(𝜃,𝜑) \
                   && +&  Rtt3c(𝜑,t) + Rtt3c(𝜑,r) + Rtt3c(𝜑,𝜃) + Rtt3c(𝜑,𝜑) \
                  \
                   &= &&  (-A')/(2B) (A')/(2A) + (-A')/(2B) (B')/(2B) + (-A')/(2B) 1/r  + (-A')/(2B) 1/r  \
                   &= && -(A'^2)/(4A B) - (A'B')/(4B^2) - (A')/(r B)
        $
    }

    *$R_(t t)$ Fourth Term* The only non-zero Christoffel symbols have one $r$ and two $t$ indices. #{

        let (Rtt4m, Rtt4h, Rtt4c)  = makeVariants2((i1, i2) => $𝛤^i1_(t i2) 𝛤^i2_(i1 t)$)
        $
        Rtt4m(𝜆,𝜌)  &= && Rtt4c(t,t) + Rtt4h(t,r)  + Rtt4c(t,𝜃) + Rtt4c(t,𝜑) \
                    && +& Rtt4h(r,t) + Rtt4c(r,r) + Rtt4c(r,𝜃) + Rtt4c(r,𝜑) \
                    && +& Rtt4c(𝜃,t) + Rtt4c(𝜃,r) + Rtt4c(𝜃,𝜃) + Rtt4c(𝜃,𝜑) \
                    && +& Rtt4c(𝜑,t) + Rtt4c(𝜑,r) + Rtt4c(𝜑,𝜃) + Rtt4c(𝜑,𝜑) \
                    \
                    &= && (-A')/(2B) (A')/(2A) + (A')/(2A)(-A')/(2B) \
                    &= && -(A'^2)/(2A B)
        $
    }
    
    *$R_(t t)$* Complete
        $
        r_(t t) &= (A'B')/(2B^2) - (A'')/(2B) - 0 + (-A'^2)/(4A B) - (A'B')/(4B^2) + (-A')/(r B) -(-A'^2)/(2A  B) \
                &= -(A'')/(2B) + (A'B')/(4B^2) + (A'^2)/(4A B) - (A')/(r B)
        $


=== $R_(r r)$ Component of the Ricci Tensor

    #let O𝜆 = Orange[𝜆]
    #let G𝜌 = Green[𝜌]

    $ R_(r r) = pd(O𝜆, 𝛤^(O𝜆)_(r r)) - pd(r, 𝛤^(O𝜆)_(r O𝜆)) + 𝛤^(O𝜆)_(r r) 𝛤^(G𝜌)_(O𝜆 G𝜌) - 𝛤^(O𝜆)_(r G𝜌) 𝛤^(G𝜌)_(O𝜆 r) $

    *$R_(r r)$ First Term* Only the partial with respect to $r$ will be non-zero #{

        let (Rrr1m, Rrr1h, Rrr1c) = makeVariants1((index) => $ pd(index, 𝛤^(index)_(r r)) $)
        $
        Rrr1m(𝜆) &= Rrr1c(t) + Rrr1h(r) + Rrr1c(𝜃) + Rrr1c(𝜑) \
                 &= pd(r, (B')/(2B)) \
                 &= ((-2B')(B') + (B'')(2B))/(4B^2) \
                 &= -(B'^2)/(2B^2) + (B'')/(2B)
        $
    }

    *$R_(r r)$ Second Term*  #{

        let (Rrr2m, Rrr2h, _) = makeVariants1((index) => $ pd(r, 𝛤^(index)_(r index)) $)
        $
        Rrr2m(𝜆) &= Rrr2h(t) + Rrr2h(r) + Rrr2h(𝜃) + Rrr2h(𝜑) \
                 &= pd(r, (A')/(2A)) + pd(r, (B')/(2B)) + pd(r, 1/r) + pd(r, 1/r) \
                 &= ((-2A')(A') + (A'')(2A))/(4A^2) + ((-2B')(B') + (B'')(2B))/(4B^2) + (-1)/(r^2) + (-1)/(r^2) \
                 &= (-A'^2)/(2A^2) + (A'')/(2A) + (-B'^2)/(2B^2) + (B'')/(2B) + (-2)/(r^2) \
                 &= -(A'^2)/(2A^2) + (A'')/(2A) - (B'^2)/(2B^2) + (B'')/(2B) - 2/(r^2)
        $
    }

    *$R_(r r)$ Third Term* The only value of $𝜆$ that has a non-zero Christoffel is $r$ and then all values of $𝜌$ will have non-zero Christoffel Symbols. #{

        let (Rrr3m, Rrr3h, Rrr3c) = makeVariants2((i1, i2) => $ 𝛤^(i1)_(r r) 𝛤^(i2)_(i1 i2) $)
        $
        Rrr3m(𝜆,𝜌) &= && Rrr3c(t,t) + Rrr3c(t,r)  + Rrr3c(t,𝜃) + Rrr3c(t,𝜑) \
                   && +&  Rrr3h(r,t)  + Rrr3h(r,r) + Rrr3h(r,𝜃) + Rrr3h(r,𝜑) \
                   && +&  Rrr3c(𝜃,t) + Rrr3c(𝜃,r) + Rrr3c(𝜃,𝜃) + Rrr3c(𝜃,𝜑) \
                   && +&  Rrr3c(𝜑,t) + Rrr3c(𝜑,r) + Rrr3c(𝜑,𝜃) + Rrr3c(𝜑,𝜑) \
                  \
                   &= && (B')/(2B) (A')/(2A) + (B')/(2B) (B')/(2B) + (B')/(2B) 1/r + (B')/(2B) 1/r \
                   &= && (A'B')/(4A B) + (B'^2)/(4B^2) + (B')/(r B)
        $
    }

    *$R_(r r)$ Fourth Term* The only non-zero Christoffel symbols have one $r$ index and the other two indices are equal. #{

        let (Rrr4m, Rrr4h, Rrr4c) = makeVariants2((i1, i2) => $ 𝛤^i1_(r i2) 𝛤^i2_(i1 r) $)
        $
        Rrr4m(𝜆,𝜌)  &= && Rrr4h(t,t)  + Rrr4c(t,r)  + Rrr4c(t,𝜃) + Rrr4c(t,𝜑) \
                    && +&  Rrr4c(r,t) + Rrr4h(r,r)  + Rrr4c(r,𝜃) + Rrr4c(r,𝜑) \
                    && +&  Rrr4c(𝜃,t) + Rrr4c(𝜃,r) + Rrr4h(𝜃,𝜃) + Rrr4c(𝜃,𝜑) \
                    && +&  Rrr4c(𝜑,t) + Rrr4c(𝜑,r) + Rrr4c(𝜑,𝜃) + Rrr4h(𝜑,𝜑) \
                    \
                     &= && (A')/(2A) (A')/(2A) + (B')/(2B) (B')/(2B) + 1/r 1/r + 1/r 1/r \
                     &= && (A'^2)/(4A^2) + (B'^2)/(4B^2) + 2/(r^2)
        $
    }

    *$R_(r r)$ Complete*
        $
        R_(r r) &= (-(B'^2)/(2B^2) + (B'')/(2B)) \
                &- (-(A'^2)/(2A^2) + (A'')/(2A) - (B'^2)/(2B^2) + (B'')/(2B) - 2/(r^2)) \
                &+ ((A'B')/(4A B) + (B'^2)/(4B^2) + (B')/(r B)) \
                &- ((A'^2)/(4A^2) + (B'^2)/(4B^2) + 2/(r^2)) \
                \
                &= -(A'')/(2A) + (A'B')/(4A B) + (A'^2)/(4A^2) + (B')/(r B)
        $

=== $R_(𝜃 𝜃)$ Component of the Ricci Tensor

    #let O𝜆 = Orange[𝜆]
    #let G𝜌 = Green[𝜌]

    $ R_(𝜃 𝜃) = pd(O𝜆, 𝛤^(O𝜆)_(𝜃 𝜃)) - pd(𝜃, 𝛤^(O𝜆)_(𝜃 O𝜆)) + 𝛤^(O𝜆)_(𝜃 𝜃) 𝛤^(G𝜌)_(O𝜆 G𝜌) - 𝛤^(O𝜆)_(𝜃 G𝜌) 𝛤^(G𝜌)_(O𝜆 𝜃) $

    *$R_(𝜃 𝜃)$ First Term* Only the partial with respect to $r$ will be non-zero #{

        let (Rhh1m, Rhh1h, Rhh1c) = makeVariants1((index) => $ pd(index, 𝛤^(index)_(𝜃 𝜃)) $)
        $
        Rhh1m(𝜆) &= Rhh1c(t) + Rhh1h(r) + Rhh1c(𝜃) + Rhh1c(𝜑) \
                 &= pd(r, (-r)/B) \
                 &= ((-B')(-r) + (-1)(B))/(B^2) \
                 &= (r B')/(B^2) - 1/B
        $
    }

    *$R_(𝜃 𝜃)$ Second Term* Only the partial with respect to $𝜃$ is non-zero #{

        let (Rhh2m, Rhh2h, Rhh2c) = makeVariants1((index) => $ pd(𝜃, 𝛤^(index)_(𝜃 index)) $)
        $
        Rhh2m(𝜆) &= Rhh2c(t) + Rhh2c(r) + Rhh2c(𝜃) + Rhh2h(𝜑) \
                 &= pd(𝜃, cot 𝜃 ) \
                 &= -1/sin^2 𝜃 \
                 &= -csc^2 𝜃
        $
    }

    *$R_(𝜃 𝜃)$ Third Term* The only value of $𝜆$ that has a non-zero Christoffel is $r$ and then all values of $𝜌$ will have non-zero Christoffel Symbols. #{

        let (Rhh3m, Rhh3h, Rhh3c) = makeVariants2((i1, i2) => $ 𝛤^(i1)_(𝜃 𝜃) 𝛤^(i2)_(i1 i2) $)
        $
        Rhh3m(𝜆,𝜌) &= && Rhh3c(t,t) + Rhh3c(t,r)  + Rhh3c(t,𝜃) + Rhh3c(t,𝜑) \
                   && +&  Rhh3h(r,t)  + Rhh3h(r,r) + Rhh3h(r,𝜃) + Rhh3h(r,𝜑) \
                   && +&  Rhh3c(𝜃,t) + Rhh3c(𝜃,r) + Rhh3c(𝜃,𝜃) + Rhh3c(𝜃,𝜑) \
                   && +&  Rhh3c(𝜑,t) + Rhh3c(𝜑,r) + Rhh3c(𝜑,𝜃) + Rhh3c(𝜑,𝜑) \
                  \
                   &= && (-r)/B A'/(2A) + (-r)/B (B')/(2B) + (-r)/B 1/r + (-r)/B 1/r \
                   &= && -(r A')/(2A B) - (r B')/(2B^2) - 2/B
        $
    }

    *$R_(𝜃 𝜃)$ Fourth Term* The only non-zero Christoffel symbols have one $r$ and two angular indices. #{

        let (Rhh4m, Rhh4h, Rhh4c) = makeVariants2((i1, i2) => $ 𝛤^i1_(𝜃 i2) 𝛤^i2_(i1 𝜃) $)
        $
        Rhh4m(𝜆,𝜌) &= && Rhh4c(t,t) + Rhh4c(t,r)  + Rhh4c(t,𝜃) + Rhh4c(t,𝜑) \
                   && +&  Rhh4c(r,t) + Rhh4c(r,r) + Rhh4h(r,𝜃) + Rhh4c(r,𝜑) \
                   && +&  Rhh4c(𝜃,t) + Rhh4h(𝜃,r) + Rhh4c(𝜃,𝜃) + Rhh4c(𝜃,𝜑) \
                   && +&  Rhh4c(𝜑,t) + Rhh4c(𝜑,r) + Rhh4c(𝜑,𝜃) + Rhh4h(𝜑,𝜑) \
                  \
                   &= && (-r)/B 1/r + 1/r (-r)/B + cot 𝜃 cot 𝜃 \
                   &= && -2/B + cot^2 𝜃
        $
    }

    *$R_(𝜃 𝜃)$* Complete
        $
        r_(𝜃 𝜃) &= (r B')/(B^2) - 1/B \
                &- (-csc^2(𝜃)) \
                &+ (-(r A')/(2A B) - (r B')/(2B^2) - 2/B) \
                &- (-2/B + cot^2 𝜃 ) \
                \
                &= -(r A')/(2A B) + (r B')/(2B^2) - 1/B + csc^2 𝜃 - cot^2 𝜃 \
                &= -(r A')/(2A B) + (r B')/(2B^2) - 1/B + 1
        $

=== $R_(𝜑 𝜑)$ Component of the Ricci Tensor

    #let O𝜆 = Orange[𝜆]
    #let G𝜌 = Green[𝜌]

    $ R_(𝜑 𝜑) = pd(O𝜆, 𝛤^(O𝜆)_(𝜑 𝜑)) - pd(𝜑, 𝛤^(O𝜆)_(𝜑 O𝜆)) + 𝛤^(O𝜆)_(𝜑 𝜑) 𝛤^(G𝜌)_(O𝜆 G𝜌) - 𝛤^(O𝜆)_(𝜑 G𝜌) 𝛤^(G𝜌)_(O𝜆 𝜑) $

    *$R_(𝜑 𝜑)$ First Term* Only the partials with respect to $r$ and $𝜃$ will be non-zero #{

        let (Rpp1m, Rpp1h, Rpp1c) = makeVariants1((index) => $ pd(index, 𝛤^(index)_(𝜑 𝜑)) $)
        $
        Rpp1m(𝜆) &= Rpp1c(t) + Rpp1h(r) + Rpp1h(𝜃) + Rpp1c(𝜑) \
                 &= pd(r, ((-r sin^2 𝜃)/B)) + pd(𝜃, (-sin 𝜃 cos 𝜃)) \
                 &= ((B)(-sin^2 𝜃) - (-r sin^2 𝜃)(B'))/B^2 + (-sin 𝜃)(-sin 𝜃) + (cos 𝜃)(-cos 𝜃) \
                 &= -(sin^2 𝜃)/B + (r sin^2 𝜃 B')/B^2 + sin^2 𝜃 - cos^2 𝜃
        $
    }

    *$R_(𝜑 𝜑)$ Second Term* All partials with respect to $𝜑$ are zero. #{

        let (Rpp2m,_,Rpp2c) = makeVariants1((index) => $ pd(𝜑, 𝛤^(index)_(𝜑 index)) $)
        $
        Rpp2m(𝜆) &= Rpp2c(t) + Rpp2c(r) + Rpp2c(𝜃) + Rpp2c(𝜑) \
                 &= 0
        $
    }

    *$R_(𝜑 𝜑)$ Third Term* The only value of $𝜆$ that has a non-zero Christoffel is $r$ and then all values of $𝜌$ contribute. #{

        let (Rpp3m, Rpp3h, Rpp3c) = makeVariants2((i1, i2) => $ 𝛤^(i1)_(𝜑 𝜑) 𝛤^(i2)_(i1 i2) $)
        $
        Rpp3m(𝜆,𝜌) &= && Rpp3c(t,t) + Rpp3c(t,r)  + Rpp3c(t,𝜃) + Rpp3c(t,𝜑) \
                   && +&  Rpp3h(r,t)  + Rpp3h(r,r) + Rpp3h(r,𝜃) + Rpp3h(r,𝜑) \
                   && +&  Rpp3c(𝜃,t) + Rpp3c(𝜃,r) + Rpp3c(𝜃,𝜃) + Rpp3h(𝜃,𝜑) \
                   && +&  Rpp3c(𝜑,t) + Rpp3c(𝜑,r) + Rpp3c(𝜑,𝜃) + Rpp3c(𝜑,𝜑) \
                  \
                   &= && (-(r sin^2 𝜃)/B)(A'/(2 A)) + (-(r sin^2 𝜃)/B)(B'/(2 B)) + (-(r sin^2 𝜃)/B)(1/r) + (-(r sin^2 𝜃)/B)(1/r) \
                   && +& (-sin 𝜃 cos 𝜃)(cot 𝜃) \
                   &= && -(r sin^2 𝜃 A')/(2 A B) - (r sin^2 𝜃 B')/(2 B^2) - (2 sin^2 𝜃)/B - cos^2 𝜃
        $
    }

    *$R_(𝜑 𝜑)$ Fourth Term* The non-zero Christoffel products involve the $(r,𝜑)$ and $(𝜃,𝜑)$ couplings. #{

        let (Rpp4m, Rpp4h, Rpp4c) = makeVariants2((i1, i2) => $ 𝛤^i1_(𝜑 i2) 𝛤^i2_(i1 𝜑) $)
        $
        Rpp4m(𝜆,𝜌) &= && Rpp4c(t,t) + Rpp4c(t,r)  + Rpp4c(t,𝜃) + Rpp4c(t,𝜑) \
                   && +&  Rpp4c(r,t) + Rpp4c(r,r) + Rpp4c(r,𝜃) + Rpp4h(r,𝜑) \
                   && +&  Rpp4c(𝜃,t) + Rpp4c(𝜃,r) + Rpp4c(𝜃,𝜃) + Rpp4h(𝜃,𝜑) \
                   && +&  Rpp4c(𝜑,t) + Rpp4h(𝜑,r) + Rpp4h(𝜑,𝜃) + Rpp4c(𝜑,𝜑) \
                  \
                   &= && (-(r sin^2 𝜃)/B)(1/r) + (-sin 𝜃 cos 𝜃)(cot 𝜃) \
                   && +& (1/r)(-(r sin^2 𝜃)/B) + (cot 𝜃)(-sin 𝜃 cos 𝜃) \
                   &= && -(2 sin^2 𝜃)/B - 2 cos^2 𝜃
        $
    }

    *$R_(𝜑 𝜑)$* Complete
        $
        r_(𝜑 𝜑) &= (-(sin^2 𝜃)/B + (r sin^2 𝜃 B')/B^2 + sin^2 𝜃 - cos^2 𝜃) \
                &- 0 \
                &+ (-(r sin^2 𝜃 A')/(2 A B) - (r sin^2 𝜃 B')/(2 B^2) - (2 sin^2 𝜃)/B - cos^2 𝜃) \
                &- (-(2 sin^2 𝜃)/B - 2 cos^2 𝜃) \
                \
                &= -(r sin^2 𝜃 A')/(2 A B) + (r sin^2 𝜃 B')/(2 B^2) - (sin^2 𝜃)/B + sin^2 𝜃 \
                &= sin^2 𝜃 ( -(r A')/(2 A B) + (r B')/(2 B^2) - 1/B + 1 )
        $

=== The Ricci Tensor

    #shrinkToWidth(
        $
        R_(μ ν) = diag4(
          -(A'')/(2 B) + (A' B')/(4 B^2) + (A'^2)/(4 A B) - A'/(r B),
          -(A'')/(2 A) + (A' B')/(4 A B) + (A'^2)/(4 A^2) + B'/(r B),
          -(r A')/(2 A B) + (r B')/(2 B^2) - 1/B + 1,
          sin^2 𝜃 ( -(r A')/(2 A B) + (r B')/(2 B^2) - 1/B + 1 )
        )
        $
    )

    In the normal derivation of the Schwarzschild metric, at this point the fact that the Ricci Tensor is all zeros is used.
    However, I could not convince myself of the truth of that statement, so I decided to continue without it.

=== The Ricci scalar #{

    let (gRm, gRh, _) = makeVariants2( (i1,i2) => $g^(i1 i2) R_(i1 i2)$)

    $   R &=& & gRm(𝜇,𝜈) \
        \
          &=& & gRh(t,t) + gRh(r,r) + gRh(𝜃,𝜃) + gRh(𝜑,𝜑) \
        \
          &=& & 1/A ( -(A'')/(2 B) + (A' B')/(4 B^2) + (A'^2)/(4 A B) - (A')/(r B) ) \
          & &+& 1/B ( -(A'')/(2 A) + (A' B')/(4 A B) + (A'^2)/(4 A^2) + (B')/(r B) ) \
          & &+& 1/(r^2) ( -(r A')/(2 A B) + (r B')/(2 B^2) - 1/B + 1 ) \
          & &+& 1/(r^2 sin^2 𝜃) ( sin^2 𝜃 ( (r A')/(2 A B) + (r B')/(2 B^2) - 1/B + 1 ) ) \
        \
          &=&-& (A'')/(2 A B) + (A' B')/(4 A B^2) + (A'^2)/(4 A^2 B) - (A')/(r A B) \
          & &-& (A'')/(2 A B) + (A' B')/(4 A B^2) + (A'^2)/(4 A^2 B) + (B')/(r B^2) \
          & &-& (A')/(2 r A B) + (B')/(2 r B^2) - 1/(r^2 B) + 1/(r^2) \
          & &-& (A')/(2 r A B) + (B')/(2 r B^2) - 1/(r^2 B) + 1/(r^2) \
        \
          &=&-& (A'')/(A B) + (A' B')/(2 A B^2) + (A'^2)/(2 A^2 B) - (2 A')/(r A B) + (2 B')/(r B^2) - 2/(r^2 B) + 2/(r^2)
    $
}
#pagebreak()

== The Einstein Field Equation
=== The $t t$ Einstein Field Equation

$ R_(t t) - 1/2 g_(t t) R = 0 $

$
- A''/(2B) + (A' B')/(4 B^2) + (A'^2)/(4 A B) - A'/(r B) \
- 1/2 A ( - A''/(A B) + (A' B')/(2 A B^2) + (A'^2)/(2 A^2 B) - (2 A')/(r A B) + (2 B')/(r B^2) - 2/(r^2 B) + 2/(r^2) ) = 0
$

distribute $-1/2 A$

$
- A''/(2B) + (A' B')/(4 B^2) + (A'^2)/(4 A B) - A'/(r B) \
+ A''/(2B) - (A' B')/(4 B^2) - (A'^2)/(4 A B) + A'/(r B) - (A B')/(r B^2) + A/(r^2 B) - A/(r^2) = 0
$

cancel opposites

$ - (A B')/(r B^2) + A/(r^2 B) - A/(r^2) = 0 $

multiply by $-r/A$ and move the last term to the right hand side

$ B'/B^2 - 1/(r B) = -1/r $

This is a Bernoulli differential equation. Substitute $V=-1/B$ and $V'=B'/B^2$

$ V' + V/r = -1/r $

compute integrating factor, $e^(∫ 1/r dd(r)) = e^(ln r) = r$, and multiply by it

$
r V' + V = -1 \
(r V)' = -1
$

integrate both sides

$
∫ (r V)' = - ∫ 1 dd(r) \
r V = -r + C_1 \
V = -1 + C_1/r
$

recall $V = -1/B$ so $B = -1/V$

$
B = -1/(-1 + C_1/r) \
#boxed( $ B = 1/(1 - C_1/r) $ ) \
$

notice that this correctly matches the boundary condition $B(∞) = η_(r r) = 1$

=== The $r r$ Einstein Field Equation
$ R_(r r) - 1/2 g_(r r) R = 0 $

$ - A'' / (2A) + (A' B') / (4A B) + (A'^2) / (4A^2) + B' / (r B) \
- 1/2 B (- A'' / (A B) + (A' B') / (2A B^2) + (A'^2) / (2A^2 B) - (2A') / (r A B) + (2B') / (r B^2) - 2 / (r^2 B) + 2 / r^2) = 0 $

distribute $- 1/2 B$

$ - A'' / (2A) + (A' B') / (4A B) + (A'^2) / (4A^2) + B' / (r B) \
+ A'' / (2A) - (A' B') / (4A B) - (A'^2) / (4A^2) + A' / (r A) - B' / (r B) + 1 / r^2 - B / r^2 = 0 $

cancel opposite terms

$ A' / (r A) + 1 / r^2 - B / r^2 = 0 $

multiply remaining terms by $r$ and separate variables

$ A' / A = 1/r B - 1/r $

substitute the value of $B$ derived from the $t t$ field equation

$ A' / A = 1/r 1 / (1 - C_1 / r) - 1/r $

simplify

$ A' / A = 1 / (r - C_1) - 1/r $

integrate both sides

$ integral A' / A dd(r) = integral (1 / (r - C_1) - 1/r) dd(r) $

$ ln|A| = ln|r - C_1| - ln(r) + C_2 $

raise both sides to $e$

$ e^(ln|A|) = e^(ln|r - C_1| - ln(r) + C_2) $

simplify

$ A = K (r - C_1) 1/r $

distribute $1/r$

$ A = K(1 - C_1 / r) $

apply boundary condition $A(infinity) = eta_(t t) = -1$ to determine $K = -1$

$ #boxed( $ A = -(1 - C_1 / r) $ ) $


=== Solve for $C_1$

*A and B* along with the relationship between them and a derivative.

$ A = -(1 - C_1/r) $
$ B = 1 / (1 - C_1/r) $
$ B = -1/A $
$ A' = -C_1 / r^2 $

*Spacetime Coordinates and Proper Time*

These are the spherical spacetime coordinates as functions of proper time $𝜏$.
The $t$ coordinate is multiplied by $c$ so that all four coordinates will be in length units.

$ x^𝜇 = (c t(𝜏), r(𝜏), 𝜃(𝜏), 𝜑(𝜏)) $

where $𝜏$ is defined by the following relation

$ -c^2 dd(𝜏)^2 := dd(s)^2 = g_(O𝜇 G𝜈) dd(x)^O𝜇 dd(x)^G𝜈 $

For a non moving obj at some distance $r$ from the center of a sphere the coordinates are

$ x^𝜇 = (c t(𝜏), r, 𝜃, 𝜑) $

*The Four-Velocity*

The four-velocity is the ordinary derivative of the spacetime coordinates with respect to proper time.

$ u^𝜇 = (dd(x)^𝜇) / (dd(𝜏)) = ( (dd((c t))) / (dd(𝜏)), (dd(r)) / (dd(𝜏)), (dd(𝜃)) / (dd(𝜏)), (dd(𝜑)) / (dd(𝜏)) ) $

For a motionless object this reduces to

$ u^𝜇 = ( (dd((c t))) / (dd(𝜏)), 0, 0, 0 ) $

Solve for $(dd((c t))) / (dd(𝜏))$ of a motionless object using the Schwarzschild metric

$ -c^2 dd(𝜏)^2 = g_(O𝜇 G𝜈) dd(x)^O𝜇 dd(x)^G𝜈 $
// Todo: add a expanded highligh of the metric and derivatives
$ -c^2 dd(𝜏)^2 = A (dd((c t)))^2 + B dd(r)^2 + r^2 dd(𝜃)^2 + r^2 sin^2 𝜃 dd(𝜑) $

divide both sides by $dd(𝜏)^2$ and recall that in this case the positional derivatives are zero

$ -c^2 = A ((dd((c t))) / (dd(𝜏)))^2 + B cancel(((dd(r)) / (dd(𝜏)))^2) + r^2 cancel(((dd(𝜃)) / (dd(𝜏)))^2) + r^2 sin^2 𝜃 cancel(((dd(𝜑)) / (dd(𝜏)))^2) $

simplify

$ (dd((c t))) / (dd(𝜏)) = sqrt((-c^2) / A) = c sqrt(-1/A) $

recall $B = -1/A$

$ (dd((c t))) / (dd(𝜏)) = c sqrt(B) $ <eq:dt_dtau_B>

so the four-velocity is

$ u^𝜇 = ( c sqrt(B), 0, 0, 0 ) $

As a check, verify the following invariant

$ -c^2 ≟ u^O𝜇 u_O𝜇 $
$ -c^2 ≟ g_(t t) u^t u^t $ // TODO: add highlight color to the two ts
$ -c^2 ≟ A (c sqrt(B)) (c sqrt(B)) $
$ -c^2 ≟ A c^2 B $

again recalling $B = -1/A$

$ -c^2 equiv -c^2 quad checkmark $

*The Four-Acceleration*

#let O𝜈 = Orange[𝜈]
#let G𝜌 = Green[𝜌]

The four-acceleration is the Total Covariant Derivative with respect to proper time

$ a^𝜇 = Dd(𝜏, u^𝜇) = ( (dd(u)^𝜇) / (dd(𝜏)) + 𝛤^𝜇_(O𝜈 G𝜌) u^O𝜈 u^G𝜌 ) $


Compute the four-acceleration for a motionless object in Schwarzchild space. The only non-zero component will be $a^r$.

$ a^r = Dd(𝜏, u^r) = ( cancel((dd(u)^r) / (dd(𝜏))) + 𝛤^r_(O𝜈 G𝜌) u^O𝜈 u^G𝜌 ) $
$ a^r = 𝛤^r_(t t) u^t u^t $ // TODO: add highlight color to the two ts
$ a^r = (-A') / (2B) (c sqrt(B))^2 $

the $B$s cancel

$ a^r = (-c^2 A') / 2 $

So the four-acceleration is:

$ a^𝜇 = (0, (-c^2 A') / 2, 0, 0) $

The proper acceleration $𝛼$ is given by:

$ 𝛼 = sqrt(a^O𝜇 a_O𝜇) = sqrt(g_(O𝜇 G𝜈) a^O𝜇 a^G𝜈) $

For Schwarschild, since only $a^r$ is non zero, this reduces to

$ 𝛼 = sqrt(a^r a_r) = sqrt(g_(r r) a^r a^r) $
$ 𝛼 = a^r sqrt(g_(r r)) $

substitute in the equations for $a^r$ and $g_(r r)$

$ 𝛼 = (-c^2 A') / 2 sqrt(B) $

and then subsitute in the equations $A'$ and $B$

$ 𝛼 = (c^2 C_1) / (2 r^2) sqrt(1 / (1 - C_1/r)) $

Newtons law of universal gravitation is

$ F = (G M m) / r^2 $

divide by $m$ to get Newtonian gravitational acceleration

$ a = (G M) / r^2 $

Make Schwarschild GR proper acceleration approximate Newtonian gravitational acceleration.

$ (G M) / r^2 approx (c^2 C_1) / (2 r^2) sqrt(1 / (1 - C_1/r)) $

Guess that $C_1/r << 1$

// TODO: cancelto 1
$ (G M) / r^2 approx (c^2 C_1) / (2 r^2) cancel(sqrt(1 / (1 - cancel(C_1/r)))) $

solve for $C_1$

$ C_1 approx (2 G M) / c^2 $

At the surface of the earth $C_1/r = 1.4 times 10^(-9)$ which is $<< 1$.
And Actually, since $G$ is measured and GR is the more accurate representations of reality, this is the exact value of $C_1$.

$ C_1 = (2 G M) / c^2 $

Substituting $C_1$ into the equation for proper acceleration gives the exact GR equation.

$ 𝛼 = (G M) / r^2 sqrt(1 / (1 - (2 G M) / (c^2 r))) $

Which means the Newtonian equation is the approximation.

$ a approx (G M) / r^2 $

substitute $C_1$ into $A$ and $B$

$ #boxed( $  A = -(1 - (2 G M) / (c^2 r)) $ ) $     <eq:ASchwar>
$ #boxed( $  B = 1 / (1 - (2 G M) / (c^2 r)) $ ) $  <eq:BSchwar>

=== The Schwarzschild Metric

$ g_(𝜇 𝜈) = diag4(
    -(1 - (2 G M) / (c^2 r)),
    1 / (1 - (2 G M) / (c^2 r)),
    r^2,
    r^2 sin^2 𝜃
) $

=== The Christoffel Symbols

$ B = -1/A $
$ B' = A' / A^2 $

Use the above to eliminate $B$ and $B'$ from these Christoffel Symbols.

$ 𝛤^r_(t t) &= (-A') / (2B) = (A A') / 2 \
  𝛤^r_(r r) &= B' / (2B)   = (A' / A^2) / (2 (-1/A)) = (-A') / (2A) \
  𝛤^r_(𝜃 𝜃) &= -r / B      = A r \
  𝛤^r_(𝜑 𝜑) &= (-r sin^2 𝜃) / B = A r sin^2 𝜃 $

And then substitute,

$ A = -(1 - (2 G M) / (c^2 r)) \
  A' = (-2 G M) / (c^2 r^2) $

into the Christoffel Symbols and do a little simplification and reordering:

$ 𝛤^t_(t r) = 𝛤^t_(r t) = A' / (2A) = ( (-2 G M) / (c^2 r^2) ) / (2 [-(1 - (2 G M) / (c^2 r))]) = (G M) / r^2 ( 1 / (c^2 (1 - (2 G M) / (c^2 r))) ) $

$ 𝛤^r_(t t) = (A A') / 2 = (- (1 - (2 G M) / (c^2 r)) ( (-2 G M) / (c^2 r^2) )) / 2 = (G M) / r^2 ( (1 - (2 G M) / (c^2 r)) / c^2 ) $

$ 𝛤^r_(r r) = (-A') / (2A) = -𝛤^t_(t r) = -(G M) / r^2 ( 1 / (c^2 (1 - (2 G M) / (c^2 r))) ) $

$ 𝛤^r_(𝜃 𝜃) = A r = -(1 - (2 G M) / (c^2 r)) r = -r (1 - (2 G M) / (c^2 r)) $

$ 𝛤^r_(𝜑 𝜑) = A r sin^2 𝜃 = -(1 - (2 G M) / (c^2 r)) r sin^2 𝜃 = -r sin^2 𝜃 (1 - (2 G M) / (c^2 r)) $

Finally here are the Schwarzschild Christoffel symbols:

$
  𝛤^t_(t r) = 𝛤^t_(r t) &= && (G M) / r^2 ( 1 / (c^2 (1 - (2 G M) / (c^2 r))) ) \
  𝛤^r_(t t)            &= && (G M) / r^2 ( (1 - (2 G M) / (c^2 r)) / c^2 ) \
  𝛤^r_(r r)            &= - && (G M) / r^2 ( 1 / (c^2 (1 - (2 G M) / (c^2 r))) ) \
  𝛤^r_(𝜃 𝜃)            &= - && r (1 - (2 G M) / (c^2 r)) \
  𝛤^r_(𝜑 𝜑)            &= - && r sin^2 𝜃 (1 - (2 G M) / (c^2 r)) \
  𝛤^𝜃_(𝜃 r) = 𝛤^𝜃_(r 𝜃) &= && 1/r \
  𝛤^𝜃_(𝜑 𝜑)            &= - && sin 𝜃 cos 𝜃 \
  𝛤^𝜑_(𝜑 r) = 𝛤^𝜑_(r 𝜑) &= && 1/r \
  𝛤^𝜑_(𝜑 𝜃) = 𝛤^𝜑_(𝜃 𝜑) &= && cot 𝜃
$
=== The Ricci Tensor is Zero

Previously, I noted that the Ricci tensor is zero, but I was not yet convinced of that fact. We will now use the following relationships to show that it is indeed equal to zero.

$ B = -1/A $
$ B' = A' / A^2 $
$ A = -(1 - C_1/r) $
$ A' = -C_1 / r^2 $
$ A'' = (2 C_1) / r^3 $

==== Ricci Tensor $R_(t t)$

Start with the equation we derived previously:
$ R_(t t) = - (A'') / (2B) + (A' B') / (4B^2) + (A'^2) / (4A B) - (A') / (r B) $

Substitute in $B$ and $B'$ to get everything in terms of $A$ and its derivatives:
$ R_(t t) = (A A'') / 2 + (A^2 A'^2) / (4 A^2) - (A A'^2) / (4 A) + (A A') / r $

Cancel the $A$s in the middle terms:
$ R_(t t) = (A A'') / 2 + A'^2 / 4 - A'^2 / 4 + (A A') / r $

Eliminate the middle terms because they are equal and opposite:
$ R_(t t) = (A A'') / 2 + (A A') / r $

Factor out an $A$:
$ R_(t t) = A ((A'') / 2 + A' / r) $

Substitute in the equations for $A'$ and $A''$:
$ R_(t t) = A ((2 C_1) / (2 r^3) + (-C_1) / (r^2 r)) = A (C_1 / r^3 - C_1 / r^3) = A dot 0 $
$ R_(t t) = 0 $

==== Ricci Tensor $R_(r r)$

Start with the equation we derived previously:
$ R_(r r) = - (A'') / (2A) + (A' B') / (4 A B) + A'^2 / (4 A^2) + B' / (r B) $

Substitute in $B'/B$ to get everything in terms of $A$ and its derivatives:
$ R_(r r) = -(A'') / (2A) - A'^2 / (4 A^2) + A'^2 / (4 A^2) - A' / (r A) $

Eliminate the middle terms because they are equal and opposite:
$ R_(r r) = -(A'') / (2A) - A' / (r A) $

Factor out a $-1/A$:
$ R_(r r) = -1/A ((A'') / 2 + A' / r) $

Notice that the term in parenthesis is zero as shown above in the $R_(t t)$ section:
$ R_(r r) = -1/A dot 0 $
$ R_(r r) = 0 $

==== Ricci Tensor $R_(𝜃 𝜃)$ equals zero

Start with the equation we derived previously:
$ R_(𝜃 𝜃) = -(r A') / (2 A B) + (r B') / (2 B^2) - 1 / B + 1 $

Substitute in $B$ and $B'/B$ to get everything in terms of $A$ and its derivatives:
$ R_(𝜃 𝜃) = (r A A') / (2 A) + (r A A') / (2 A) + A + 1 $

Simplify:
$ R_(𝜃 𝜃) = r A' + A + 1 $

Substitute in $A'$ and $A$:
$ R_(𝜃 𝜃) = r ((-C_1) / r^2) - (1 - C_1/r) + 1 $

Simplify:
$ R_(𝜃 𝜃) = -C_1 / r - 1 + C_1 / r + 1 $
$ R_(𝜃 𝜃) = 0 $

==== Ricci Tensor $R_(𝜑 𝜑)$ equals zero

Start with the equation we derived previously:
$ R_(𝜑 𝜑) = sin^2 𝜃 ( -(r A') / (2 A B) + (r B') / (2 B^2) - 1/B + 1 ) $

Note that the term in parentheses equals $R_(𝜃 𝜃)$:
$ R_(𝜑 𝜑) = sin^2 𝜃 (R_(𝜃 𝜃)) = sin^2 𝜃 dot 0 $
$ R_(𝜑 𝜑) = 0 $

This shows that for the Schwarzschild Metric the Ricci Tensor is zero. Which also means that the Ricci scalar is zero.