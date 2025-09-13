#import "../config.typ"
= Background
For this paper, we will focus our analysis on *serious wargames* @perla_what_1985 @coulthart_whats_2017 @rubel_epistemology_2006 @morgan_wargames_1991. Serious wargames are multi‑faceted depictions of conflict with one or more parties in which the participants’ decisions influence the future outcomes of events, ultimately allowing for real-world insights. 
Serious wargames have the following attributes:\
.\
.\
- Ongoing conflict between actors with opposing interests or needs;
- A synthetic environment that enables agent choice and feedback;
- Agents make decisions and experience consequences via adjudication or rules;
- Strategic reasoning uses information about other agents and the environment.
- The outcomes of the game are used to inform real-world decisions or generate insights.

Conflict and war have been a focal topic of games and stories for thousands of years. Strategy wargames are nearly as old as written history. Examples of strategy-focused conflict games can be found across the ancient world, including the Egyptian _Senet_, the Greeks' _Polis_, Chinese _Go_, and India's _Chaturanga_, which eventually became perhaps the most well-known wargame in the world: _Chess_. 
Wargames act as a simplified model of conflict to navigate the world and make effective decisions @perla_why_2011. Modern contemporary wargaming evolved from custom variations of chess that incorporated additional rule systems or maps, designed to simulate military battles, most notably @von_reisswitz-kaderzin_und_grabowska_kriegsspiel_1989.
Wargames have also crossed into games for entertainment; commercially successful modern wargames--_Risk_, _Diplomacy_, _Civilization_, _Twilight Struggle_, _Advanced Squad Leader_, _Space Hulk_, even _Dungeons \& Dragons_--all grew out of a desire by military leaders to model and simulate the chaotic nature of conflict @schuurman_game_2021 @greenberg_outline_1981.

Agents in these games are commonly grouped into one of two categories: _player_ and _adjudicator_. 
A *player agent* is an actor that engages in analysis and planning, proposes moves during play, and experiences the consequences of those outcomes. By contrast, the *adjudicator agent* is the entity that determines outcomes (via rules, computation, or expert judgment) of player moves. Hereafter, these agents are referred to simply as the “player(s)” and the "adjudicator(s)".
In some games such as _Chess_ or _Civilization_, the players are constrained to pre-defined sets of rules. In other games, such as _Dungeons & Dragons_ or _Diplomacy_, actions are unconstrained and a player can propose any move that they can express in natural language. 
Likewise, adjudicators may be constrained to _a priori_ defined rules and calculations (e.g., game mechanics defining valid actions and outcomes), but may also be able to propose any effect or world change that can be expressed in natural languages (e.g., expressing player outcomes using narrative generation or mental heuristics). 
In some cases, players and adjudicators can negotiate the effects of moves, with players making the case for why an effect could or could not occur.

The term _serious games_ is used to describe games designed for purposes beyond entertainment, such as training, education, analysis, or policy exploration @wallman_its_1995 @smith_serious_2020. 
Serious games can be used to explore strategic choices, elicit expert judgment, or stress‑test plans @us_army_war_college_strategic_2015.
Unlike purely recreational games, the primary objective is to generate insight rather than to optimize win conditions, and design choices (facilitation, documentation, evaluation) are selected to support learning and analysis @de_rosa_design_2021.


== Creative vs Analytical Wargames
The nature of game design forces trade-offs between realism and simplicity to manage complexity @wallman_its_1995 @wasser_gaming_2019 @reddie_wargames_2023. Therefore, game designers make intentional choices about the game's scope and rules to focus on the key skills they want to reinforce or gather data about @rouse_game_2001 @walton_developing_2019 @booth_wargame_2024.
SMEs often classify wargames based on the primary skill required for success. One common way to classify games is to place them along a spectrum between *creative wargames* to *analytical wargames* @zegers_matrix_2011 @franken_when_2013 @barzashka_five_2019 @combe_ii_educational_2021 @de_rosa_design_2021.#footnote[In the military domain, these game formats are commonly referred to as seminar wargames and matrix wargames, respectively @us_naval_war_college_war_2015 @ashdown_matrix_2018.]
Creative game types are those that are open-ended, non-linear, and heavily rely on open-ended problem solving, while analytical type games are those that are heavily structured and rule‑based games where analytical skills are more important @zegers_matrix_2011.#footnote[Note that the use of the term _agent_ creativity is not consistent with literature on _human_ creativity, as even playing a highly constrained game like _Chess_ can be regarded as requiring creative problem solving @colton_simon_computational_2012.] 
Open-ended games provide a far greater degree of creative freedom for players to identify the action needed to advance towards their goals and finish the game.  Due to this open-ended nature creative wargames, they have previously relied heavily on SMEs for
scenario design, player actions, and adjudication @perla_war_1987 @perla_why_2011 @coulthart_whats_2017.

