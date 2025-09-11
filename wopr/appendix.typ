
= Appendix A: On Wargames

== Social Games
While wargames may contain elements of social reasoning or deception, they differ fundamentally from social deduction games in that deception is not the objective but a component of broader strategic reasoning. Wargames require agents to pursue defined goals through planning and decision-making within a structured conflict environment. In contrast, social deduction games are centered around identity discovery and psychological misdirection, making them categorically distinct. This distinction is critical for evaluating LMs in open-ended scenarios, as social deduction games test their ability to navigate dynamic, multi-agent interactions involving trust and deception @chi_amongagents_2024.

Psychological misdirection is prolific in warfare, however, and history is rife with examples of cunning tacticians using it with great success. As the Chinese military strategist Sun Tzu famously wrote, "All warfare is based on deception," exemplified by tactics like the Trojan Horse, the Empty Fort Strategy, and Hannibal’s crossing of the Alps to outmaneuver Roman forces through strategic diversions. For this literature review, social deduction games represent a complementary effort to wargames, as their focus on harnessing psychological misdirection in game scenarios can enhance LMs’ performance in real-life contexts where information may be unreliable, mislabeled, or intentionally deceptive @maggio_game_2024 @lamparth_human_2024. By studying LMs in these settings, researchers can improve their adaptability to ambiguous, deception‑heavy scenarios critical to both wargaming and broader AI applications.



== Creativity vs Analytical
Below are wargaming methods positioned along the analytical ↔ creative orientations (no numeric scale).
Information is borrowed from Figure "Emphasis of selected structured analytical techniques"; Source: IHS Markit/UK Ministry of Defence Wargaming Handbook; Red Teaming Guide (c) 2018 IHS Markit 1695832
1. *Red teaming:* “Independent application of structured, creative and critical thinking techniques to assist the end user make a better informed decision.”
2. *Seminar wargaming:* “Open‑ended, argument‑based discussion between experts, to elicit opinions and judgments,” with casual interactivity and an adversarial component.
3. *Matrix wargaming:* “Players provide several specific arguments for the success of a proposed action… characteristics stimulate free‑thinking creativity… rely on an experienced facilitator.”
4. *Course of action wargaming:* “[A] systematic method for analyzing a plan to visualize the potential ebb and flow of an operation or campaign,” used in military planning.
5. *Free Kriegsspiel:* “A traditional wargame in which adjudication is conducted by an expert adjudicator.”
6. *Rigid Kriegsspiel:* “As with a Free Kriegsspiel, but with adjudication through detailed rules rather than expert judgment.”
7. *Computer‑assisted wargaming:* “Software‑based simulations, usually highly detailed, with assessments of probability derived from data.”

// riedl: we should explicitly list all the papers that were analyzed. we should only cite the things we need to know in the paper. for example we would not cite every single paper we collected. we should cite anything that was main body in the references; if not main and included methods, appendix for sure. if no main and no reference don’t even put in paper. any paper that went into forming the quadrants and informing it is important. for example auction games and business games would be in the list because they are defined as not. table should have name, relevant info, bib info, comments, rank/ratings etc. as needed. we want to help guide people toward reading papers that are relevant for them


// riedl has said that anytime we put stuff in appendix it should be tied back to our paper. so for example all the RAND visualizations or expert infographics etc. are not going to be in appendix unless we specifically tie it back to our paper. we could explain how they relate and differ, how they link and combine, etc. this is subjective but helpful for making tight writing.

=== Human-Agent Interactions (HAI) vs Agent-Agent Interactions (A2A)
Especially in the areas of Diplomacy and highly creative agents, previous research leans toward Human–Agent Interactions (HAI) with emphasis on emulating or integrating with human diplomatic behavior. Often it is a single AI agent interacting with a group of human players, as seen typically in AI research with _Diplomacy_. With diplomacy and collaboration being the focus, the state of the game strongly encourages AI agents to adopt the social language of the rest of the players. Such research is often conducted through random games on online platforms with text‑based communications, and mostly without the human users being strongly informed of the presence of the AI agent on the platform, let alone that they are playing against an AI agent. The focus is often on how AI interacts compared to human diplomatic strategies as the primary benchmark, with the target of human‑like behavior, and evaluated on performance against humans. 


