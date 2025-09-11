= Background
== Artificial Intelligence
To help achieve our goal of bridging the gap between AI researchers and domain SMEs, we adopt the definition of “Artificial Intelligence” (AI) “the use of computers to carry out tasks that previously required human intelligence”. (TODO:CITE RAND!). \ // @national_security_commission_on_artificial_intelligence_final_2021 @sayler_artificial_2019
(TODO: Glenn needs to write here about the defintion of AI used, how it informed out survey scope, and then update the appendix survey definiton etc. we should also link the appendix here as well!)
== Wargames
// """
// 3.4 Wargames
// Wargaming has recently been used for forecasting AI progress (Kokotajlo et al., 2024),
// and recent work has explored automating wargames with LLMs (Hogan & Brennen, 2024)
// """
Conflict and war have been a focal topic of games and stories for thousands of years. Strategy wargames are nearly as old as written history, and have been a part of humanity for thousands of years. Examples of strategy-focused conflict games can be found across the ancient world, including the Egyptian _Senet_ (CITE), the Greeks' _Polis_ (CITE), and India's _Chaturanga_ (CITE), which eventually became the most well-known wargame in the world -- Chess. Over thousands of years, humans have relied on games as a simplified model of conflict to better understand their world and make decisions. Modern contemporary wargaming as we now know it grew out of the many different variations of chess that were created to simulate battles or other conflicts (TODO: CITE von Reisswitz, 1824).
Wargames have provided art and entertainment to many. Still, all these games grew out of a desire by militaries to model and simulate the chaotic nature of conflict to help them with real-world decision-making. The term “serious games” is used to describe games designed for purposes beyond entertainment, such as training, education, analysis, or policy exploration. Serious games are used to explore strategic choices, elicit expert judgment, or stress‑test plans. Unlike purely recreational games, the primary objective is to generate insight rather than to optimize win conditions, and design choices (facilitation, documentation, evaluation) are selected to support learning and analysis.
// The SME community commonly defines *wargames* as _“a multi‑faceted depiction of conflict with one or more parties in which the participants’ decisions influence the future outcomes of events”_ @perla_what_1985
 // @noauthor_wargaming_2017; @caffrey_toward_nodate]
 For this paper, we define wargames as a multi‑faceted depiction of conflict with one or more parties in which the participants’ decisions influence the future outcomes of events. We adopt the following formal academic definition of the term wargame:
+ Ongoing conflict between actors with opposing interests or needs;
+ A synthetic environment that enables agent choice and feedback;
+ Agents make decisions and experience consequences via adjudication or rules;
+ Strategic reasoning uses information about other agents and the environment. @coulthart_whats_2017 @james_markley_strategic_2015 @perla_what_1985


== Creative vs Analytical
// TODO FOR RIEDL: Any comments here about computational creativity, lab citations here as relevant
// CITE: Creativity in LLM-based Multi-Agent Systems: A Survey
Computational creativity has been a topic of study for many years ...(TODO: FILL HERE)...
Wargame experts at the UK MOD (CITE) have previously offered a taxonomy of analytical vs creative for wargames. They proposed to classify wargames using two broad groups. The first was open-ended non-linear games that heavily rely on creative problem solving, while the second is heavily structured and rule‑based games where analytical skills are more important. These categories are respectively referred to as creative and analytical wargames.
Open-ended games provide a far greater degree of creative freedom for players to identify the action needed to advance towards their goals and finish the game. Creativity offers players freedom to identify many unique paths to a victory conditon. Open-ended and creative wargames rely heavily on SMEs for
scenario design, player actions, and adjudication @coulthart_whats_2017 @perla_what_1985. In the military domain, these games formats are commonly referred to as matrix wargames or seminar wargames. This creative wargame style favors players with superior argumentation and decision‑making to navigate the complex open‑ended game state.

By contrast however, contemporary research into AI wargames have targeted analytical games where the world state is defined by strict rules, a discrete gamespace where actions often have calculated outcomes. Commonly known examples include Chess, Go, and Starcraft 2. (TODO: CITE)

Unfortunately, these systems
struggle with the ambiguity, creativity, and multi‑party interactions central to open-ended games. Computational support exists for tightly scoped kinetic or logistical simulations (e.g., Monte
Carlo tree search; reinforcement learning) over specific mechanics, but offers little help with the
narrative argumentation required of open-ended language-based games @black_scaling_2024. Such approaches often have limited interpretability, poor
generalization to novel scenarios, and difficulty handling long‑form, multi‑party discourse. Open‑ended wargames remain predominantly human‑driven because they
require creativity, persuasion, and negotiation, not merely optimal move search @perla_why_2011 @noauthor_wargaming_2017 @coulthart_whats_2017.

=== Analytical
Analytical wargaming emphasizes formal rules, codified mechanics, and quantitative outcomes.
It favors repeatability and narrow uncertainty, supports deterministic or stochastic models,
and enables automation through explicit state representations and scoring.

=== Creative
Creative wargaming emphasizes narrative reasoning, argumentation, and expert judgment.
It values plausibility and explanatory richness over strict optimality, and relies on facilitation
and qualitative adjudication to explore alternative futures.