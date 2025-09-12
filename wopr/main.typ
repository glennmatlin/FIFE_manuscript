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
Language models (LMs) are increasingly being deployed for use in defense and security settings to provide humans with insights for real-world decision-making. One prominent example is the use of LMs to play, adjudicate, and analyze strategic wargames. LMs are particularly useful for contexts with open-ended dynamic problems when gameplay is non-linear and entirely novel solutions can be proposed.
// GLENN: need a hook here that pulls people in using a safety argument of some kind... make it critical and important! danger danger!! get people interested.
This new generation of _Artificial Intelligence (AI) wargames_ relies more on *creative* problem-solving and reasoning over *analytical* rigor and precision. However, there have been significant hurdles for AI researchers when publishing in this field due to the domain-specific and knowledge-intensive requirements of professional wargaming. We present a scoping literature review of #num_papers recent works on AI wargames and present a novel ontology for researchers to engage with AI wargaming. We provide a discussion for researchers on how to use our ontology to appropriately categorize their own game environment and discover new literature ...(TODO)... This paper provides a consolidated look at this emerging area ...(TODO)... and provides clear direction for other researchers to pursue. Our goal is to encourage responsible experimentation with LMs in wargaming and adjacent, language‑centric simulations.]

#include "content/00_abstract.typ"
#include "content/01_introduction.typ"
#include "content/02_background.typ"
#include "content/03_related_works.typ"
#include "content/04_methodology.typ"
#include "content/05_results.typ"
#include "content/06_discussion.typ"
#include "content/07_safety.typ"
#include "content/08_recommendations.typ"
#include "content/09_future_work.typ"
#include "content/10_conclusion.typ"
#include "content/11_impact_statement.typ"


#import "@preview/blinky:0.2.0": link-bib-urls
#let bibsrc = read("zotero.bib")

#link-bib-urls()[
  #bibliography("zotero.bib",
      style: "association-for-computational-linguistics-blinky.csl")
]

#include "content/appendix_A.typ"
#include "content/appendix_B.typ"
// #include "content/cybersecurity_risks_discusson.typ"
