= Introduction
#set quote(block:true)
#quote(attribution:[WOPR from "Wargames" 1983])[
A strange game. The only winning move is not to play. How about a nice game of chess?
]

For thousands of years, the decision to initiate violent conflict between groups of people has always been a strictly human affair. Although it is often said that "war never changes", the reality is that computer science is radically changing how humans make decisions about war and other high-stakes scenarios where machine errors are measured using human lives instead of a training loss function. Computer science has significantly accelerated the adoption of Artificial Intelligence (AI) as part of real-world decision-making processes thanks in large part to the recent research and engineering progress made with Language Models (LMs). LM-powered AI systems are increasingly treated as a general‑purpose technology, providing a natural‑language interface for help with analysis and planning difficult tasks.\
The implicit promise of AI to provide general-purpose human-level intelligence via cloud-based scalable computing means that these systems are now of significant interest to national governments, military organizations, and multinational corporations as a means to automate operations, either to achieve higher effectiveness or reduce failure rates. 
As a result, there is a growing interest among Subject Matter Experts (SMEs) in these communities in how they can leverage AI for highly creative and open‑ended wargames that emphasize qualitative and language‑centric play. The reason for this interest is that traditional computational approaches to wargames often struggle with narrative understanding, social human factors, or unbounded problems. The previous limitations on computer-driven wargames meant these wargames relied entirely on SMEs to conduct purely human exercises, which were resource‑intensive and difficult to analyze at scale. This is the primary reason why advancements in LMs are opening up numerous new possibilities. At the same time, these opportunities pose a serious safety risk during deployment due to the greater degree of freedom afforded by the open-ended nature of these games. Early experiments that let off‑the‑shelf
LMs “play” scripted moves showed brittle reasoning, hallucination, and rule non‑adherence
@lamparth_human_2024.
// @meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022 @wu_enhance_2024 @xu_exploring_2023 @xu_language_2023]


At time of writing, key SMEs associated with national military organizations are now actively exploring how they can use AI to provide a strategic advatange through superior capabilities. Military researchers are currently investigating how LMs can be used to help AI act as players and adjudicators in open-ended wargames. This news comes at a time when the safety-critcal nature of these systems is of high importance and getting a great deal of attention. However, there is not currently a resource to help AI researchers understand this domain and the needs of SMEs. We believe that scientists and academics have a role to play in the safety of artificial intelligence systems, particularly those in safety-critical settings. \
This paper offers to the AI research community a scoping literature review and discussion-oriented desiderata for open-ended and creative AI wargames. We focus on open‑ended and creative wargames where an AI is acting in the role of either a _player_ or an _adjudicator_,  analyze patterns across recent studies, and present a novel taxonomy to help scientists identify and understand the key features of open-ended and creative wargames to aid them in their own research.\
The key contributions of this paper are:
 + Curated references on open-ended wargames to guide AI researchers
 + Novel taxonomy to help researchers identify both analysis and creativity in wargames
 + Desiderata-focused discussion on domain-specific needs for wargames
 + Identify open research questions and provide clear directions for additional work.
