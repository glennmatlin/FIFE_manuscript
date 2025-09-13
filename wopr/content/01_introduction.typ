#import "../config.typ"
= Introduction
#set quote(block:true)
#quote(attribution:[WOPR from "Wargames" 1983])[
A strange game.\
The only winning move is not to play.\
How about a nice game of chess?
]

For thousands of years, the decision to initiate\ violent conflict between groups of people has always been a strictly human affair. The common refrain _"war never changes"_ is incomplete without its ending phrase, "_only the weapons are new_" #footnote["Practical Warfare", pg. 7 @london_practical_1915].\
The reality is that Artificial Intelligence (AI) is radically changing how humans make decisions about war. The use of AI in high-stakes scenarios means that machine errors will be measured using the loss of human life instead of a loss function or a benchmark score. 

The adoption of Artificial Intelligence (AI) as part of real-world decision-making processes has accelerated over the past five years, largely thanks to advancements in research and engineering on Language Models (LMs), which have shown promise in completing long-horizon semantic tasks needed in wargames @kwa_measuring_2025.  LM-powered AI systems are increasingly treated as a general‑purpose technology, providing a natural‑language interface for help with analysis and planning difficult tasks.

// ((TODO: the following text was taken out of the abstract and could possibly be incorporated into the introduction/background areas or other parts of the paper. The content is here: '''This new generation of _Artificial Intelligence (AI) wargames_ relies more on *creative* problem-solving and reasoning over *analytical* rigor and precision. However, there have been significant hurdles for AI researchers when publishing in this field due to the domain-specific and knowledge-intensive requirements of professional wargaming. We present a scoping literature review of #num_papers recent works on AI wargames and present a novel ontology for researchers to engage with AI wargaming. We provide a discussion for researchers on how to use our ontology to appropriately categorize their own game environment and discover new literature ...(TODO)... This paper provides a consolidated look at this emerging area ...(TODO)... and provides clear direction for other researchers to pursue. Our goal is to encourage responsible experimentation with LMs in wargaming and adjacent, language‑centric simulations. ... LMs are particularly useful for wargames with open-ended dynamic problems and when entirely novel actions and solutions can be proposed.'''

The implicit promise of AI to provide general-purpose human-level intelligence via cloud-based scalable computing means that these systems are now of significant interest to national governments, military organizations, and multinational corporations as a means to automate operations, either to achieve higher effectiveness or reduce failure rates.

((RIEDL: Consider "AI wargames" vs. "AI in wargames". I am thinking the latter is more appropriate, so lets ensure we use this consistently throughout))


Wargames are not just for war. The term describes any game ((RIEDL: that... )).
As such, "wargames" are conducted to aide strategic decision making in business, diplomacy, law. diplimacy, and military ((RIEDL: any others?)). ((RIEDL: footnote maybe about D&D here? or ending of entertainment strictly i.e. D&D))
As a result, there is a growing interest among Subject Matter Experts (SMEs) in these communities in how they can leverage AI in wargames, particularly for those that are highly language-centric and thus highly open-ended, affording a high degree of creative ideation by players  
@hogan_open-ended_2024.
This is in contrast to many traditional computer-driven wargames, which have more constrained possibility spaces, limiting their applicability, especially in narrative understanding, social human factors, or unbounded problems @geist_understanding_2022. 
The previous limitations on computer-driven wargames meant conducting language-based, open-ended games relied _entirely_ on SMEs to conduct purely human exercises, which were resource‑intensive and difficult to analyze at scale @mood_war_1954 @perla_war_1987 @davis_illustrating_2017. 

LMs are opening up numerous new possibilities with respect to automating aspects of language-based, open-ended games. At the same time, these opportunities pose serious risks in deployment due to the greater degree of freedom afforded by the open-ended nature of these games @rivera_escalation_2024. Early experiments that let off‑the‑shelf
LMs “play” scripted moves showed brittle reasoning, hallucination, and rule non‑adherence
@lamparth_human_2024.
// @meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022 @wu_enhance_2024 @xu_exploring_2023 @xu_language_2023]

To unlock LMs' immense potential for such wargames, we present the AI research community with a comprehensive scoping literature review that establishes critical, discussion-oriented desiderata for deploying AI in complex wargaming scenarios. This paper fills a significant gap in the literature by providing researchers with both a thorough domain analysis and a strategic roadmap for high-impact research directions.
// We focus on open‑ended and creative wargames where an AI is acting in the role of either a _player_ or an _adjudicator_.

((RIEDL: What do we do in this paper? We present an ontology, and why. We present research questions. What else.))

The key contributions of this paper are:
 + Curated reference catalog on open-ended wargames to guide AI researchers
 + Novel taxonomy to help researchers identify key features of analysis or creativity in wargames
 // + Desiderata-focused discussion on domain-specific needs
 + Critical open research questions and clear directions for additional work.
