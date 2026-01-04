//
// Copyright 2026 Brad Garn
//

//--------------------------------------------------------------------------------------------------
// Document setup
#let documentSetup(
  title: none,
  body
) = {
  set document(
    title: title,
    author: "Brad Garn",
    date: datetime.today(),
  )

  set page( paper: "us-letter" )

  // set math font
  show math.equation: set text( font: "STIX Two Math" )

  // ToDo: reenable upsaling block equation text - it's disabled because the boxed function was double upscaling
  //#show math.equation.where(block: true): set text(size: 1.2em)

  // Indet lists
  set list(indent: 1.5em)

  // make table headers (row 0) bold
  show table.cell.where(y:0): it => {
    set text(weight: "bold")
    show math.equation: set text(stroke: 0.02em) // fake bold for math - works for greek unicode
    it
  }

  // Number equations. First number is the current section. Second number is equation counter
  set math.equation(numbering: equationNumber => {
    let sectionNumber = counter(heading).get().at(0)
    numbering("(1.1)", sectionNumber, equationNumber)
  })

  // Reset the equation counter to 0 at the top of every section
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }

  // Show equation numbers only on labeled equations
  show math.equation.where(block: true): theEquation => {
    if theEquation.has("label") or theEquation.numbering == none {
      theEquation  // show equation as is
    }else{
      // unlabeld equations
      let fields = theEquation.fields()
      let body = fields.remove("body") // get the equation body
      fields.numbering = none          // remove the numbering

      // equation counter was automatically incremented - subtract 1
      counter(math.equation).update(equationNumber => calc.max(equationNumber - 1, 0))

      math.equation(..fields, body) // show the unlabeld equation without numbering
    }
  }

  body
}

//--------------------------------------------------------------------------------------------------
// Main Matter Setup
#let mainMatterSetup(
  body
) = {
  pagebreak() // page break between front matter and main matter
  counter(page).update(1) // start main matter on page 1
  set page(numbering: "1") // number main matter pages with Aribic numerals
  set heading(numbering: "1.") // number headings(sections) with Aribic numerals

  body
}