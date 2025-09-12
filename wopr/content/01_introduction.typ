#import "../config.typ"
= Introduction
#set quote(block:true)
#quote(attribution:[WOPR from "Wargames" 1983])[
A strange game.\
The only winning move is not to play.\
How about a nice game of chess?
]

For thousands of years, the decision to initiate violent conflict between groups of people has always been a strictly human affair. Despite the refrain that "war never changes", the reality is that Artificial Intelligence (AI) is radically changing how humans make decisions about war. The use of AI in high-stakes scenarios means that machine errors will be measured using human lives instead of a training loss function. The adoption of Artificial Intelligence (AI) as part of real-world decision-making processes has accelerated over the past five years, largely due to advancements in research and engineering on Language Models (LMs). ...(TODO: some sentence here about LMs and task performance maybe with citations for them) (TODO:CITES for LMs)... LM-powered AI systems are increasingly treated as a general‑purpose technology, providing a natural‑language interface for help with analysis and planning difficult tasks.\
The implicit promise of AI to provide general-purpose human-level intelligence via cloud-based scalable computing means that these systems are now of significant interest to national governments, military organizations, and multinational corporations as a means to automate operations, either to achieve higher effectiveness or reduce failure rates.\
As a result, there is a growing interest among Subject Matter Experts (SMEs) in these communities in how they can leverage AI wargames, particularly for highly creative and open‑ended wargames that emphasize qualitative and language‑centric play 
@hogan_open-ended_2024.
The reason for this interest is that traditional computational approaches to wargames often struggle with narrative understanding, social human factors, or unbounded problems @geist_understanding_2022. The previous limitations on computer-driven wargames meant these wargames relied entirely on SMEs to conduct purely human exercises, which were resource‑intensive and difficult to analyze at scale @mood_war_1954 @davis_illustrating_2017 @perla_war_1987. This is the primary reason why advancements in LMs are opening up numerous new possibilities. At the same time, these opportunities pose a serious safety risk during deployment due to the greater degree of freedom afforded by the open-ended nature of these games @rivera_escalation_2024. Early experiments that let off‑the‑shelf
LMs “play” scripted moves showed brittle reasoning, hallucination, and rule non‑adherence
@lamparth_human_2024.
// @meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022 @wu_enhance_2024 @xu_exploring_2023 @xu_language_2023]
At the time of writing, key SMEs associated with multiple national military organizations are actively exploring how they can use AI to provide experiential learning and potentially establish a strategic advantage through superior decision-making and judgment @black_scaling_2024. We have observed how both military SMEs and academic researchers are currently investigating how LMs can be used to help AI act as players and adjudicators in open-ended wargames @black_mastering_2024 @griffin_matrix_2024. This news comes at a time when the safety-critical nature of these systems is of high importance and is receiving considerable attention. However, there is not currently a resource to help bridge the understanding gap between AI researchers and SMEs for this domain. We believe that non-military scientists and academics have a major role to play in the effectiveness and alignment of AI systems, particularly those in safety-critical settings. \
To address this problem, this paper presents the AI research community with a scoping literature review and discussion-oriented desiderata for open-ended and creative AI wargames. This paper serves as a resource aid for researchers, providing an explanation of the domain and identifying directions for further research.
// We focus on open‑ended and creative wargames where an AI is acting in the role of either a _player_ or an _adjudicator_.
\
The key contributions of this paper are:
 + Curated reference catalog on open-ended wargames to guide AI researchers
 + Novel taxonomy to help researchers identify key features of analysis or creativity in wargames
 // + Desiderata-focused discussion on domain-specific needs
 + Identify open research questions and provide clear directions for additional work.