However, agent–agent interaction (A2A) is increasingly important as agentic AI proliferates in
practice, including organizational and enterprise contexts. Conflicts between multiple agentic
systems will differ from HAI dynamics. Much prior work studies cooperative tasks or MoE
coordination; competitive diplomatic A2A remains sparse. Human‑likeness, a common HAI
benchmark, may not translate to A2A settings with different equilibria and strategies.


= Appendix B: Systematic Literature Review Protocols

== Key Definitions
(locked before screening starts)

*Wargame:* A multi-actor, multi-turn interactive scenario whose purpose is to explore conflict decisions and consequences. Examples include seminar games, matrix games, and digital crisis simulations.

*Open-ended:* Games where rules permit *unconstrained natural-language moves*, allowing players to propose novel actions beyond a preset menu. Outcomes are adjudicated by facilitators, subject matter experts, or dynamic rules rather than a fixed payoff matrix. Matrix wargames and Diplomacy (with negotiation phases) exemplify this approach, contrasting with constrained games like Chess or Go or social games like Werewolf or Among Us.

*Quantitative wargame:* Formats that track numeric scores, payoffs, probabilities, or optimization objectives, though they may still contain open-ended dialogue components. Examples include Diplomacy (with victory points) and stochastic combat models.

*Qualitative wargame:* Games relying on narrative adjudication or subject matter expert judgment with minimal or no numeric scoring. Tabletop seminar games with after-action discussions represent this category.

*Language-centric game:* Formats where progress depends fundamentally on *textual or spoken communication* among actors (human or LM). CICERO Diplomacy and conflict negotiations exemplify this approach @meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022, contrasting with action-based games like StarCraft with micromanagement handled by LM-powered bots.

// (Removed: failure‑mode vocabulary, since not a focus of this paper.)

*Player agent:* The actor that proposes moves during play (human or LM). Hereafter referred to simply as the “player.”

*Adjudicator agent:* The entity that determines outcomes (via rules, computation, or expert judgment). Hereafter referred to simply as the “adjudicator.”

== Inclusion / Exclusion Criteria

=== Inclusion Criteria

Studies were included if they met all of the following criteria:
- (I1) Publication year 2022 or later to ensure GPT-era relevance.
- (I2) Includes the use of LMs with at least one billion (1B) parameters (e.g., GPT-2 and later, PaLM, Claude, Llama, OLMO, etc.) to establish a modern capability floor.
- (I3) Games involving *natural-language interaction between one or more agents* (LMs or humans) to ensure focus on language-based gameplay.
- (I4) Games qualifying as *open-ended wargames* per our definitions to capture both analytic and creative styles.
- (I5) LMs serving as agents, adjudicators, or generators to ensure breadth of roles.
- (I6) Provision of any evaluation outcome (quantitative metrics, subject matter expert narratives, or explicit statement of “none”) as needed for synthesis.
- (I7) Full text accessibility with machine translation acceptable to ensure global coverage.
- (I8) Publication in peer-reviewed venues or formal technical reports (RAND, CNA, DoD, MoD) with grey literature flagged but included.

=== Exclusion Criteria

Studies were excluded for the following reasons:
- (E1) Single-move polls or surveys presented as games due to lack of interactivity.
- (E2) Non-language game AI systems (Go, StarCraft, Atari, etc.) as out of scope.
- (E3) Opinion or editorial pieces without research content, including any blog posts which lack technical appendices or methodology.
- (E5) Systems primarily relies on LMs below one billion parameters as falling below the modern capability threshold.

== scoping questions
_"Please search the web for the research paper and read the contents of \"BALROG: Benchmarking Agentic LM and VLM Reasoning On Games\" Please help answer the following questions: \"Does this experimental methodology of the paper feature (1) open-ended games (2) multiplayer games (3) strategy games (4) wargames (5) crisis simulation (6) military simulation (7) moderated policy conflict/debate (8) diplomatic negotiation, or (9) any other form of similar competitive games? Finally (10), would you consider this game to be appropriate for a scoping survey on open-ended language-based wargames?\" After providing your reasoning and answers, please summarize your reasoning into one sentence explaining why overall the answer for (10) is \"YES\" or \"NO\""_

== Data-Extraction Template

