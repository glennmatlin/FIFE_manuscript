#import "@preview/tracl:0.6.1": *
#import "../config.typ":num_papers
= Ontology of Wargames

The original conception of a spectrum between creative wargames and analytical wargames conflates the roles of player and adjudicator.
As we argue below, considering the analytical versus creative nature of the players separate from that of the adjudicator helps us understand the space of games with respect to AI approaches.
While prior categorization schemes focus on the flexibility afforded to the player, they elide the unique challenges inherent when the player's moves are language-based.
While it would appear that increased flexibility afforded to players, in the form of language descriptions of moves, must necessarily be met with increased flexibility afforded to the adjudicator in the form of language descriptions of outcomes, it need not be the case.
The presence of natural language in wargames is not equal across all games. 
Consider _Twilight Imperium_, where players negotiate deals in natural language, but the resulting exchanges (e.g., trade goods, promissory notes) are recorded in structured terms that are simple to adjudicate.
Consider also games such as _Free Kriegsspiel_, in which players' actions are limited to the movements of army pieces on a board. At the same time, the adjudicator has a high degree of autonomy to dictate---and explain---the outcomes of each move.
These examples demonstrate that the degree of creativity afforded to the player and the adjudicator can be considered as two independent axes, which form the basis of our proposed ontology.

#figure(
  placement: bottom,
  scope: "parent",
  table(
    columns: (auto, auto, auto),
    stroke: none,
    column-gutter: 1em,
    align: left,
    table.hline(),
    [*Axis*], [*Analytical*], [*Creative*],
    [Player], [Fixed scripts; narrow menus], [Novel proposals; free-form argumentation],
    [Adjudicator], [Deterministic rules/tables], [Expert narrative judgment; flexible calls],
    table.hline()
  ),
  caption: [Open-endedness axes with categorical levels (Analytical/Creative) for player and adjudicator],
)<table:creativity-axis>
#figure(
  image("figures/fig_ontology.svg"),
  placement: bottom,
  caption: [Ontology of AI creativity in wargames with illustrative example games in each of the four quadrants.]
) <fig:creativity-quadrants>

#figure(
image("figures/fig_by_year_quadrant_area_2col.svg"),
  placement: bottom,
  caption: [The distribution of selected papers on AI in wargames by quadrant over time from 2020 to 2025. *_Note:_* At the time of writing, 2025 is incomplete.
],
) <fig:plot_over_time>


To remedy this deficiency with the classic analytical to creative spectrum, we add a second dimension, which characterizes the adjudicator's role, as defined in @table:creativity-axis and represented visually in @fig:creativity-quadrants. To be in the bottom half of the space, adjudicator's responses to the player are characterized as _adjudicator analytical_, meaning the adjudicator's responses to the player are limited to prescribed responses. To be on the top half of the space, the adjudicator's responses to the player are characterized as _adjudicator creative_, meaning the adjudicator has the agency to create novel responses. 
Inherent to this is the ability for the players to negotiate the outcome with the adjudicator. This negotiation is not a player move per se, but happens after the move is made as a means to dynamically alter the mapping from the player's move to the response.
As seen in @fig:plot_over_time, recent work has shifted sharply toward more open-ended wargames, particularly for player creativity. We attribute this acceleration to the rise of LMs. Although 2025 counts are incomplete, early preprints under review indicate the upward trajectory continues.

== Quadrant I: Analytical Player, Analytical Adjudicator
This quadrant covers rigid, rule-based systems for both the players and the adjudicators (often
predetermined scoring). 
Games in this quadrant include traditional strategy board games such as _Chess_, _Go_, and the original _Kriegspiel_, as well as more modern variants such as _Stratego_, the No Press variant of _Diplomacy_, _Warhammer 40k_, and _Starcraft_ @vinyals_grandmaster_2019 @schuurman_GameContextsPrussianGerman_2021 @bakhtin_mastering_2022 @bakhtin_mastering_2022 @anthony_learning_2020.
Because players act from prescribed menus and adjudication reduces to deterministic scoring, these titles are ideal for high-throughput simulation.
RL, MCTS, and related search-heavy approaches thrive here, yet the rigid action spaces leave little room for LM advantages such as narrative reasoning @anthony_learning_2020 @perolat_mastering_2022 @light_strategistselfimprovementllm_2025 @gao_LandBasedWarGamingSimulation_2024.

== Quadrant II: Analytical Player, Creative Adjudicator
This quadrant covers games in which players are often relatively limited in their action space, while a human SME adjudicator determines the outcomes based on their judgment. Our data suggests this configuration is not currently common for AI in wargames. Games that would fall into this quadrant include variants of wargames such as Meckel's early version of _Free Kriegsspiel_ @schuurman_GameContextsPrussianGerman_2021. 
It also includes a class of procedural-based human-adjudicated war games  involving high-fidelity military simulations where established orders and procedures constrain player actions while human experts decide action outcomes. Examples include major real-world wargames such as early US Navy Fleet Problems and standard Tactical Exercise Without Troops (TEWT), where the focus is on decisions within procedural military actions as the field expert adjudicator determines the outcomes @nofi_hm_2010 @john_armatys_wargame_2022. 

