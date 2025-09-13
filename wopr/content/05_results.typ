#import "../config.typ":num_papers
= Ontology of Wargames

The current conception of a spectrum between creative wargames and analytical wargames conflates the player and the adjudicator.
As we argue below, considering the analytical versus creative nature of the players separate from that of the adjudicator helps us understand the space of games with respect to AI approaches.

While prior categorization schemes focus on the flexibility afforded to the player, they elide the unique challenges inherent when the player's moves are language-based. 
Unlike traditional simulations with structured inputs and discrete, well-defined action effects, language-based systems operate in vast, open-ended semantic spaces. 
While it would appear that increased flexibility afforded to players, in the form of language descriptions of moves, must necessarily be met with increased flexibility afforded to the adjudicator in the form of language descriptions of outcomes, it need not be the case.
The presence of natural language in wargames is not equal across all games. 
Consider the game of _Diplomacy_ in which players can communicate naturally to make trade deals, but the final form of the trade deal must be highly structured in terms of resource exchanges that are simple to adjudicate.

Consider also games such as _Free Kriegspiel_ and _Navy Fleet Problems_ in which the players' actions are limited to movements of army pieces on a board. Still, the adjudicator has a high degree of autonomy to dictate---and explain---the outcomes of each move.
These examples demonstrate that the degree of creativity afforded to the player and the adjudicator can be considered as two independent axes, which form the basis of our proposed ontology.

To remedy this deficiency with the classic analytical to creative spectrum, we add a vertical dimension, which characterizes the adjudicator's role. To be in the top half of the space, adjudicator's responses to the player are characterized as _adjudicator analytical_, meaning the adjudicator's responses to the player are limited to prescribed responses. To be on the bottom half of the space, the adjudicator's responses to the player are characterized as _adjudicator creative_, meaning the adjudicator has the agency to create novel responses. 
Inherent to this is the ability for the players to negotiate the outcome with the adjudicator. This negotiation is not a player move per se, but happens after the move is made as a means to dynamically alter the mapping from the player's move to the response.

#figure(
  placement: top,
  scope: "parent",
  table(
    columns: (auto, auto, auto),
    stroke: none,
    column-gutter: 1em,
    align: left,
    table.hline(),
    [*Axis*], [*Analytical*], [*Creative*],
    [Player], [Fixed scripts; narrow menus], [Novel proposals; free‑form argumentation],
    [Adjudicator], [Deterministic rules/tables], [Expert narrative judgment; flexible calls],
    table.hline()
  ),
  caption: [Open‑endedness axes with categorical levels (Analytical/Creative) for player and adjudicator],
)

Evaluating AI in language-centric wargames presents unique challenges. Unlike traditional simulations with clear-cut rules and actions, these wargames are open-ended and revolve around natural language. This means that instead of discrete moves on a board, we have complex, high-dimensional text outputs representing arguments, justifications, and actions. This makes direct comparisons and reproducible evaluations difficult. Therefore, our analysis focuses not just on the outcomes of the games, but also on the quality, coherence, and plausibility of the language the AI agents use.

#figure(
  image("figures/taxonomy_games.png"),
  caption: [Open‑endedness quadrants (illustrative placement of formats).],
) <fig:creativity-quadrants>


== Quadrant I: Analytical Player, Analytical Adjudicator
This quadrant covers rigid, rule‑based systems for both the players and the adjudicators (often
predetermined scoring). Of the quadrants, this quadrant is among the most extensively explored, as it captures traditional “quantitative” wargames. Rigid rules or computer simulations excel at repeatability but can offer poor novel insight generation due to the necessary constraints of the simulation rules or game engine.
Notable examples include the No‑Press variant of Diplomacy, the original rigid Kriegsspiel, and nearly the entirety
of strategy board games both traditional (e.g. chess, checkers, and Go) or modern (e.g. Stratego, Warhammer 40k, and Starcraft) @vinyals_grandmaster_2019 @schuurman_game_2021 @bakhtin_mastering_2022 @bakhtin_mastering_2022 @anthony_learning_2022.

These games often benefit less from recent developments in LMs because of its rigid nature, with RL approaches being more common. @anthony_learning_2022 @perolat_mastering_2022 @light_strategist_2024 @gao_land-based_2024

