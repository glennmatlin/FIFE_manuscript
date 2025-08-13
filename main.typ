
// This is a minimal starting document for tracl, a Typst style for ACL.
// See https://github.com/coli-saar/tracl for details.


#import "@preview/tracl:0.6.1": *

#show: doc => acl(doc,
  anonymous: true,
  title: [Financial Instruction Following Evaluation (FIFE)],
  authors: (
    (
      name: "Glenn Matlin, Siddharth Siddharth, Sudheer Chava",
      affiliation: [Georgia Institute of Technology],
      email: "glenn@email.edu",
    ),
  ),
)


#abstract[
  #lorem(50)
]


= Introduction

#lorem(80)

#lorem(80)

#lorem(80)


// Uncomment this to include your bibliography

/*
#import "@preview/blinky:0.2.0": link-bib-urls
#let bibsrc = read("custom.bib")

#link-bib-urls()[
   #bibliography("custom.bib", style: "./association-for-computational-linguistics-blinky.csl")
]
*/