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
Wargames are multi-faceted, multi-player depictions of conflict in which the participants decisions influence the future outcomes of events.
Wargames are often used for subject matter experts to explore strategic implications of decision-making, though it also encapsulates entertainment-oriented simulations from _Chess_ to table-top role-playing games like _Dungeons & Dragons_. 
On the more open-ended side of the spectrum of wargames, players use natural language to convey their moves and adjudicators propose outcomes.
Language models (LMs) are increasingly being considered for use in defense and security settings to provide subject matter experts with insights into real-world, consequential decisions. 
We conduct a scoping literature review of a curated selection of #num_papers recent works on AI in wargames from which we construct an ontology of wargames in terms of the creativity afforded players and the creativity afforded adjudicators. 
Focusing on the space of wargames with the most open-endedness for players and adjudicators, we distill a set of considerations for when and how to use LMs in different application areas. We also present a set of safety considerations, best practices for deploying LMs in open-ended, language-based wargames, and conclude with a set of open research challenges.

// One prominent example is the use of *LMs for wargames* --- a depiction of conflict in which the participants’ decisions influence the future outcomes of events.
// Based on a scoping literature review of a curated selection of #num_papers recent works on AI in wargames, we construct an ontology of wargames in terms of the creativity afforded to the player's action space and the adjudicator's judgement space.
// We discuss both serious application areas (finance, medicine, diplomacy, and military) as well as entertainment applications (table-top role-playing and video games), where we describe the research challenges associated with each domain.
// As serious applications of wargames can have significant societal and safety implications, we motivate further research on LMs in wargames.
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
#include "content/tables/table_v5.typ"
#include "content/appendix_A.typ"
// #include "content/appendix_B.typ"
#include "content/appendix_C.typ"
#include "content/appendix_D.typ"
#include "content/appendix_E.typ"