== Quadrant II: Analytical Player, Creative Adjudicator
This quadrant covers games in which players are often relatively limited in their action space, while a human SME adjudicator determines the outcomes based on their judgment. This configuration is not common for wargames, but it is possible. Games that would fall into this quadrant include variants of wargames such as Meckel's early version of Free Kriegsspiel and the class of procedural-based human-adjudicated war games @schuurman_game_2021. The latter type is typically a high-fidelity military simulation where established orders and procedures constrain player actions, while human experts decide action outcomes; this would encompass major real-world wargames such as early US Navy Fleet Problems and standard Tactical Exercise Without Troops (TEWT), where the focus is on decisions within procedural military actions as the field expert adjudicator determines the outcomes @nofi_hm_2010 @john_armatys_wargame_2022. Other types of games that fall under this category include semi-rigid adjudicated wargames, where the game is played rigidly and adjudicators have the possibility of overriding the outcomes -- such as tightly scripted training vignettes where SME adjudicators improvise consequences @uk_ministry_of_defense_wargaming_2017. Outside of military wargames, certain corporate wargames also fall into this quadrant; these games share similar emphasis on managerial or operational procedures over a creatively adjudicated and simulated scenario @cohen_role_1961 @hershkovitz_wargame_2019. Generally, wargames in this quadrant tend to lean more towards serious games with common shared emphasis on resolving realistic human-adjudicated scenarios with established procedures. 

== Quadrant III: Creative Player, Analytical Adjudicator
This quadrant covers games with highly creative agents and low‑creativity adjudicators. Common
patterns in this quadrant include highly expressive, low‑procedural‑complexity games with a
procedural adjudicator. This includes the vast majority of board games with a social element and
rigid scoring rules, such as _Quo Vadis_, _Article 27: The UN Security Council Game_, and _The Resistence: Avalon_. @martinenghi_llms_2024

Of the quadrants, this quadrant is one of the most explored in its relation to AI, with extensive
research, especially with wargames such as Diplomacy, most notably Meta’s Cicero @meta_fundamental_ai_research_diplomacy_team_human-level_2022. With rigid adjudication mechanisms and often rigid procedural agent mechanisms, games in this quadrant are mechanically simple to evaluate, which leads to the popularity of this category in the fields of AI competition and diplomacy.

However, the limited evaluation creativity that makes Q3 attractive is also its major flaw. The rigid
adjudication and procedural constraints in much existing research across the quadrants strongly
constrain the effect of the expressive creativity. While games in this quadrant often focus on social interactions of the players, the constrained procedural actions limit complex or realistic games and with low nuance in the outcome.

== Quadrant IV: Creative Player, Creative Adjudicator
This quadrant covers wargames with expressive players and qualitative adjudication. These are often discussion-based exercises that prioritize strategic creativity and narrative plausibility over rigid rule-sets. Prominent examples include modern seminar-style wargames, such as the U.S. Army's TRADOC wargames used to explore future military concepts, and matrix wargames like the "ISIS Crisis" game, which use a structured argumentation format to analyze complex, multi-faceted conflicts. Adjudicated simulations, such as Model United Nations, where participants engage in diplomatic role-playing, also fall into this category. Furthermore, most tabletop role-playing games (TTRPGs) like _Shadowrun_, _Paranoia_, _Call of Cthulhu_, and _Vampire: The Masquerade_ are excellent examples of this quadrant, where player freedom is high and a Game Master provides narrative adjudication.

Games that allow creativity for both players and adjudicators better support classic aims of wargaming: exploring uncertainty, revealing assumptions, and eliciting expert judgment. Real world scenarios are hardly analytical and issues with rigid rule set for players and adjudicators mapping poorly to real world scenarios are obvious and well-explored; treatises on this matter could be dated at least back to the Free Kriegsspiel movement @schuurman_game_2021. However, despite their practical utility for simulating complex environments, few studies have attempted to automate construction or evaluation processes for Q4 settings.

Quadrant IV wargames are particularly well-suited to leverage the improving capabilities of AI. LMs are trending toward longer time‑horizon competence, expanding context windows, and enhanced retrieval across longer contexts @kwa_measuring_2025 @zhang_inftybench_2024. They also exhibit improvements in persuasion and qualified judgment @karger_forecastbench_2025 @schoenegger_large_2025, indicating a trajectory toward more capable agents and adjudicators. Parameter‑efficient fine‑tuning techniques such as adapters and LoRA, combined with in‑context learning (ICL), enable model tailoring for a wargaming context without costly retraining. Lightweight adapters stabilize role-specific behavior (e.g., adjudicator versus player), while prompt‑only ICL provides scenario‑specific styling and constraints. Both approaches reduce operational overhead and improve reproducibility.

However, Q4 wargames also present unique safety concerns. Creative players may develop novel strategies or exploit scenario ambiguities in ways that push beyond the exercise's intended scope. In contrast, creative adjudicators possess significant latitude in interpreting player actions and determining outcomes, which could introduce bias, inconsistency, or inappropriate scenario escalation. These risks are compounded when AI systems assume both roles, due to the combination of reduced human oversight and expressive flexibility.