//
// Copyright 2005 Brad Garn
//

//==================================================================================================
// Title page

#v(1fr)
#align(center)[
  #title()
  #v(1cm)
  #text(size: 1.6em)[#context document.author.at(0)]\
  #v(0.3cm)
  #context document.date.display()
]
#v(2fr)

//==================================================================================================
// Table of contents page
#pagebreak()
#set page(numbering: "i") // this sets the fomat to roman numerals. This will be page ii
#outline(depth: 2) // TOC for Sections and subsections

//==================================================================================================
// Introduction and acknowledgments page
#pagebreak()

== Introduction

This is my personal record of studying general relativity.
I am writing it to:
- organize the material in a way that makes sense to me
- work through the derivations step by step
- force myself to understand the material more deeply by writing it out, and
- create a reference I can return to as I continue learning.

This is not intended as a textbook or a guide for others.
It’s simply my personal working notes.
It is still a work in progress.
Many sections are incomplete, and others will change as I learn more and expand my knowledge.

== Acknowledgments

In my years of schooling I had many math and science teachers. Even though I can no longer remember most of their names, I appreciate all that they taught me. With respect to calculus and physics, there were two teachers at Mountain View High School in Mesa, AZ who helped spark my interest in these subjects:

- Mr. Rex Rice — AP Physics
- Mr. Wayne Slade — Trigonometry & Math Analysis, and AP Calculus

The EigenChris YouTube channel has been an important learning resource.
I have tried to study this topic in the past and was never able to get a grasp of tensors from just reading textbooks.
Its three playlists _Tensors for Beginners_, _Tensor Calculus_, and _Relativity by EigenChris_ have been especially helpful.

ChatGPT has provided on-demand explanations, clarifications, and guidance while I worked through the mathematics and physics of general relativity.

I am likewise grateful for the many scientists and mathematicians whose work forms the foundation of general relativity, including Albert Einstein, Karl Schwarzschild, Bernhard Riemann, Elwin Christoffel, Tullio Levi-Civita, and Hermann Minkowski.

#v(1fr)
#align(center)[
  #text(size: 0.85em)[
    PDF: #link("https://BradGarn.com/GR.pdf")[BradGarn.com/GR.pdf]\
    Source: #link("https://github.com/bradhg/GR")[github.com/bradhg/GR]\
    #let git_sha = sys.inputs.at("git_sha", default: none) //$sha = git rev-parse --short=7 HEAD; if (-not (git diff --quiet)) { $sha += "*" }; typst compile src/main.typ out/GR.pdf --input git_sha=$sha
    #if git_sha != none { "Git SHA: " + git_sha }
  ]
]
