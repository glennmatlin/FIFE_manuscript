#import "@preview/tracl:0.6.1": *
#import "../config.typ"
= Background
<sec:background>
For this paper, we will focus our analysis on *serious wargames* @perla_what_1985 @coulthart_whats_2017 @rubel_epistemology_2006 @morgan_wargames_1991.
The term _serious game_ is used to describe games designed for purposes beyond entertainment, such as training, education, analysis, or policy exploration @wallman_its_1995 @smith_serious_2020.  Unlike purely recreational games, the primary objective is to generate insight rather than to optimize win conditions, and design choices are made to support learning and analysis @de_rosa_design_2021. Serious wargames are multi‑faceted depictions of conflict with one or more parties in which the participants’ decisions influence the future outcomes of events, ultimately allowing for real-world insights. Wargame exercises are used to explore strategic choices, elicit expert judgment, or stress‑test plans @us_army_war_college_strategic_2015.
Serious wargames have the following attributes:
- Ongoing conflict between actors with opposing interests or needs;
- A synthetic environment that enables agent choice and feedback;
- Agents make decisions and experience consequences via adjudication or rules;
- Strategic reasoning uses information about other agents and the environment;
- The outcomes of the game are used to inform real-world decisions or generate insights.

Throughout human history, wargames have served as a simplified model of conflict to navigate the world and make effective decisions @perla_why_2011. 
Conflict and war have been a focal topic of games and stories for thousands of years. Strategy wargames are nearly as old as written history. Examples of strategy-focused conflict games can be found across the ancient world, including the Egyptian _Senet_, the Greeks' _Polis_, Chinese _Go_, and India's _Chaturanga_, which eventually became perhaps the most well-known wargame in the world: _Chess_. 
Modern contemporary wargaming evolved from these games to incorporate additional rule systems or maps, and are designed to more closely simulate military battles, most notably _Kriegspiel_ @von_reisswitz-kaderzin_und_grabowska_kriegsspiel_1989.
Wargames have become commercially successful entertainment---_Risk_, _Diplomacy_, _Civilization_, _Twilight Struggle_, _Advanced Squad Leader_, _Space Hulk_, and even _Dungeons \& Dragons_---all grew out of a desire by military leaders to model and simulate the chaotic nature of conflict  @greenberg_outline_1981 @schuurman_game_2021.

== Players vs Adjudicators
<sec:player_vs_adjudicator>
Agents in wargames are commonly grouped into one of two categories: _player_ and _adjudicator_. 
A *player* is an agent that engages in analysis and planning, proposes moves during play, and experiences the consequences of those outcomes. 
The *adjudicator* is an agent that determines outcomes (via rules, computation, or expert judgment) of players' moves.
In some games, such as _Chess_ or _Civilization_, the players are constrained to pre-defined sets of rules. In other games, such as _Dungeons & Dragons_ or _Model United Nations_, actions are unconstrained, and a player can propose any move that they can express in natural language @martin_dungeons_2018. 
Likewise, while adjudicators may be constrained to some _a priori_ defined rules and calculations (e.g., game mechanics defining valid actions and outcomes), they might also be able to propose any effect or world change that can be expressed in natural languages (e.g., expressing player outcomes using narrative generation or mental heuristics) @zhu_calypso_2023. 
In some cases, players and adjudicators can negotiate the effects of moves, with players making the case for why an effect could or could not occur @callison-burch_dungeons_2022 @zhu_fireball_2023.

== Creative vs Analytical Wargames
<sec:creative_vs_analytical>
The nature of game design forces trade-offs between realism and simplicity to manage complexity @wallman_its_1995 @wasser_gaming_2019 @reddie_wargames_2023. Therefore, game designers make intentional choices about the game's scope and rules to focus on the key skills they want to reinforce or gather data about @rouse_game_2001 @walton_developing_2019 @booth_wargame_2024.
SMEs often classify wargames based on the primary skill required for success. One common way to classify games is to place them along a spectrum between *creative wargames* to *analytical wargames* @zegers_matrix_2011 @franken_when_2013 @barzashka_five_2019 @combe_ii_educational_2021 @de_rosa_design_2021.#footnote[In the military domain, these game formats are commonly referred to as seminar wargames and matrix wargames, respectively @us_naval_war_college_war_2015 @ashdown_matrix_2018.]
Creative game types are those that are open-ended, non-linear, and heavily rely on open-ended problem solving, while analytical type games are those that are heavily structured and rule‑based games where analytical skills are more important @zegers_matrix_2011.#footnote[Note that the use of the term _agent_ creativity is not consistent with literature on _human_ creativity, as even playing a highly constrained game like _Chess_ can be regarded as requiring creative problem solving @colton_simon_computational_2012.] 
In @sec:methodology, we present a novel ontology that updates the conceptual design space of wargames to separate players' and adjudicator creativity.


// Consequently, we arrange the space of wargames according to a two-dimensional space, as shown in Figure @fig:creativity-quadrants.
// The horizontal dimension characterizes the player's role, creating a spectrum from analytical to creative. The left-hand side characterizes player moves as _player analytical_, meaning the player is presented with finite, pre-defined action options. The right-hand side of the space characterizes player moves as _player creative_, implying that the player has increasing agency to create new types of moves that could not have been envisioned in advance. The horizontal dimension is identical to the analytical versus creative dimension described in the.

== AI in Wargames
<sec:ai_in_wargamesr>
Contemporary research into AI in wargames has targeted analytical games, where the world state and the ways it can be changed through moves are defined by strict rules and a discrete---though sometimes combinatorially large—--game state space. Common examples include _Chess_, _Go_, and _Starcraft_. @silver_mastering_2017 @vinyals_grandmaster_2019 @goodman_ai_2020 @ma_adaptive_2025 These games do not present opportunities to incorporate ambiguity, creativity, or multi‑party interactions, which are central to open-ended games. Computational support in the form of tightly scoped kinetic or logistical simulations is much more feasible, often providing ground-truth game state and transitions.  Therefore, analytical games are amenable to artificial intelligence game-playing agents using techniques such as state-space search, MCTS, and RL @feng_alphazero-like_2023 @black_scaling_2024. 
These AI techniques can be powerful solvers but at the expense of generalization to novel scenarios @balloch_novgrid_2022.
// @zollicoffer_novelty_2023. ((RIEDL: there is something wrong with the Zollicoffer reference.))
