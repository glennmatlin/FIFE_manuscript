#import "@preview/tracl:0.6.1": *


#show: doc => acl(doc,
  anonymous: true,
  title: [Shall We Play a Game?\
  Language Models for Open-ended Wargames],
   authors: (
    (
      name: "Anonymous",
      affiliation: [Anonymized for review],
      email: "anonymous@invalid",
    ),
  ),
)

#import "config.typ": num_papers

#abstract[
#include "content/00_abstract.typ"
]

#include "content/01_introduction.typ"
#include "content/02_background.typ"
#include "content/04_methodology.typ"
#include "content/05_results.typ"
#include "content/06_discussion.typ"
#include "content/07_safety.typ"
#include "content/08_recommendations.typ"
#include "content/09_future_work.typ"
#include "content/03_related_works.typ"
#include "content/10_conclusion.typ"


#import "@preview/blinky:0.2.0": link-bib-urls
#let bibsrc = read("zotero.bib")

#link-bib-urls()[
  #bibliography("zotero.bib",
      style: "association-for-computational-linguistics-blinky.csl")
]

#appendix[
  #include "content/appendix_impact.typ"
  #include "content/appendix_wargames.typ"
  #include "content/appendix_recommendations.typ"
]