#figure(
  placement: top,
  scope: "parent",
  table(
  columns: (auto, auto, auto),
  stroke: none,
  column-gutter: 1em,
  align: left,
  [*Column*], [*Example value*], [*Notes*],
  table.hline(y:1),
  table.vline(x: 1),
  [`title`], [#lorem(8)], [#lorem(16)],
  [`year`], [2024], [#lorem(10)],
  [`venue_type`], [`workshop`], [conf / journal / tech-report],
  [`game_type`], [`matrix`], [seminar / matrix / digital / hybrid],
  [`open_ended`], [`yes`], [y/n per definition],
  [`quantitative`], [`yes`], [y/n],
  [`llm_family`], [GPT-3], [#lorem(5)],
  [`llm_role`], [player], [player / generator / analyst],
  [`eval_metrics`], [SME ratings; win-rate], [free text],
  [`player_orientation`], [creative], [analytical/creative],
  [`adjudicator_orientation`], [analytical], [analytical/creative],
  [`code_release`], [github.com/xyz], ["none" if absent],
  [`grey_lit_flag`], [true], [#lorem(5)],
  [`language`], [English], [after translation if needed],
  table.hline(),
),
  caption: [Data‑extraction schema with example values and notes],
)

== Analytical vs Creative Axes

We treat analytical and creative emphases as two axes of open‑endedness: one for the player
agent (the actor who proposes moves) and one for the adjudicator agent (the entity that
determines outcomes via rules or judgment). Hereafter we refer to them simply as “player” and
“adjudicator.” We avoid numeric scales and use categorical labels: Analytical or Creative.

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

== Placing Representative Wargames on the Two-Axis Plot

#figure(
  placement: top,
  scope: "parent",
  table(
    // columns: (auto, auto,auto,auto),
    // align: left,
    columns: (1fr, auto, auto, 2fr),
    align: (left, center, center, left),
    stroke: none,
    column-gutter: 1em,
    table.hline(),
    [*Wargame Name *], [*Player*], [*Adjudicator*], [*Notes*],
  [Seminar wargame], [Creative], [Creative], [Open proposals; facilitated discussion],
  [Matrix wargame], [Creative], [Creative], [Invented actions; light adjudication],
  [Free Kriegsspiel], [Creative], [Creative], [Free play; expert adjudicator judgment],
  [Red Teaming], [Creative], [Creative], [Extreme novelty; structured critique],
  [Diplomacy], [Creative], [Analytical], [Open negotiation; algorithmic resolution],
  [Course‑of‑Action wargame], [Analytical], [Analytical], [Scripted analysis; doctrinal checks],
  [Warhammer 40k], [Analytical], [Analytical], [Varied tactics; heavy dice/rules],
  [Computer simulation], [Analytical], [Analytical], [Menu actions; software computation],
  [Rigid Kriegsspiel], [Analytical], [Analytical], [Rulebook tactics; deterministic tables],
  [Chess], [Analytical], [Analytical], [Codified moves; formal rules],
  [Tic‑Tac‑Toe], [Analytical], [Analytical], [Strict moves; formal rules],
  [Conway’s Game of Life], [Analytical], [Analytical], [Deterministic cellular automaton],
  [Linear graphic novel games], [Analytical], [Analytical], [Narrative rails; limited agency],
    table.hline()
  ),
    caption: [Representative wargames plotted on dual-axis framework],
)

=== Framework Interpretation

The x‑axis represents the player’s orientation (Analytical vs Creative), while the y‑axis
represents the adjudicator’s orientation (Analytical vs Creative).

When plotted as a scatter-plot, four intuitive regions emerge:

*Top-right (7,7) – "Pure brainstorming":* Seminar games occupy this space, proving useful for ideation but weak for reproducible analysis.

*Bottom-left (1-2,1-2) – "Pure calculation":* Rigid rules or computer simulations excel at repeatability but offer poor novel insight generation.

*Top-left – "Creative players, rigid resolution":* Negotiation games such as _Diplomacy_ exemplify this quadrant, featuring creative strategy development with mechanical outcome determination.

*Bottom-right – "Constrained players, creative adjudicator":* This configuration is not common but possible, such as tightly scripted training vignettes where subject matter expert adjudicators improvise consequences.


=== Economics and Finance

*Resource Economy*

One of the most fundamental concepts in why economics is studied comes from the fact of resource scarcity. The game itself provides limited access to scarce resources such as iron, oil, uranium as well as luxury goods such as gold, spices, and gems. Due to the fact that there are multiple players, this inherently causes competition, another economic concept which is the basis for economical decision making in the game.

*Markets and Trade*

This section dives into the idea of comparative advantage and market dynamics. Cities can establish trade routes domestically and internationally in which players can negotiate resource-for-gold trades and technology exchanges. The pure concept of trading incorporates the idea of comparative advantage. Each player has their own set of resources and goods, but the way in which they choose to trade comes from the production from the cities they own in civilization. Comparative advantage is a fundamental concept in economics which governs how countries, or in this case civilizations, will trade with one another. In addition, the concept of specialization can be seen taking place in this game. Each city can either generate food, produce hammers, or foster commerce with gold. Each player will ultimately have each city specializing in one field so as to create microeconomic dynamics with other cities and inherently lead to trade with other cities. These fundamental economic concepts need to be handled appropriately by a player so as to maximize personal economic benefit, which can in turn lead to better gameplay and a higher likelihood of winning.

*Currency Taxation*

In this game, budget constraints and bankruptcy risks are added as another obstacle. Deficit spending in the game has penalties such as unit disbanding and cutting science and culture. These rules simulate the business world in the sense that with greater power comes greater responsibility. The larger the empire the higher it will cost to upkeep all factors involved, and in situations where there isn’t enough money to support the empire, pieces of the empire will be taken away. In addition to these business modelings, inflation is another factor in the game which attests to market friction, in which building a large empire also makes it harder to continue to grow the empire. It forces strategic financial planning so that an empire cannot just expand way too quickly without accounting for the empire inefficiencies or lack of balance.

*Infrastructure*

One of the biggest economic factors involved in this gameplay is opportunity cost. Each turn a player has they have a decision to make. Each user can make capital investments with delayed returns. A big opportunity cost question always comes with the building or adding of infrastructure versus aiding in military personnel. In this example, you have the choice of creating a new city and adding to your wealth comes with the opportunity cost of military readiness. Similarly, each decision made has some tradeoff or opportunity cost which can lead to future positives or future negatives. A player must weigh their options accordingly and make the decision which they think will minimize their opportunity cost, a very subjective decision.

Settlers of Catan exemplifies a macro-scale simulation of cooperation, conflict, and uncertainty, offering valuable parallels to both wargaming and global economic systems. In Catan, each player acts as an economic agent—whether a company, policymaker, or trader—competing to expand their territory and win, but also needing to collaborate through trade and negotiation. This interplay mirrors real-world dynamics, where nations and market participants must adapt, compete, and form alliances within an ever-changing economic landscape.

A defining feature of Catan is its unpredictable environment, shaped by dice rolls and development card draws, which introduces uncertainty and requires constant risk assessment. Players must dynamically adjust their strategies, learn from experience, and make decisions under partial observability, closely reflecting the complexities of modern economic and policy-making processes.
Negotiation is central to Catan, as players engage in multi-party interactions involving offers, counteroffers, acceptance, and refusal. These exchanges model real-world group decision-making and strategic communication, requiring careful analysis of opponents’ positions and negotiation tactics such as bluffing and persuasion. This makes Catan an effective testbed for AI agents, fostering their development of advanced dialogue, strategy adaptation, and even deceptive bargaining behavior.

Recent research demonstrates that AI agents trained in Catan can emulate distinct roles—trader, strategist, negotiator—each influencing and responding to the decisions of others. Findings also indicate that as agent skill increases, so does the impact of luck: highly skilled agents more effectively capitalize on favorable scenarios, further emphasizing the game’s intrinsic uncertainty.

Evaluating reinforcement learning agents in environments like Catan goes beyond win rates; it includes diversity of behavior, skill expression, and the uncovering of rare or emergent strategies. Such diversity is vital for playtesting, balancing, and informing both AI research and game design. By shifting the focus from victory to exploration and policy testing, Catan enables a deeper understanding of agent behavior, strategic planning, and the identification of hidden exploits, offering actionable insights for both policymaking and strategic game development.
