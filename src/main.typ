//
// Copyright 2025 Brad Garn
//

//--------------------------------------------------------------------------------------------------
// Setup
#set document(
  title: [Independent Study of General Relativity],
  author: "Brad Garn",
  date: datetime.today(),
)

#set page( paper: "us-letter" )

#show math.equation: set text(
    font: "STIX Two Math",
    size:1.2em
)

#set list(indent: 1.5em)

//--------------------------------------------------------------------------------------------------
#include "FrontMatter.typ"

//--------------------------------------------------------------------------------------------------
// Main Matter
#pagebreak()
#counter(page).update(1) // set page number to 1
#set page(numbering: "1") // use arabic numerals

#set heading(numbering: "1.") // Heading number format  arabic numerals seperated by .

#include "EinsteinFieldEquations.typ"
#include "SchwarzschildMetricDerivation.typ"
//#include "SchwarzschildMetricApplications.typ"


//--------------------------------------------------------------------------------------------------
//#include "BackMatter.typ"


// NOTE: This document intentionally uses Unicode mathematical Greek
// symbols (e.g., 𝜇, 𝜈) instead of semantic identifiers (mu, nu).
// This is a deliberate preference for source readability.
