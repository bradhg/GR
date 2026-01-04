//
// Copyright 2025 Brad Garn
//

//--------------------------------------------------------------------------------------------------
#import "template.typ": *
#show: documentSetup.with(title: [Independent Study of General Relativity])

//--------------------------------------------------------------------------------------------------
#include "FrontMatter.typ"

//--------------------------------------------------------------------------------------------------
// Main Matter
#show: mainMatterSetup
#include "EinsteinFieldEquations.typ"
#include "SchwarzschildMetricDerivation.typ"
#include "SchwarzschildMetricApplications.typ"

//--------------------------------------------------------------------------------------------------
//#include "BackMatter.typ"

// NOTE: This document intentionally uses Unicode mathematical Greek
// symbols (e.g., 𝜇, 𝜈) instead of semantic identifiers (mu, nu).
// This is a deliberate preference for source readability.
