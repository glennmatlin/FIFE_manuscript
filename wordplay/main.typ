#import "@preview/tracl:0.6.1": *

#let mark_corr   = [#super[#sym.star]]
#let mark_second = [#super[#sym.dagger]]
#let mark_contrib= [#super[#sym.dagger.double]]

#show: doc => acl(doc,
  anonymous: false,
  title: [Shall We Play a Game?\
  Language Models for Open-ended Wargames],
  authors: (
    (
      name: [
        Glenn Matlin#mark_corr,\
        Parv Mahajan#mark_second,
        Isaac Song#mark_second,
        Yixiong Hao#mark_second,
        Ryan Bard#mark_second,\
        Stu Topp#mark_contrib, Evan Montoya#mark_contrib,
        M. Rehan Parwani#mark_contrib, Soham Shetty#mark_contrib,\
        Mark Riedl
      ],
      affiliation: "College of Computing, Georgia Institute of Technology",
      email: "glenn@gatech.edu",
    ),
  ),
)


#import "config.typ": num_papers

#abstract[
#include "content/00_abstract.typ"
]
#include "content/01_introduction.typ"
#include "content/02_background.typ"
#include "content/03_methodology.typ"
#include "content/04_results.typ"
#include "content/05_discussion.typ"
#include "content/06_safety.typ"

#include "content/08_future_work.typ"
#include "content/09_related_works.typ"
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