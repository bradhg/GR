//
// Copyright 2025 Brad Garn
//

//--------------------------------------------------------------------------------------------------
// util to make all rows in a table have have horizon veritical allignment
// @param cols -  array of horizontal allignmentsi'
// @return array with vertical allignment horizon added to each element
#let vHorizon(cols) = cols.map(hAlignment => hAlignment + horizon)

//--------------------------------------------------------------------------------------------------
// define colors used in the document
//#let myteal   = rgb(0, 119, 136)
//#let myblue   = rgb(0, 92, 230)
#let mygreen  = rgb(0, 150, 0)
#let myorange = rgb(230, 97, 0)


//--------------------------------------------------------------------------------------------------
// Create colored symbols
//    using the "punctuation" variant makes it so you can
//    write $g_(O𝜇 T𝜈)$ and there will be no spacee between 𝜇 and 𝜈
#let Orange(content) = math.class("punctuation", text(fill: myorange)[#content])
//#let Teal(  content) = math.class("punctuation", text(fill: myteal  )[#content])
#let Green( content) = math.class("punctuation", text(fill: mygreen )[#content])

#let O𝜇 = Orange[𝜇]
#let G𝜈 = Green[𝜈]


//--------------------------------------------------------------------------------------------------
// partial differential of f
// @param wrt - with respect to
// @param f - function
#let pd(
    wrt,
    f
) = {
    $upright(∂)_#wrt #f$
}

//--------------------------------------------------------------------------------------------------
// partial differential of g_(i1 i2)
#let pg(
    wrt,
    i1,
    i2
) = {
    $pd( #wrt, g_(#i1 #i2) )$
}
