#set page(
    paper: "us-letter",
    margin: (
      top: 0.25cm,
      bottom: 3cm, 
      x: .75cm,
    )
  )
#set par(justify: true, spacing: 0.5em)
#set text(
    font: "Libertinus Serif",
    size: 11pt,
  )



#let identity(contents)= {
  align(
      center + horizon,
      text(weight: "bold", size: 20pt, contents.name + "\n") + 
      text(size: 12pt, contents.title + " | " + contents.affiliation) +
      text("\n") + link(contents.email1) + " | " + link(contents.email2) + " | " + link(contents.phone)

    )
}

#identity(
  yaml("perso.yaml").identity
)

= Education
#line(length: 100%)

#let perso(contents) = {
  for entry in contents{
    [=== #text(entry.degree)]
    [ #text(weight: "bold", entry.institution) #h(1fr) #text(entry.duration)]
    if entry.details.advisor != "" {
      [\ Advisor: #text(entry.details.advisor)]
    }
    if entry.details.dissertation != "" {
      [\ Dissertation: #text(entry.details.dissertation)]
    }
    if entry.details.specialization != "" {
      [\ Specialization: #text(entry.details.specialization)]
    }
  }
}

#perso(
  yaml("perso.yaml").education
)

= Publications
#line(length: 100%)

#let publications(contents) = {
  for entry in contents {
    [#text(weight: "bold", entry.type) #text(entry.status): ]
    for author in entry.authors {
      [#super(author.affiliation) #text(author.name), ]
    }
    ["#text(entry.title)"]
    for affiliation in entry.affiliations {
      [\ #super(affiliation.order) #text(size: 10pt, affiliation.institution)]
    }
    [ \ ]
  }
}

#publications(
  yaml("perso.yaml").publications
)

= Conference Presentations
#line(length: 100%)

#let conferences(contents) = {
  for entry in contents {
    [#text(weight: "bold", entry.name) | #text(entry.type) #h(1fr) #text(entry.date)]
    [\ #emph(entry.location)]
    [\ #text(entry.title)]
    [\ ]
    [\ ]
  }
}

#conferences(
  yaml("perso.yaml").conference_presentations
)

= Professional Experience
#line(length: 100%)
#lorem(50)

= Research Experience
#line(length: 100%)
#lorem(150)

= Teaching Experience
#line(length: 100%)
#lorem(60)

= Technical Skills 
#line(length: 100%)
#lorem(60)

= Awards and Honors
#line(length: 100%)
#lorem(30)

= Service and Leadership
#line(length: 100%)
#lorem(60)

= Languages
#line(length: 100%)
#lorem(10)



/*
=== Ph.D. in Civil and Environmental Engineering
#text(weight: "bold", "University of California, Berkeley")
#h(1fr) January 2021 - December 2025 \
Advisor: Prof Mark T. Stacey \
Dissertation: Remote Sensing and Hydrodynamic Modeling of Mangrove-Storm Surge Interactions in Haiti.

=== M.S. in Civil and Environmental Engineering
#text(weight: "bold", "University of California, Berkeley")
#h(1fr) August 2020 - December 2021 \
Specialization: Environmental Fluid Mechanics and Hydrology.

=== B.E. in Civil Engineering
#text(weight: "bold", "Stony Brook University, State University of New York")
#h(1fr) August 2016 - May 2020 \
Specialization: Water Resources and Environmental Engineering.
*/