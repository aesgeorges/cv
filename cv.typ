#set page(
    paper: "us-letter",
    margin: (
      top: 0.9cm,
      bottom: 1cm, 
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
    [=== #text(entry.degree) #h(1fr) #text(entry.duration)]
    [ #text(weight: "bold", entry.institution) ]
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
    [#text(weight: "bold", entry.name) #h(1fr) #text(weight: "bold", entry.date)]
    [\ #text(entry.type) #h(1fr) #text(entry.location)]
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

#let prof_experience(contents) = {
  for entry in contents {
    [#text(weight: "bold", entry.position) #h(1fr) #text(weight: "bold", entry.date)]
    [\ #text(entry.institution) #h(1fr) #text(entry.location)]
    [\ Supervisor: #emph(entry.supervisors)]
    for detail in entry.responsibilities {
      [\ • #text(detail)]
    }
    [\ ]
    [\ ]
  }
}


#prof_experience(
  yaml("perso.yaml").professional_experience
)

= Research Experience
#line(length: 100%)

#let research_experience(contents) = {
  for entry in contents {
    [#text(weight: "bold", entry.position) #h(1fr) #text(weight: "bold", entry.date)]
    [\ #text(entry.institution) #h(1fr) #text(entry.location)]
    [\ Supervisor: #emph(entry.supervisors)]
    for detail in entry.responsibilities {
      [\ • #text(detail)]
    }
    [\ ]
    [\ ]
  }
}

#research_experience(
  yaml("perso.yaml").research_experience
)
= Teaching Experience
#line(length: 100%)

#let teaching_experience(contents) = {
  for entry in contents {
    [#text(weight: "bold", entry.position) | #text(entry.course) #h(1fr) #text(weight:"bold", entry.date)]
    [\ #text(entry.institution)]
    [\ #text(entry.responsibilities)]
    [\ ]
    [\ ]
  }
}

#teaching_experience(
  yaml("perso.yaml").teaching_experience
)

= Technical Skills 
#line(length: 100%)

#let skills(contents) = {
  let code_entries = ""
  let model_entries = ""
  for entry in contents.programming {
    code_entries = code_entries + "\n " + entry
  }
  for entry in contents.modeling {
    model_entries = model_entries + "\n " + entry
  }

  columns(2, gutter: 0.2cm)[
    #text(weight: "bold", "Programming & Software") 
    #text(code_entries)
    
    #colbreak()
    
    #text(weight: "bold", "Hydrodynamic & Environmental Modeling") 
    #text(model_entries)
  ]
}

#skills(
  yaml("perso.yaml").technical_skills
)

= Certifications and Professional Development
#line(length: 100%)

#let certifications(contents) = {

}

#certifications(
  yaml("perso.yaml").certifications
)

= Awards and Honors
#line(length: 100%)

#let awards(contents) = {

}

#awards(
  yaml("perso.yaml").awards_and_honors
)

= Service and Leadership
#line(length: 100%)

#let leadership(contents) = {

}

#leadership(
  yaml("perso.yaml").service_and_leadership
)

= Languages
#line(length: 100%)

#let languages(contents) = {
  for entry in contents {
    [#text(weight: "bold", "Native/Bilingual: ")]
    for language in entry.native {
      [#text(language) ]
    }
    [| #text(weight: "bold", "Fluent: ")]
    for language in entry.fluent {
      [#text(language) ]
    }
    [| #text(weight: "bold", "Basic: ")]
    for language in entry.basic {
      [#text(language) ]
    }
  }
}

#languages(
  yaml("perso.yaml").languages
)