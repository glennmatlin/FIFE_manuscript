= Background
== Artificial Intelligence
To help achieve our goal of bridging the gap between AI researchers and domain SMEs, we adopt the definition of “Artificial Intelligence” (AI) “the use of computers to carry out tasks that previously required human intelligence”. (TODO:CITE RAND!). \ // @national_security_commission_on_artificial_intelligence_final_2021 @sayler_artificial_2019
(TODO: Glenn needs to write here about the defintion of AI used, how it informed out survey scope, and then update the appendix survey definition etc. we should also link the appendix here as well!)
== Wargames
Conflict and war have been a focal topic of games and stories for thousands of years. Strategy wargames are nearly as old as written history, and have been a part of humanity for thousands of years. Examples of strategy-focused conflict games can be found across the ancient world, including the Egyptian _Senet_, the Greeks' _Polis_, Chinese _Go_, and India's _Chaturanga_, which eventually became perhaps the most well-known wargame in the world -- Chess. Over thousands of years, humans have relied on wargames as a simplified model of conflict to navigate their world and make effective decisions @perla_why_2011. Modern contemporary wargaming, as we now know it, grew out of the many different variations of chess that were created with additional rule systems or maps intended to help simulate military battles @von_reisswitz-kaderzin_und_grabowska_kriegsspiel_1989.
Wargames have provided humans with many late nights of entertainment #footnote["Just one more turn"]. Despite the commercial success of modern wargames, all these descendants ultimately grew out of a desire by military leaders to model and simulate the chaotic nature of conflict @schuurman_game_2021 @greenberg_outline_1981.
// @caffrey_history_2000
// @specht_war_1957 @vlahos_wargaming_1986, 
Wargames offer humans a simplified mental model that allows them to abstract away particulars and navigate decision-making and analyze the results @us_naval_war_college_fundamentals_1966 @us_army_war_college_strategic_2015.
After thousands of years of human research and design, wargames have now grown to be an aindispensable part of military education and experiential learning across the globe @us_army_how_2023 
@us_naval_war_college_war_2015
@australian_armed_forces_wargaming_2022 
@uk_ministry_of_defense_wargaming_2017 @polish_armed_forces_wargaming_2022 
@french_ministry_of_the_armed_forces_wargaming_2024 
@deutschland_bundeswehr_wargaming_2006 @croatian_military_academy_introduction_2019 @nato_wargaming_2023.
The term serious games is used to describe games designed for purposes beyond entertainment, such as training, education, analysis, or policy exploration (CITE: more cites for serious games) @wallman_its_1995. Serious games are used to explore strategic choices, elicit expert judgment, or stress‑test plans (CITE: for serious game). Unlike purely recreational games, the primary objective is to generate insight rather than to optimize win conditions, and design choices (facilitation, documentation, evaluation) are selected to support learning and analysis (CITE).
Volumes of military literature for wargames over two hundred years have established numerous core definitions, taxonomies of formats
(seminar, matrix, kriegsspiel, etc.), and adjudication philosophies (rigid rules vs. free adjudication). What all of these rules ultimately share in common is that they emphasize
strategic planning, managing uncertainty, and the role of facilitation and judgment in
producing insights rather than score-keeping. This long
tradition is our motivation to focus on language‑based or open-ended wargames.\
For this paper, we will adopt the academic definition for *serious wargames*, which are a multi‑faceted depiction of conflict with one or more parties in which the participants’ decisions influence the future outcomes of events, ultimately allowing for real-world insights. Based on our review of current literature, we adopt the following formal academic definition of the term wargame @coulthart_whats_2017 @us_army_war_college_strategic_2015  @rubel_epistemology_2006 @morgan_wargames_1991:
+ Ongoing conflict between actors with opposing interests or needs;
+ A synthetic environment that enables agent choice and feedback;
+ Agents make decisions and experience consequences via adjudication or rules;
+ Strategic reasoning uses information about other agents and the environment.
// + TODO: possible to add a bullet here to limit definition to serious


== Creative vs Analytical
// TODO FOR RIEDL: Any comments here about computational creativity, lab citations here as relevant
// CITE: Creativity in LLM-based Multi-Agent Systems: A Survey
Computational creativity has been a topic of study for many years ...(TODO: Riedl + Glenn FILL HERE)...

The nature of game design forces trade-offs between realism and simplicity in order to manage complexity to help games flow properly and allow humans to gain insight from the experience. @wallman_its_1995 @walton_developing_2019.
SMEs have often classified wargames based on the primary skill required for success @deutschland_bundeswehr_wargaming_2017 @uk_ministry_of_defense_wargaming_2017. One common method SMEs use is placing games somewhere on a spectrum spanning from analytical to creative based on the qualitative aspects and game mechanics
@combe_ii_educational_2021 @de_rosa_design_2021 @ashdown_matrix_2018. Creative game types are those that are open-ended, non-linear games that heavily rely on creative problem solving, while the second is heavily structured and rule‑based games where analytical skills are more important @zegers_matrix_2011. These categories are respectively referred to as *creative wargames* and *analytical wargames* @franken_when_2013 @barzashka_five_2019.
Open-ended games provide a far greater degree of creative freedom for players to identify the action needed to advance towards their goals and finish the game. Creativity offers players the freedom to identify unique paths to reach the victory condition, or even change the definition of the victory condition. Due to the open-ended nature of creative wargames, they have previously relied heavily on SMEs for
scenario design, player actions, and adjudication @coulthart_whats_2017 @perla_what_1985. In the military domain, these game formats are commonly referred to as matrix wargames or seminar wargames @us_naval_war_college_war_2015. This creative wargame style favors players with superior argumentation and decision‑making to navigate the complex open‑ended game state.

By contrast however, contemporary research into AI wargames have targeted analytical games where the world state is defined by strict rules, a discrete gamespace where actions often have calculated outcomes. Commonly known examples include Chess, Go, and Starcraft 2. (TODO: CITE)

Unfortunately, these systems
struggle with the ambiguity, creativity, and multi‑party interactions central to open-ended games. Computational support exists for tightly scoped kinetic or logistical simulations (e.g., Monte
Carlo tree search; reinforcement learning) over specific mechanics, but offers little help with the
narrative argumentation required of open-ended language-based games @black_scaling_2024. Such approaches often have limited interpretability, poor
generalization to novel scenarios, and difficulty handling long‑form, multi‑party discourse. Open‑ended wargames remain predominantly human‑driven because they
require creativity, persuasion, and negotiation, not merely optimal move search @perla_why_2011.

=== Analytical
Analytical wargaming emphasizes formal rules, codified mechanics, and quantitative outcomes.
It favors repeatability and narrow uncertainty, supports deterministic or stochastic models,
and enables automation through explicit state representations and scoring.

=== Creative
Creative wargaming emphasizes narrative reasoning, argumentation, and expert judgment.
It values plausibility and explanatory richness over strict optimality, and relies on facilitation
and qualitative adjudication to explore alternative futures.