Other types of games that fall under this category include semi-rigid adjudicated wargames, where the game is played rigidly and adjudicators have the possibility of overriding the outcomes, such as tightly scripted training vignettes where SME adjudicators improvise consequences @ukministryofdefense_WargamingHandbook_2017. Outside of military wargames, certain corporate wargames also fall into this quadrant; these games share similar emphasis on managerial or operational procedures over a creatively adjudicated and simulated scenario @cohen_role_1961 @hershkovitz_wargame_2019. Generally, wargames in this quadrant tend to lean more towards serious games with common shared emphasis on resolving realistic human-adjudicated scenarios with established procedures.
// ((RIEDL: do we have anything to say about AI?))
// ((TODO for ISAAC or GLENN))

== Quadrant III: Creative Player, Analytical Adjudicator
This quadrant covers games with highly creative agents alongside tightly fixed adjudication—expressive, low-procedural-complexity titles that still rely on rigid scoring, such as _Quo Vadis_, _Article 27: The UN Security Council Game_, and _The Resistance: Avalon_ @martinenghi_llms_2024.
It attracts LM research because games like _Diplomacy_ blend natural-language negotiation with deterministic resolution; Cicero shows that coordinated planning plus chat-channel conditioning can match strong human play @meta_fundamental_ai_research_diplomacy_team_human-level_2022.
This was possible, however, because the negotiations only occur within a prescribed stage of gameplay and does not affect adjudication, which can be automated. The game design of rigid adjudication and procedural resolution of conflicts means the evaluation is relatively straightforward and repeatable, which helps explain its popularity in AI competitions and benchmarking.

However, the limited evaluation creativity that makes Q-III attractive also limits the generalizability of AI contributions. 
// The rigid
// adjudication and procedural constraints in much existing research across the quadrants strongly
// constrain the effect of the expressive creativity. 
While games in this quadrant often focus on social interactions of the players, the constrained procedural actions limit complex or realistic games and with low nuance in the outcome of those social interactions.

== Quadrant IV: Creative Player, Creative Adjudicator
This quadrant covers wargames in which both players and adjudicators use qualitative expressions in open-ended games. These are often discussion-based exercises that prioritize strategic creativity and narrative plausibility over rigid rule-sets. Prominent examples include modern seminar-style wargames, such as the U.S. Army's TRADOC wargames used to explore future military concepts, and matrix wargames like the "ISIS Crisis" game, which use a structured argumentation format to analyze complex, multi-faceted conflicts @us_army_how_2023 @downes-martin_WargamingSupportForce_2025. Adjudicated simulations, such as Model United Nations, where participants engage in diplomatic role-playing, also fall into this category. Furthermore, most tabletop role-playing games (TTRPGs) involve non-combat, non-die-based portions of play that are exemplars of Q-IV wargames. Readers may know games like  _D&D_, _Shadowrun_, _Paranoia_, _Call of Cthulhu_, and _Vampire: The Masquerade_ as examples of this quadrant, where player freedom is high and a Game Master provides narrative adjudication.
#footnote[TTRPGs can be played with varying emphasis on combat and rules. A rigid form of play, focusing only on combat where adjudication strictly follows the rules and die rolls, would shift TTRPGs into Q-I. An extreme variation where players follow rigid rules but the Game Master ignores die rolls to determine the outcomes would be in Q-II; this style is exemplified by video games where a human controls the results.]

Games that allow creativity for both players and adjudicators better support classic aims of wargaming: exploring uncertainty, revealing assumptions, and eliciting expert judgment. Real-world scenarios involving complex social interactions are hard to formalize and attempts to create rule sets for players or adjudicators  tend to over-simplify real-world phenomena to the point where outcomes are hard to make actionable in the real world.
Within the context of playing games with entirely human players and entirely human adjudicators, this games in this quadrant are well-explored; treatises on this matter trace back to the _Free Kriegsspiel_ movement @schuurman_GameContextsPrussianGerman_2021 from the early 1870s. However, despite their practical utility for simulating complex real-world environments, few have attempted to _automate_ construction or evaluation processes for Q-IV settings.
Games in this quadrant have, until recently, been beyond the reach of practical computing.
However, this changes with the availability of highly capable LMs.

Quadrant IV wargames are particularly well-suited to leverage the improving capabilities of AI. LMs are trending toward longer time-horizon competence, expanding context windows, and enhanced retrieval across longer contexts @kwa_measuringaiability_2025 @zhang_inftybench_2024. They also exhibit improvements in persuasion and qualified judgment @karger_ForecastBenchDynamicBenchmark_2025 @schoenegger_large_2025, indicating a trajectory toward more capable agents and adjudicators.

However, Q-IV wargames also present unique safety concerns. Creative players may develop novel strategies or exploit scenario ambiguities in ways that push beyond the exercise's intended scope. In contrast, creative adjudicators possess significant latitude when interpreting player actions and determining the outcome. The open-ended nature of this generation allows for AI to introduce bias, inconsistency, or inappropriate scenario escalation. These risks are compounded when AI systems assume both roles, due to the combination of reduced human oversight and expressive flexibility.
