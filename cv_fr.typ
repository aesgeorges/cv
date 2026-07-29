// Layout
#set page(
    paper: "us-letter",
    margin: (
      top: 0.9cm,
      bottom: 1cm, 
      x: .75cm,
    )
  )
#set par(justify: true, spacing: 0.5em)
#set block(spacing: 0.8em)
#set text(
    font: "Libertinus Serif",
    size: 11pt,
  )

// Path to the YAML data file
#let config = "perso_fr.yaml"

// Gender helpers: pass "m" or "f", returns the correct French label
#let lbl-directeur(g) = if g == "f" { "Directrice" } else { "Directeur" }
#let lbl-superviseur(g) = if g == "f" { "Superviseure" } else { "Superviseur(s)" }

// Identity header
#let identity(contents)= {
  align(
      center + horizon,
      text(weight: "bold", size: 20pt, contents.name + "\n") + 
      text(size: 12pt, contents.title + " | " + contents.affiliation) +
      text("\n") + link(contents.email1) + " | " + link(contents.email2) + " | " + link(contents.phone)
    )
}

#identity(
  yaml(config).identity
)

// Each section imports relevant data from the YAML dictionary

= Éducation
#line(length: 100%)

#let perso(contents) = {
  for entry in contents{
    [=== #text(entry.degree) #h(1fr) #text(entry.duration)]
    [ #text(weight: "bold", entry.institution) ]
    if entry.details.advisor != "" {
      [\ #lbl-directeur(entry.details.at("advisor_gender", default: "m")): #text(entry.details.advisor)]
    }
    if entry.details.dissertation != "" {
      [\ Thèse: #text(entry.details.dissertation)]
    }
    if entry.details.specialization != "" {
      [\ Spécialisation: #text(entry.details.specialization)]
    }
  }
}

#perso(
  yaml(config).education
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
  yaml(config).publications
)

= Expérience professionnelle
#line(length: 100%)

#let prof_experience(contents) = {
  for entry in contents {
    [#text(weight: "bold", entry.position) #h(1fr) #text(weight: "bold", entry.date)]
    [\ #text(entry.institution) #h(1fr) #text(entry.location)]
    [\ #lbl-superviseur(entry.at("supervisor_gender", default: "m")): #emph(entry.supervisors)]
    for detail in entry.responsibilities {
      [\ • #text(detail)]
    }
    [\ ]
    [\ ]
  }
}

#prof_experience(
  yaml(config).professional_experience
)

= Présentations en conférence
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
  yaml(config).conference_presentations
)

= Expérience de recherche
#line(length: 100%)

#let research_experience(contents) = {
  for entry in contents {
    [#text(weight: "bold", entry.position) #h(1fr) #text(weight: "bold", entry.date)]
    [\ #text(entry.institution) #h(1fr) #text(entry.location)]
  [\ #lbl-superviseur(entry.at("supervisor_gender", default: "m")): #emph(entry.supervisors)]
    for detail in entry.responsibilities {
      [\ • #text(detail)]
    }
    [\ ]
    [\ ]
  }
}

#research_experience(
  yaml(config).research_experience
)
= Expérience d'enseignement
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
  yaml(config).teaching_experience
)

= Certifications et développement professionnel
#line(length: 100%)

#let certifications(contents) = {
  for entry in contents {
    [#text(weight: "bold", entry.name) | #text(entry.institution) #h(1fr) #text(entry.date)]
    [\ ]
  }
}


#certifications(
  yaml(config).certifications
)


= Compétences techniques 
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
    #text(weight: "bold", "Programmation et logiciels") 
    #text(code_entries)
    
    #colbreak()
    
    #text(weight: "bold", "Modélisation hydrodynamique et environnementale") 
    #text(model_entries)
  ]
}

#skills(
  yaml(config).technical_skills
)

= Distinctions et prix
#line(length: 100%)

#let awards(contents) = {
  for entry in contents {
    [#text(weight: "bold", entry.name) | #text(entry.institution) #h(1fr) #text(entry.date)]
    [\ ]
  }
}

#awards(
  yaml(config).awards_and_honors
)

= Service et leadership
#line(length: 100%)

#let leadership(contents) = {
  for entry in contents {
    [#text(weight: "bold", entry.position) | #text(entry.organization) #h(1fr) #text(entry.date)]
    [\ #text(entry.responsibilities)]
    [\ ]
    [\ ]
  }
}


#leadership(
  yaml(config).service_and_leadership
)

= Langues
#line(length: 100%)

#let languages(contents) = {
  for entry in contents {
    [#text(weight: "bold", "Langue maternelle / bilingue: ")]
    for language in entry.native {
      [#text(language) ]
    }
    [| #text(weight: "bold", "Courant: ")]
    for language in entry.fluent {
      [#text(language) ]
    }
    [| #text(weight: "bold", "Notions: ")]
    for language in entry.basic {
      [#text(language)]
    }
  }
}

#languages(
  yaml(config).languages
)