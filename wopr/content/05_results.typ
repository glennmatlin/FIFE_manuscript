#import "../config.typ":num_papers
= Ontology of Wargames
The spectrum between creative wargames and analytical wargames 
((Choose one:
- is incomplete because it does not consider the fact that the adjudicator can also have varying degrees of constrained or creative decision-making
- conflates the player and the adjudicator.))
As we argue below, considering the analytical versus creative nature of the players separate from that of the adjudicator helps us understand the space of games with respect to AI approaches.

((Justifying the need to consider players and adjudicators independently. It's actually a bit challenging, because increased linguistic flexibility on the player side seems to require increased linguistic flexibility, so I need to find counter examples.))
While prior categorization schemes focus on the flexibility afforded the player, it elides the unique challenges inherent when the player's moves are language-based. 
Unlike traditional simulations with structured inputs and discrete, well-defined action efects, language-based systems operate in vast, open-ended semantic spaces. 
While it would appear that increased flexibility afforded to players, in the form of language descriptions of moves, must necessarily be met with increased flexibility afforded to the ajudicator in the form of language descriptions of outcomes, it need not be the case.
The presence of natural language in wargames is not equal across all games. 
Consider the game of _Diplomacy_ in which players can communicate naturally to make trade deals, but the final form of the trade deal must be highly structured in terms of resource exchanges that are simple to ajudicate.
Consider also a game such as _Free Kriegspiel_ ((NOTE: or another example)), in which the players' actions are limited to movements of army pieces on a board, but the ajudicator has a high degree of autonomy to dictate---and explain---the outcomes of each move.

Consequently, we arrange the space of wargames according to a two-dimensional space, as shown in @fig:creativity-quadrants.
The horizontal dimension characterizes the player role, creating a spectrum from analytical to creative. The lefthand side characterizes player moves as _player analytical_, meaning the player is presented with finite, pre-defined action options. The righthand side of the space characterizes player moves as _player creative_, implying that the player has increasing agency to create new types of moves that could not have been envisioned in advance. The horizontal dimension is identical to the analytical versus creative dimension described in the ((Background section)). 

To this, we add a vertical dimension, which characterizes the adjudicator's role. To be on the top half of the space,  ajudicator's responses to the player are characterized as _ajudicator analytical_, meaning the ajudicator's responses to the player are limited to prescribed responses. To be on the bottom half of the space, the adjudicator's responses to the player are characterized as _ajudicator creative_, meaning the ajudicator has the agency to create novel responses. 
Inherent to this is the ability for the players to negotiate the outcome with the ajudicator. This negotiation is not a player move per-se but happens ((NOTE: could use the term extra-diagetically)) after the move is made as a means to dynamically alter the mapping from the player's move to the response. ((NOTE: Writing this, I wonder if it's the mapping that is creative as opposed to the actual surface form of the ajudicator's output response.))


((NOTE: I don't really understand what is going on in this paragraph.))
Before presenting our findings, it is crucial to frame the unique evaluation challenges inherent in language-centric wargames. Unlike traditional simulations with structured inputs and discrete, well-defined output spaces (e.g., a move on a board), language-based systems operate in vast, open-ended semantic spaces. The input space comprises natural language prompts and player interactions, while the output space consists of generated text representing arguments, justifications, and actions. This semantic gap between a concise input and a nuanced, high-dimensional output makes direct, one-to-one comparisons difficult and introduces significant challenges for evaluation and reproducibility. Consequently, our analysis must consider not only the outcomes of actions but also the quality, coherence, and plausibility of the language used to justify them.

We summarize descriptive statistics and qualitative themes from the surveyed works. Counts
cover venues, years, and domains; design patterns group LM roles (player, adjudicator,
scenario, analyst) and game formats (seminar, matrix, digital multi‑turn). We highlight
typical prompting strategies, facilitation approaches, and reported outcomes. @fig:yearly-counts shows
yearly paper counts by quadrant; @fig:screening-flow summarizes the screening flow. Tables provide quick
reference; detailed extraction lives in the appendix.

((RIEDL: I would like to see a lot of examples of games in the quadrant sections. I'm skipping reading Q1-Q4 for now.))

// (( TODO: We need to add the (1) Time analysis: annual volume and venue mix, (2) Paper stats: LM families, roles, formats, artifacts released, (3) Figures: open‑endedness quadrants and representative placements. ))

// == Quadrants: Analytical vs Creative

// As shown in @fig:creativity-quadrants, we can classify wargames based on the creativity of the player and the adjudicator. Both the vertical and horizontal axes are used to measure the Analytical vs Creative aspects of each game.
// The x‑axis represents the player’s orientation, while the y‑axis
// represents the adjudicator’s orientation.

#figure(
  image("figures/taxonomy.png"),
  caption: [Open‑endedness quadrants (illustrative placement of formats).],
) <fig:creativity-quadrants>


== Quadrant I: Analytical Player, Analytical Adjudicator
This quadrant covers rigid, rule‑based systems for both the players and the adjudicators (often
predetermined scoring). Of the quadrants, this quadrant is among the most extensively explored, as it captures traditional “quantitative” wargames. Rigid rules or computer simulations excel at repeatability but can offer poor novel insight generation due to the necessary constraints of the simulation rules or game engine.
Notable examples include the No‑Press variant of Diplomacy, the original rigid Kriegsspiel, and nearly the entirety
of strategy board games both traditional (e.g. chess, checkers, and Go) or modern (e.g. Stratego, Warhammer 40k, and Starcraft) @vinyals_grandmaster_2019 @schuurman_game_2021 @bakhtin_mastering_2022 @bakhtin_mastering_2022 @anthony_learning_2022.

These games often benefit less from recent developments in LMs because of its rigid nature, with RL approaches being more common. @anthony_learning_2022 @perolat_mastering_2022 @light_strategist_2024 @gao_land-based_2024

== Quadrant II: Analytical Player, Creative Adjudicator
This quadrant covers games in which players are often relatively limited in their action space, while a human SME adjudicator determines the outcomes based on their judgment. This configuration is not common for wargames, but it is possible. Games that would fall into this quadrant include variants of wargames such as Meckel's early version of Free Kriegsspiel and the class of procedural-based human-adjudicated war games @schuurman_game_2021 . The latter type is typically a high-fidelity military simulation where established orders and procedures constrain player actions, while human experts decide action outcomes; this would encompass major real-world wargames such as early US Navy Fleet Problems and standard Tactical Exercise Without Troops (TEWT), where the focus is on decisions within procedural military actions as the field expert adjudicator determines the outcomes. @nofi_hm_2010 @john_armatys_wargame_2022 Other types of games that fall under this category include semi-rigid adjudicated wargames, where the game is played rigidly and adjudicators have the possibility of overriding the outcomes -- such as tightly scripted training vignettes where SME adjudicators improvise consequences. @uk_ministry_of_defense_wargaming_2017

== Quadrant III: Creative Player, Analytical Adjudicator
This quadrant covers games with highly creative agents and low‑creativity adjudicators. Common
patterns in this quadrant include highly expressive, low‑procedural‑complexity games with a
procedural adjudicator. This includes the vast majority of board games with a social element and
rigid scoring rules, such as Diplomacy and Settlers of Catan. @martinenghi_llms_2024

Of the quadrants, this quadrant is one of the most explored in its relation to AI, with extensive
research, especially with wargames such as Diplomacy, most notably Meta’s Cicero @meta_fundamental_ai_research_diplomacy_team_human-level_2022. With rigid adjudication mechanisms and often rigid procedural agent mechanisms, games in this quadrant are mechanically simple to run and evaluate, which leads to the popularity of this category.

*Issues with Q3.* The limited creativity that makes Q3 attractive is also its major flaw. The rigid
adjudication and procedural constraints in much existing research across the quadrants strongly
constrain the effect of the expressive creativity that would be the focus.

== Quadrant IV: Creative Player, Creative Adjudicator
This quadrant covers wargames with expressive players and qualitative adjudication. Examples
include modern seminar and matrix formats and adjudicated simulations (e.g., Model United
Nations). These exercises are common in defense, diplomacy, and organizational decision‑making.

== Why Q4 matters for analysis

((RIEDL: I'm not sure why this has to be a separate section from 4.4))

Games that allow creativity for both players and adjudicators better support classic aims of
wargaming: exploring uncertainty, revealing assumptions, and eliciting expert judgment. Real world scenarios are hardly analytical and issues with rigid rule set for players and adjudicators mapping poorly to real world scenarios are obvious and well-explored; treatises on this matter could be dated at least back to the Free Kriegsspiel movement in the 1870s. @schuurman_game_2021 However, few studies automate construction or evaluation for Q4 settings.

*Q4 takes advantage of improving AI capabilities*. 
Starting off as just a bank of ideas and substance for this section.

Flow of section: Wargames which have an economic, financial, or business application/involvement. Settlers of Catan is a classic example, Monopoly, Power Grid, and Imperial are all other games I want to look into. Once we talk about the actual games, I want to discuss the actual applications of financial markets, business markets, and economic markets and how some problems in these spaces can be reduced to an idea of a wargame based on the definition we use above. Finally, we will conclude this discussion with an overall analysis of why we think the application of AI in the field of wargames can be beneficial to the sectors of business, economics, and finance.

LMs are trending toward longer time‑horizon
competence [METR Paper], expanding context windows [CITE], and retrieval across long contexts
[CITE]. They also show gains in persuasion, creative writing, and qualified judgment [CITE],
suggesting a path toward more capable agents and adjudicators. Therefore, Q4 games are well‑
positioned to benefit from current trajectories.

Parameter‑efficient fine‑tuning (e.g., adapters, LoRA) and in‑context learning (ICL) can tailor
models to a wargaming setting without costly retraining. Lightweight adapters stabilize role
behavior (e.g., adjudicator vs player), while prompt‑only ICL provides scenario‑specific style
and constraints. Both approaches reduce operational burden and improve reproducibility.

*Q4 faces unique safety and security concerns*. Allowing creativity for both agents and
adjudicators increases the chance of exceeding intended constraints; documentation, guardrails,
and facilitation practices are essential.

#figure(
  placement: top,
  scope: "parent",
  table(
    columns: (auto, auto, auto, auto, auto),
    stroke: none,
    column-gutter: 1em,
    align: left,
    table.hline(),
    [*Year*], [*Q1*], [*Q2*], [*Q3*], [*Q4*],
    [2019], [3], [—], [—], [—],
    [2020], [3], [1], [—], [—],
    [2021], [2], [—], [—], [—],
    [2022], [2], [—], [2], [—],
    [2023], [6], [1], [2], [2],
    [2024], [17], [2], [8], [8],
    [2025], [7], [—], [17], [3],
    table.hline()
  ),
  caption: [Yearly paper counts by quadrant (2019–present).],
) <fig:yearly-counts>

#figure(
  placement: top,
  scope: "parent",
  table(
    columns: (auto, auto, auto),
    stroke: none,
    column-gutter: 1em,
    align: left,
    table.hline(),
    [*Stage*], [*Count*], [*Notes*],
    [Identified], [N], [All sources before deduplication],
    [Deduplicated], [N], [Merged by DOI/title],
    [Title/Abstract Screen], [N], [Inclusion/exclusion applied],
    [Full‑Text Review], [N], [Eligibility confirmed],
    [Included], [#num_papers], [Final set for synthesis],
    table.hline()
  ),
  caption: [Screening flow with counts per stage and inclusion criteria.],
) <fig:screening-flow>

== Analysis of Q4 (qualitative)

((RIEDL: I'm not sure why this has to be a separate section from 4.4. If things get complex to read, then 4.5 and 4.6 could be 4.4.1 and 4.4.2.))

here, we talk about the papers in q4 only and characterize them

// riedl: we should explicitly have a section on research problems and what can be learned by working on those.
// real time multi agent planning -- mech interpretability -- avoiding bias and echo chambers

// riedl: have a statement at some point where you could focus on anyone of these individual problems, but these games give opportunities to do many things at once and measure interactions. Q4 can solve the problem by avoiding the silos, explaining how the systems interact etc.