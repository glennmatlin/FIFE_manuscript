#import "@preview/tracl:0.6.1": *


#show: doc => acl(doc,
  anonymous: true,
  title: [Shall We Wordplay a Game?\
  Language Models for Wargames],
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
Language models (LMs) are increasingly being deployed for use in defense and security settings to provide humans with insights for real-world decision-making. One prominent example is the use of *LMs for wargames* --- a depiction of conflict in which the participants’ decisions influence the future outcomes of events.
Based on a scoping literature review of a curated selection of #num_papers recent works on AI in wargames, we construct an ontology of wargames in terms of the creativity afforded to the player's action space and the adjudicator's judgement space.
We discuss both serious application areas (finance, medicine, diplomacy, and military) as well as entertainment applications (table-top role-playing and video games), where we describe the research challenges associated with each domain.
As serious applications of wargames can have significant societal and safety implications, we motivate further research on LMs in wargames.
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
#include "content/tables/table_v2.typ"
#include "content/appendix_A.typ"
// #include "content/appendix_B.typ"
#include "content/appendix_C.typ"
#include "content/appendix_D.typ"
#include "content/appendix_E.typ"
