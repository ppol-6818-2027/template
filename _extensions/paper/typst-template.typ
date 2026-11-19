// The paper format for the mid-term registered report and the final paper:
// the look of Ben's clean preprints (the submission skill's "Clean
// preprint"): Charter for text and math, 10 point on letter paper with one
// inch margins, 1.15 spacing, title block and summary on page 1, numbered
// headings, captions above exhibits, ruled tables, plain links. Students do
// not edit this file; they write in midterm/midterm.qmd and final/final.qmd.

#let paper(title: none, subtitle: none, authors: (), date: none, abstract: none, body) = {
  set document(title: title)
  set page(paper: "us-letter", margin: 1in, numbering: "1", number-align: center)
  set text(font: "XCharter", size: 10pt, lang: "en", region: "us")
  show math.equation: set text(font: ("XCharter Math", "New Computer Modern Math"))
  show raw: set text(size: 0.9em)
  set par(justify: true, leading: 0.78em, spacing: 0.78em, first-line-indent: 1.5em)

  set heading(numbering: "1.1")
  show heading: it => {
    set par(first-line-indent: 0pt, justify: false)
    let size = if it.level == 1 { 12pt } else { 10.5pt }
    block(above: if it.level == 1 { 1.7em } else { 1.4em }, below: 0.9em, sticky: true,
      text(size: size, weight: "bold", {
        if it.numbering != none { counter(heading).display(it.numbering); h(0.9em) }
        it.body
      }))
  }

  // Exhibits: the caption above, set as text; tables a little smaller.
  show figure: set block(above: 1.7em, below: 1.7em)
  show figure.caption: it => {
    set par(first-line-indent: 0pt, justify: true)
    set align(left)
    block(width: 100%, below: 0.7em, [#it.supplement #context it.counter.display(it.numbering): #it.body])
  }
  // Tables: rules only where the table asks for them, text flush left unless
  // a column sets its own alignment, the table centered under its caption.
  set table(stroke: none, inset: (x: 6pt, y: 4pt))
  show table: it => {
    set text(size: 9pt)
    set par(first-line-indent: 0pt, justify: false)
    align(center, box({ set align(left); it }))
  }
  set list(indent: 1.5em)
  set enum(indent: 1.5em)

  // Page 1: title, authors, date, and the abstract if the front matter has one.
  {
    set align(center)
    set par(first-line-indent: 0pt, justify: false, leading: 0.6em)
    v(1.2em)
    if title != none { text(size: 17pt, hyphenate: false, title) }
    if subtitle != none { v(0.2em); text(size: 12pt, subtitle) }
    if authors.len() > 0 { v(0.6em); text(size: 12pt, authors.join(", ")) }
    if date != none { v(0.2em); text(size: 11pt, date) }
    v(1.4em)
  }
  if abstract != none {
    align(center, text(weight: "bold", size: 9pt, "Abstract"))
    pad(x: 2em, { set text(size: 9pt); set par(first-line-indent: 0pt); abstract })
    v(1em)
  }
  body
}
