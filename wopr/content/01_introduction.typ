#import "@preview/tracl:0.6.1": *
#import "../config.typ"

= Introduction
<sec:introduction>
#set quote(block:true)
#quote(attribution:[WOPR from "Wargames" 1983])[
A strange game.
The only winning move is not to play.
How about a nice game of _Chess_?
]

For thousands of years, the decision to initiate violent conflict between groups of people has always been a strictly human affair. And while the common refrain goes _"war never changes,"_ it is incomplete without its ending phrase, "_only the weapons are new_".#footnote["Practical Warfare", pg. 7 @london_practical_1915]
The reality is that Artificial Intelligence (AI) is radically changing how humans make decisions about war. The use of AI in high-stakes scenarios means that machine errors will be measured using the loss of human life instead of a loss function or a benchmark score. 

The adoption of AI as part of real-world decision-making processes has accelerated over the past five years, largely thanks to advancements in research and engineering on Language Models (LMs)
// , which have shown promise in completing long-horizon semantic tasks needed in wargames 
@kwa_measuring_2025.  
LM-powered AI systems are increasingly 
// treated as a general‑purpose technology, providing a natural‑language interface for
used to 
help with analysis and planning difficult tasks.
The implicit promise of AI to provide general-purpose human-level intelligence 
// via cloud-based scalable computing 
means that these systems are now of significant interest to national governments, military organizations, and multinational corporations as a means to automate operations, either to achieve higher effectiveness or reduce failure rates.

Wargames, however, are not just for war. The term describes any game that is a multi-faceted depiction of conflict in which the participants’ decisions influence the future outcomes of events.
As such, "wargames" are conducted to aid strategic decision-making in business, diplomacy, law, healthcare, cybersecurity, and military. 
Subject Matter Experts (SMEs) in these communities seek to leverage AI in wargames that are highly language-centric and thus highly open-ended, affording a high degree of creative ideation by players 
@hogan_open-ended_2024.
These games historically could only be conducted as purely human exercises, which were resource‑intensive and difficult to analyze at scale @mood_war_1954 @perla_war_1987 @davis_illustrating_2017. 

This is in contrast to wargames that have constrained possibility spaces and are thus limited in their applicability to scenarios that draw on narrative understanding and social human factors, or are unbounded problem spaces @geist_understanding_2022. 
Games with bounded action spaces and well-defined evaluation criteria are amenable to implementation as computational simulations and for which AI systems such as search, Monte Carlo tree search, and reinforcement learning could be applied effectively.

// The previous limitations on computer-driven wargames meant conducting language-based, open-ended games relied _entirely_ on SMEs to conduct purely human exercises, which were resource‑intensive and difficult to analyze at scale @mood_war_1954 @perla_war_1987 @davis_illustrating_2017. 

LMs open up numerous new possibilities with respect to automating aspects of language-based, open-ended games. At the same time, these opportunities pose a serious risk in deployment due to the greater degree of freedom afforded by the open-ended nature of these games @rivera_escalation_2024. Early experiments with LMs that used off‑the‑shelf
models play an analytical wargame of scripted events, which resulted in brittle reasoning, hallucination, and rule non‑adherence
@lamparth_human_2024.

We present a comprehensive scoping literature review that establishes critical, discussion-oriented desiderata for deploying AI in complex wargaming scenarios. This paper fills a significant gap in the literature by providing researchers with both a thorough domain analysis and a strategic roadmap for high-impact research directions.
// We focus on open‑ended and creative wargames where an AI is acting in the role of either a _player_ or an _adjudicator_.
The key contributions of this paper are:
 - A curated reference catalog on open-ended wargames to guide AI researchers.
 - A novel taxonomy to help researchers identify key features of wargames.
 - A domain-specific desiderata for the application of LMs in wargaming, outlining key design principles and challenges.
 - A framework of best practices for practitioners to mitigate risks and ensure the reliability of LMs in wargaming applications.
 - An examination of the safety considerations for using LMs in wargames.
 - A set of open research questions and clear directions for future work.