Consequently, we arrange the space of wargames according to a two-dimensional space, as shown in @fig:creativity-quadrants.
The horizontal dimension characterizes the player role, creating a spectrum from analytical to creative. The lefthand side characterizes player moves as _player analytical_, meaning the player is presented with finite, pre-defined action options. The righthand side of the space characterizes player moves as _player creative_, implying that the player has increasing agency to create new types of moves that could not have been envisioned in advance. The horizontal dimension is identical to the analytical versus creative dimension described in the.


Contemporary research into AI in wargames has targeted analytical games, where the world state and the ways it can be changed through moves are defined by strict rules and a discrete --- though sometimes combinatorially large —-- game state space. Common examples include _Chess_, _Go_, and _Starcraft_. @silver_mastering_2017 @vinyals_grandmaster_2019 @goodman_ai_2020 @ma_adaptive_2025 These games do not present opportunities to incorporate ambiguity, creativity, or multi‑party interactions, which are central to open-ended games. Computational support in the form of tightly-scoped kinetic or logistical simulations is much more feasible, often providing ground truth game state and transitions.  Therefore, analytical games are amenable to artificial intelligence game-playing agents using techniques such as state-space search, Monte Carlo tree search, or reinforcement learning @feng_alphazero-like_2023 @black_scaling_2024. 
These AI techniques can be powerful solvers but at the expense of generalization to novel scenarios @balloch_novgrid_2022 @zollicoffer_novelty_2023. 

// These categories are respectively referred to as *creative wargames* and *analytical wargames* @franken_when_2013 @barzashka_five_2019.
// Open-ended games provide a far greater degree of creative freedom for players to identify the action needed to advance towards their goals and finish the game. Creativity offers players the freedom to identify unique paths to reach the victory condition, or even change the definition of the victory condition. Due to the open-ended nature of creative wargames, they have previously relied heavily on SMEs for
// scenario design, player actions, and adjudication @coulthart_whats_2017 @perla_war_1987. In the military domain, these game formats are commonly referred to as matrix wargames or seminar wargames @us_naval_war_college_war_2015. This creative wargame style favors players with superior argumentation and decision‑making to navigate the complex open‑ended game state.

// By contrast however, contemporary research into AI in wargames have targeted analytical games where the world state is defined by strict rules, a discrete gamespace where actions often have calculated outcomes. Commonly known examples include Chess, Go, and Starcraft 2.

// Unfortunately, these systems
// struggle with the ambiguity, creativity, and multi‑party interactions central to open-ended games. Computational support exists for tightly scoped kinetic or logistical simulations (e.g., Monte
// Carlo tree search; reinforcement learning) over specific mechanics, but offers little help with the
// narrative argumentation required of open-ended language-based games @black_scaling_2024. Such approaches often have limited interpretability, poor
// generalization to novel scenarios, and difficulty handling long‑form, multi‑party discourse. Open‑ended wargames remain predominantly human‑driven because they
// require creativity, persuasion, and negotiation, not merely optimal move search @perla_why_2011.

// === Analytical
// Analytical wargaming emphasizes formal rules, codified mechanics, and quantitative outcomes.
// It favors repeatability and narrow uncertainty, supports deterministic or stochastic models,
// and enables automation through explicit state representations and scoring.

// === Creative
// Creative wargaming emphasizes narrative reasoning, argumentation, and expert judgment.
// It values plausibility and explanatory richness over strict optimality, and relies on facilitation
// and qualitative adjudication to explore alternative futures.

== Artificial Intelligence in Wargames
To help achieve our goal of bridging the gap between AI researchers and domain SMEs, we adopt the definition of “Artificial Intelligence” (AI) as “the use of computers to carry out tasks that previously required human intelligence” @minsky_semantic_1968. This broad definition is intentional. While much of the recent excitement in AI for wargaming is driven by Large Language Models (LMs), our survey is not exclusively focused on LMs. We consider any system that meets this definition of AI, including symbolic AI, expert systems, and other machine learning approaches. This allows us to provide a more comprehensive overview of the field and its historical context.

//@li_exploration_2025
//@davis_artificial_2025

// Early AI in wargaming largely targeted quantitative or tightly scoped simulations: search and optimization for move planning, stochastic combat models, and agent‑based systems with explicit state. Such approaches perform well in rigid games but offer limited support for open‑ended narrative argumentation and multi‑party persuasion typical of seminar and matrix formats.
