#let body-font = "Source Serif 4"
#let display-font = "Fraunces 72pt Soft"
#let cv-black = rgb("#111111")
#let cv-rule = rgb("#777777")

// Fixed dense-document rhythm. Keep these absolute instead of inheriting mixed
// font-relative gaps.
#let space = (
  line-gap: 0.48em,
  paragraph-gap: 9pt,
  section-before: 10pt,
  section-after: 6pt,
  subsection-before: 4pt,
  subsection-after: 4pt,
  role-before: 3pt,
  role-after: 5pt,
  items-before: 6pt,
  item-gap: 5pt,
  skill-row-gap: 5pt,
)

#let cv_document(body) = {
  set document(
    title: "Allie Mari Jones CV",
    author: "Allie Mari Jones",
    keywords: ("curriculum vitae",),
  )

  set page(
    paper: "a4",
    margin: 0.72in,
  )

  set text(
    font: body-font,
    size: 10pt,
    fill: cv-black,
  )

  set par(
    first-line-indent: 0pt,
    leading: space.line-gap,
    spacing: space.paragraph-gap,
  )

  set list(
    indent: 1.35em,
    body-indent: 0.32em,
    spacing: space.item-gap,
  )

  show link: set text(fill: cv-black)
  show strong: it => text(weight: 600, it.body)

  body
}

#let cv_approx() = sym.tilde

#let cv_name(body) = {
  text(font: display-font, size: 20pt, weight: "bold")[#body]
  parbreak()
  v(0.12em)
}

#let cv_contact(body) = {
  text(size: 9pt)[#body]
  parbreak()
  v(0.65em)
}

#let cv_contact_sep = h(0.16em) + [·] + h(0.16em)

#let cv_section(title) = {
  v(space.section-before, weak: true)
  block(breakable: false)[
    #text(font: display-font, size: 13pt, weight: "bold")[#title]
  ]
  v(space.section-after)
}

#let cv_subsection(title) = {
  v(space.subsection-before, weak: true)
  block(breakable: false)[
    #text(font: display-font, size: 10.5pt, weight: "bold")[#title]
  ]
  v(space.subsection-after)
}

#let cv_skills(rows) = {
  stack(
    spacing: space.skill-row-gap,
    ..rows.map(((label, value)) => (
      grid(
        columns: (0.95in, 1fr),
        column-gutter: 1em,
        block(strong(label)), block(value),
      )
    )),
  )
}

#let cv_role(company, role, dates) = {
  v(space.role-before, weak: true)
  block(breakable: false)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 1em,
      strong(company), strong(role),
    )
    #text(size: 9pt)[#dates]
  ]
  v(space.role-after)
}

#let cv_items(body) = {
  v(space.items-before)
  body
}

#let cv_education(subject, place, dates) = {
  v(space.role-before, weak: true)
  block(breakable: false)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 1em,
      strong(subject), place,
    )
    #text(size: 9pt)[#dates]
  ]
  v(space.role-after)
}
