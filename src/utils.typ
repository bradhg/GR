//
// Copyright 2025 Brad Garn
//

#import "@preview/physica:0.9.7": dd, dv
#import "@preview/mannot:0.3.1": mark, markhl, markrect

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
) = $upright(∂)_#wrt #f$


//--------------------------------------------------------------------------------------------------
// partial differential of g_(i1 i2)
#let pg(
    wrt,
    i1,
    i2
) = {
    $pd( #wrt, g_(#i1 #i2) )$
}


//--------------------------------------------------------------------------------------------------
// zerored partial differential of g_(i1 i2)
//   currently just draws a slash through it
//   would like to have it be an arrow to 0
#let pgz(
    wrt,
    i1,
    i2
) = {
    $cancel(pd( #wrt, g_(#i1 #i2) ))$
}

//--------------------------------------------------------------------------------------------------
// Total Derivative
// @param wrt - with respect to
// @param f - function
#let Dd(
   wrt,
   f
) = $(upright(D) #f)/(upright(D) #wrt)$


//--------------------------------------------------------------------------------------------------
// An equation with a right justified note
#let eqNote(equation, note) = table(
  columns: (1fr, auto, 1fr),
  align: vHorizon((center, center, right)),
  stroke: none,
  [],  // left column empty
  equation,
  text(note, size: 0.9em, fill: gray),
)

//--------------------------------------------------------------------------------------------------
// lr (left-right) with built in parens scaled to 200%
// ie. big parens
#let lr2(body) = math.lr($(body)$, size: 200%)

//--------------------------------------------------------------------------------------------------
// Creates three function for creating visual variants of a single-index Einstein-notation expression
//
// Given a `base` function that produces math content from an index (e.g. Γ^(index)_(t t)),
// it returns a tuple of functions:
//
//   m(index): normal marked index (colored glyph, no highlight)
//   h(index): highlighted index (colored glyph with background highlight)
//   c(index): canceled version of the highlighted form
//
// This is intended for pedagogical derivations where one index is being tracked,
// summed over, or eliminated step-by-step, while keeping the mathematical structure
// identical across variants.
#let makeVariants1(
  base,                   // function (index) → math content
  color: myorange,        // color applied to the index glyph
  hl_lighten: 40%,        // amount to lighten the color of the highlight background
  hl_radius: 1pt,         // corner radius of the highlight background
) = {

  let sm = (idx) => mark(idx, color: color)
  let sh = (idx) => markhl(idx, color: color.lighten(hl_lighten), radius: hl_radius)

  let m(index) = base(sm(index))
  let h(index) = base(sh(index))
  let c(index) = math.cancel(h(index))

  (m, h, c)
}


//--------------------------------------------------------------------------------------------------
// Creates three function for creating visual variants of a 2-index Einstein-notation expression
//   See makeVariatns1 for details
#let makeVariants2(
  base,                     //  function (i1,i2) → math content
  color1: myorange,         //  color applied to the index1 glyph
  color2: mygreen,          //  color applied to the index2 glyph
  hl_lighten: 40%,          //  amount to lighten the color of the highlight background
  hl_radius: 1pt,           //  corner radius of the highlight background
) = {
  let s1m = (idx) => mark(idx, color: color1)
  let s2m = (idx) => mark(idx, color: color2)
  let s1h = (idx) => markhl(idx, color: color1.lighten(hl_lighten), radius: hl_radius)
  let s2h = (idx) => markhl(idx, color: color2.lighten(hl_lighten), radius: hl_radius)

  let m(i1, i2) = base(s1m(i1), s2m(i2))
  let h(i1, i2) = base(s1h(i1), s2h(i2))
  let c(i1, i2) = math.cancel(h(i1, i2))

  (m, h, c)
}

//--------------------------------------------------------------------------------------------------
// create a 4x4 diagonal matrix
#let diag4(i11, i22, i33, i44) = $mat(
  i11,   0,   0,   0;
    0, i22,   0,   0;
    0,   0, i33,   0;
    0,   0,   0, i44)$

//--------------------------------------------------------------------------------------------------
// shrik content to fit in enclosing width
#let shrinkToWidth(body) = {
    layout(size => {
        let natural = measure(body).width
        let max = size.width
        if natural > max {
            let factor = max / natural * 100%
            scale(factor, body)
        }else{
            scale( 100%, body)
        }
    })
}

//--------------------------------------------------------------------------------------------------
// Draw a box around an equation
#let boxed(body) = markrect(
    body,
    stroke: 1pt,
    radius:4pt,
    outset:0.5em
)
