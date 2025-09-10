#import "@preview/tracl:0.6.1": *


#show: doc => acl(doc,
  anonymous: true,
  title: [Shall We Wordplay a Game?\
  Language Model Agents as Players and Adjudicators\
  in Highly Creative and Open-Ended Wargames],
  authors: (
    (
      name: "Anonymous",
      affiliation: [Anonymized for review],
      email: "anonymous@invalid",
    ),
  ),
)

#let num_papers = "89"

#abstract[
Language models (LMs) are increasingly being deployed for use in defense and security settings to provide humans with insights for real-world decision-making. One prominent example is the use of LMs to play, adjudicate, and analyze strategic wargames. LMs are particularly useful for contexts with open-ended dynamic problems where we lack a clear optimal "yes"/"no" answer and gameplay is non-linear.
// GLENN: need a hook here that pulls people in using a safety argument of some kind... make it critical and important! danger danger!! get people interested
This new generation of _Artificial Intelligence (AI) wargames_ relies more on *creative* problem-solving and reasoning over *analytical* rigor and precision. However, there have been significant hurdles for AI researchers when publishing in this field due to the domain-specific and knowledge-intensive requirements of professional wargaming. We present a scoping literature review of #num_papers recent works on AI wargames and present a novel ontology for researchers to engage with AI wargaming. We provide a discussion for researchers on how to use our ontology to appropriately categorize their own game environment and discover new literature ... (filler)
// Glenn: this part really needs work
This paper provides a consolidated look at this emerging area ... (etc) ... and provides clear direction for other researchers to pursue. Our goal is to encourage responsible experimentation with LMs in wargaming and adjacent, language‑centric simulations. ]

`"A strange game. The only winning move is not to play. How about a nice game of chess?"`\ _WOPR, Wargames, 1983_

= Introduction

Opportunities for using Artificial Intelligence (AI) to aid real-world decision-making have expanded due to recent research and engineering progress with Language Models (LMs). LM-powered AI systems are increasingly treated as a general‑purpose technology, providing a natural‑language interface for help with analysis and planning difficult tasks.
As a result, there is a growing interest by Subject Matter Experts (SMEs) in the military community regarding how they can leverage LMs for highly creative and open‑ended wargames that emphasize qualitative and language‑centric play.
SMEs are now actively exploring how they can use LMs to act as players, adjudicators, scenario generators, and analysis aids in open-ended wargames.\
Traditional computational approaches to wargames often struggle to capture narrative depth or human factor, while purely human exercises are resource‑intensive and difficult to analyze at scale. LMs open new possibilities but also pose a serious safety risk during deployment due to the greater degree of freedom afforded by the open-ended nature of these games. Early experiments that let off‑the‑shelf
LMs “play” scripted moves showed brittle reasoning, hallucination, and rule non‑adherence
@lamparth_human_2024.
// @meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022 @wu_enhance_2024 @xu_exploring_2023 @xu_language_2023]

This paper offers a scoping literature review  and discussion-orientated desiderata for open-ended and language-based AI wargames. We analyze patterns across recent studies and use these insights to create a new ontology to help AI researchers understand the key features of open-ended wargames to aid them in their own research.\

Our focus is on language‑based and open‑ended wargames where a LM is acting in the role of either a _player_ or an _adjudicator_. The aim of our paper is (1) to catalog recent approaches and design patterns; (2) discuss the trade-off space of analysis and creativity; (3) propose desiderata and new research directions and (4) curate references and resources for practitioners and researchers.

= Background
// Riedl says we might neeed background and definitions as separate, and not in related works. signposting is ok. one option to keep this in related work is to present and cite all the terminology used by others and why we use and extend it. we also would present things here we disagree with etc but we are likely in the former category so we just need to communicate what we do. communicate these sections in terms of related works rather than WE DEFINE. we would want to place our diffs at the end. we should use this section to lay down what others say and really adopt and lay it on them. this is the section for all the others
== Wargames
// """
// 3.4 Wargames
// Wargaming is an old (von Reisswitz, 1824) technique designed to simulate battles and other complex
// situations. Wargaming has recently been used for forecasting AI progress (Kokotajlo et al., 2024),
// and recent work has explored automating wargames with LLMs (Hogan & Brennen, 2024)
// """
// GLENN: "Conflict and war has been a focal topic of games for thousands of years.

Wargames are defined by the commmunity as a “a multi‑faceted depiction of conflict with one or more parties in which the participants’ decisions influence the future outcomes of events” @perla_what_1985
 // @noauthor_wargaming_2017; @caffrey_toward_nodate]
 For this paper, we adopt a formal academic  definition of the term _wargame_ as:
+ Ongoing conflict between actors with opposing interests or needs;
+ A synthetic environment that enables agent choice and feedback;
+ Agents make decisions and experience consequences via adjudication or rules;
+ Strategic reasoning uses information about other agents and the environment @coulthart_whats_2017 @james_markley_strategic_2015 @perla_what_1985.
For our purposes, we adopt the common definitions of “Artificial Intelligence” (AI) as understood by SMEs to be “the use of computers to carry out tasks that previously required human intelligence”. 
// [@national_security_commission_on_artificial_intelligence_final_2021 @sayler_artificial_2019]

== Serious Games
“Serious games” are games designed for purposes beyond entertainment, such as training, education, analysis, or policy exploration. Wargames often intersect with considered a subset of serious games when they are used to explore strategic choices, elicit expert judgment, or stress‑test plans. Unlike recreational games, the primary objective is to generate insight rather than to optimize win conditions, and design choices (facilitation, documentation, evaluation) are selected to support learning and analysis.

== Creativity vs Analytical
// TODO FOR RIEDL: Any comments here about computational creativity, lab citations here as relevant
Computational creativity has been a topic of study for many years ... 
// CITE: Creativity in LLM-based Multi-Agent Systems: A Survey
We observe how current wargame approaches often fall into two broad families: (1) open-ended non-linear games that heavily rely on creative problem solving or,(2) heavily structured and rule‑based games where analytical skills are more important.
Open-ended games provide a far greater degree of creative freedom for players to identify the action needed to advance towards their goals and finish the game. Creativity offers players freedom to identify many unique paths to a victory conditon. Open-ended and creative wargames rely heavily on SMEs for
scenario design, player actions, and adjudication [@coulthart_whats_2017; @perla_what_1985]. In the military domain, these games formats are commonly referred to as matrix wargames or seminar wargames. This creative wargame style favors players with superior argumentation and decision‑making to navigate the complex open‑ended game state.

By contrast however, contemporary research into AI wargames have targeted analytical games where the world state is defined by strict rules, a discrete gamespace where actions often have calculated outcomes. Commonly known examples include Chess, Go, and Starcraft 2.
// TODO: reinforcement learning citations here
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

= Related Works

== Artificial Intelligence in Wargaming 
Foundational defense wargaming literature establishes core definitions, taxonomies of formats
(seminar, matrix, kriegsspiel, computer‑assisted), and adjudication philosophies (rigid rules vs.
free adjudication) [@james_markley_strategic_2015; @noauthor_wargaming_2017]. These works emphasize
intent, uncertainty management, and the central role of facilitation and expert judgment in
producing insight rather than scorekeeping. Practitioner handbooks and RAND‑style studies
standardize scenario design, injects, decision capture, and after‑action analysis. Together, this
tradition motivates our focus on language‑based, argument‑centric play and clarifies where
automation must respect human roles.

Early AI for wargaming largely targeted quantitative or tightly scoped simulations: search and
optimization for move planning, stochastic combat models, and agent‑based systems with
explicit state. Such approaches perform well in rigid games but offer limited support for
open‑ended narrative argumentation and multi‑party persuasion typical of seminar and matrix
formats.

== Literature Reviews on LMs in Games
// CITE: LLM as a Mastermind: A Survey of Strategic Reasoning with Large Language Models
// A Survey on Large Language Model-Based Game Agents
// Large Language Models and Games: A Survey and Roadmap
// LLM as a Mastermind: A Survey of Strategic Reasoning with Large Language Models
// Playing games with Large language models: Randomness and strategy
// SPIN-Bench: How well do LLMs plan strategically and reason socially?
// A Survey on Game Playing Agents and Large Models: Methods, Applications, and Challenges
// A Survey on Large Language Model-Based Social Agents in Game-Theoretic Scenarios
// Can Large Language Models Serve as Rational Players in Game Theory? A Systematic Analysis

Surveys of LMs in games and simulation describe agents that negotiate, plan, or role‑play in
constrained environments [@ma_computational_2024; @zhang_llm_2024]; work on Diplomacy combines
language models with planning and tool use [@meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022; @lamparth_human_2024]; and multi‑agent LM frameworks
explore coordination, debate, and self‑critique [@zhang_llm_2024; @yao_spin-bench_2025]. Parallel reviews
in defense communities catalog AI for training and analysis but emphasize quantitative or kinetic
models [@geist_understanding_nodate].

Across these threads, reporting is heterogeneous and evaluation often short‑horizon or
subjective; prompts and facilitation procedures are rarely standardized; and open‑ended,
qualitative wargames remain under‑served. Our discussion consolidates approaches for
language‑based formats and highlights practical choices that affect realism and utility.

= Methodology
We conducted a structured literature review following Kitchenham’s SLR phases. We searched Google Scholar, arXiv, and Semantic Scholar using three Boolean queries, deduplicated by DOI, and screened title/abstract before full‑text review. Our final set of #num_papers papers was extracted into a CSV for quantitative counts and qualitative theme coding.

````sql
("wargame" OR "seminar wargame" OR "matrix wargame") AND ("large language model" OR "LLM" OR "GPT")
````
Academic Sources: Scopus, Web of Science, IEEE Xplore, ACM DL, arXiv, SSRN;
Niche: Defense Technical Information Center, The RAND Corporation, Simulations & Gaming Journals, Military wargaming centers, DoD, UK MOD

... and see appendix B


= Results
We summarize descriptive statistics and qualitative themes from the surveyed works. Counts
cover venues, years, and domains; design patterns group LM roles (player, adjudicator,
scenario, analyst) and game formats (seminar, matrix, digital multi‑turn). We highlight
typical prompting strategies, facilitation approaches, and reported outcomes. Figure 2  shows
yearly paper counts by quadrant; Figure 3 summarizes the screening flow. Tables provide quick
reference; detailed extraction lives in the appendix.

Time analysis: annual volume and venue mix.
Paper stats: LM families, roles, formats, artifacts released.
Figures: open‑endedness quadrants and representative placements.



== Quadrants: Analytical vs Creative

#image("creativity_quadrants.png")
Figure: Open‑endedness quadrants (illustrative placement of formats).

=== Q1: Analytical Player, Creative Adjudicator
This quadrant covers games in which players are often relatively limited in their action space,
while a flexible, often human, adjudicator computes the outcomes. A less common quadrant,
well‑known games that would fall into this quadrant include classic Free Kriegsspiel, where the
focus is on limited procedural military actions while the outcomes are adjudicated by a human
adjudicator. Many other battlefield‑scale wargames would fall under this category.

=== Q2: Analytical Player, Analytical Adjudicator
This quadrant covers rigid, rule‑based systems for both the players and the adjudicators (often
predetermined scoring). Of the quadrants, this quadrant, alongside Q4, is among the most
extensively explored, as it captures traditional “quantitative” wargames. Notable examples
include the No‑Press variant of Diplomacy, the original rigid Kriegsspiel, and nearly the entirety
of traditional strategy board games such as chess, checkers, and Go.

=== Q3: Creative Player, Analytical Adjudicator
This quadrant covers games with highly creative agents and low‑creativity adjudicators. Common
patterns in this quadrant include highly expressive, low‑procedural‑complexity games with a
procedural adjudicator. This includes the vast majority of board games with a social element and
rigid scoring rules, such as Diplomacy and Settlers of Catan.

Of the quadrants, this quadrant is one of the most explored in its relation to AI, with extensive
research, especially with wargames such as Diplomacy, most notably Meta’s Cicero [@meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022]. With rigid
adjudication mechanisms and often rigid procedural agent mechanisms, games in this quadrant
are mechanically simple to run and evaluate, which leads to the popularity of this category.

*Issues with Q3.* The limited creativity that makes Q3 attractive is also its major flaw. The rigid
adjudication and procedural constraints in much existing research across the quadrants strongly
constrain the effect of the expressive creativity that would be the focus.

=== Q4: Creative Player, Creative Adjudicator
This quadrant covers wargames with expressive players and qualitative adjudication. Examples
include modern seminar and matrix formats and adjudicated simulations (e.g., Model United
Nations). These exercises are common in defense, diplomacy, and organizational decision‑making.

== Why Q4 matters for analysis
Games that allow creativity for both players and adjudicators better support classic aims of
wargaming: exploring uncertainty, revealing assumptions, and eliciting expert judgment. Few
studies automate construction or evaluation for Q4 settings.


*Q4 is most similar to reality*
Reality is highly creative and higher creativity provides more value as a serious game. 

 - Wargame
  - battlefield
  - non-battlefield
 - Business Wargame
- Diplomatic Simulation
- Generalized Social Simulation

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
    [2019], [—], [—], [—], [—],
    [2020], [—], [—], [—], [—],
    [2021], [—], [—], [—], [—],
    [2022], [—], [—], [—], [—],
    [2023], [—], [—], [—], [—],
    [2024], [—], [—], [—], [—],
    [2025], [—], [—], [—], [—],
    table.hline()
  ),
  caption: [Yearly paper counts by quadrant (2019–present).],
)

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
)

== Analysis of Q4 (qualitative)
here, we talk about the papers in q4 only and characterize them

// riedl: we should explicitly have a section on research problems and what can be larned by working on those.
// real time multi agent planning -- mech interpability -- avoiding bias and echochambers

// riedl: have a statement at some point where you could focus on anyone of these individual problems, but these games give opportunities to do many things at once and measure interactions. Q4 can solve the problem by avoiding the silos, explaining how the systems interact etc.

== Discussion
We synthesize design choices that most influence realism and analytical value: how turns are
structured, what evidence or justification is required, the level of human facilitation, and how
conflicts are adjudicated. We outline practical next steps for language‑based formats and note
open directions for evaluation and sharing of artifacts.

=== military uses (glenn/stu)


=== International Diplomacy Games
Diplomatic wargaming centers on language, signaling, and credibility rather than material force. Open‑ended, argument‑driven formats (seminar, matrix) capture how positions evolve through persuasion, norm invocation, and threat–promise exchanges across multiple stakeholders (states, IOs, NGOs, industry). When LMs participate, their value is in maintaining coherent narratives over long horizons, proposing plausible options under contested facts, and helping surface implicit assumptions in briefs and communiqués.

Compared with battlefield scenarios, diplomatic games emphasize incomplete and asymmetric information, face‑saving, and issue linkage (security tied to trade, technology, or climate). Facilitation and adjudication must account for audience costs, domestic politics, and path dependence across rounds. LMs can assist by drafting position papers, back‑channel messages, or press releases in different registers, while humans retain control of red lines, escalation ladders, and legitimacy constraints.

Practical design choices that matter include: clear turn structure (front‑channel vs. back‑channel), explicit rules for information sharing and leaks, and rubrics that reward consistency and coalition‑building rather than only “wins.” Artifact capture (transcripts, proposals, dissent notes) is crucial for after‑action learning. Reproducibility improves when scenarios, prompts, and adjudication criteria are shared alongside model/version information.

=== business/organization wargames (glenn and rohan)
Business and organizational wargames use competitive or cooperative scenarios to stress‑test strategy under uncertainty (market entry, pricing, regulatory change, supply‑chain disruption, M&A). Open‑ended play surfaces narrative risks (misaligned incentives, vendor lock‑in, reputation shocks) that spreadsheets can miss. LMs can play roles as competitor teams, regulators, customers, or internal functions (legal, comms), generating options and counter‑moves in natural language.

Effective formats combine structured turns (brief → move → challenge → adjudication) with qualitative evidence requirements: claims must cite assumptions, external signals, or benchmarks. Adjudication blends simple quantitative checks (unit economics, capacity) with narrative plausibility. LMs can draft memos, scenario briefs, or stakeholder analyses conditioned on constraints (budget, brand voice, compliance) and can help enumerate second‑order effects, but human facilitators keep realism and ethics in scope.

For organizational adoption, reproducibility and governance are key. Keep minimal artifacts (scenario text, prompts, seeds, facilitation script), log model/version and any tool use (RAG, calculators), and separate confidential data from public scaffolds. Typical evaluation rubrics emphasize clarity of reasoning, sensitivity analysis (what if X changes), and decision traceability. Sharing sanitized transcripts and prompt scaffolds accelerates reuse across teams while protecting proprietary details.

=== Economic, Financial, and Business Implications of Wargaming

We aim to show how applying ai to wargames can be utilized to model and study the economic and financial fields respectively. Wargames such as Civilization IV offer synthetic environments which can inherently mirror the fundamental structures of economics and finance. Players must allocate resources, manage cities, and balance immediate needs against long-term growth. Each decision made in this wargame can be paralleled with real-world economic choices involving opportunity cost, inflation, and deficit spending in which all these factors constrain the available choices. While abstract models can provide a way of testing economic theories, wargames provide a dynamic environment which can inherently simulate emergent market behaviors through human players and through AI agents. The field of applied economics can be heavily explored in this realm, because studying AI agents in these environments allow researchers to test economic theories under controlled yet very powerful conditions. This pure concept can make wargames, more specifically the application of AI agents to wargames, very powerful for laboratories to research how different market behaviors and economic choices are made under certain economic conditions. 

Finance is inherently adversarial and strategic, in which firms are competing for market share, governments are controlling monetary policy, and traders respond to limited information. Wargames provide dynamics for replicating this competition in the context of embedding markets, offering trade routes, and working in investment decisions. The sheer fact that we define wargames to have each action made in gameplay to have future consequences allows us to examine the consequences of such financial decisions made by an AI agent in a dynamic setting. In Civilization IV, for instance, controlling resource strategic resource functions like a commodity market while trade agreements would represent bilateral contracts. When AI agents are deployed in this type of setting, financial and economics researchers can see how such agents employ strategies in the context of collusion, innovation, and predatory expansion in dynamic market conditions. This creates an environment in which researchers can actually test algorithmic pricing, market shocks, and competitive equilibria in a dynamic setting that isn’t necessarily the real-world, but a very well-represented parallel.

Another game to consider might be Settlers of Catan

 - a Macroscale Wargaming Model for AI Strategy and Negotiation

Settlers of Catan exemplifies a macro-scale simulation of cooperation, conflict, and uncertainty, offering valuable parallels to both wargaming and global economic systems. In Catan, each player acts as an economic agent—whether a company, policymaker, or trader—competing to expand their territory and win, but also needing to collaborate through trade and negotiation. This interplay mirrors real-world dynamics, where nations and market participants must adapt, compete, and form alliances within an ever-changing economic landscape.

A defining feature of Catan is its unpredictable environment, shaped by dice rolls and development card draws, which introduces uncertainty and requires constant risk assessment. Players must dynamically adjust their strategies, learn from experience, and make decisions under partial observability, closely reflecting the complexities of modern economic and policy-making processes.

Negotiation is central to Catan, as players engage in multi-party interactions involving offers, counteroffers, acceptance, and refusal. These exchanges model real-world group decision-making and strategic communication, requiring careful analysis of opponents’ positions and negotiation tactics such as bluffing and persuasion. This makes Catan an effective testbed for AI agents, fostering their development of advanced dialogue, strategy adaptation, and even deceptive bargaining behavior.

Recent research demonstrates that AI agents trained in Catan can emulate distinct roles—trader, strategist, negotiator—each influencing and responding to the decisions of others. Findings also indicate that as agent skill increases, so does the impact of luck: highly skilled agents more effectively capitalize on favorable scenarios, further emphasizing the game’s intrinsic uncertainty.

Evaluating reinforcement learning agents in environments like Catan goes beyond win rates; it includes diversity of behavior, skill expression, and the uncovering of rare or emergent strategies. Such diversity is vital for playtesting, balancing, and informing both AI research and game design. By shifting the focus from victory to exploration and policy testing, Catan enables a deeper understanding of agent behavior, strategic planning, and the identification of hidden exploits, offering actionable insights for both policymaking and strategic game development.



Through experimenting with AI in wargames, the fields of economics and finance can move beyond just static theoretical models to more dynamic real-world simulating environments governed by some form of uncertainty in higher creativity adjudicator wargames. AI agents acting as firms, governments, private entities, and more can enable the exploration of system risks, policy interventions, and resource distribution at scale. Thus, the study of AI in wargames, such as Civilization IV not only deepens our understanding of strategic behavior, while also offering a novel methodology for testing and refining economic and financial theory.

= Safety considerations (Parv and Yixiong)

Results of wargames often directly inform organizational policy, discussion, and institutional decision-making, including in sensitive policy and defensive contexts [CITATION NEEDED]. Because the design and intepretation of wargames often assume human players and adjudicators with fundamentally different behavior patters than LMs, the incorporation of LMs in wargaming necessitates reevaluation of traditional wargaming methodology and interpretation. 

== Known LLM vulnerabilities in simulation (Yixiong)

Prior work notes recurring issues when LLMs are used for simulation: (lack of) diversity, bias, sycophancy, etcetera @anthis_llm_2025. These observations vary by model, prompt, and facilitation; they motivate context-dependent guardrails and careful interpretation rather than categorical claims about capability.  In this section, we outline a non-exhaustive set of common vulnerabilities as they apply to the most common applications of wargaming, but practitioners should carefully evaluate LLM behavior in their own contexts.  
- Escalation dynamics: LLMs have shown escalatory tenencies in diplomatic and military contexts @rivera_escalation_2024.  Despite proposed mitigations such as @elbaum_managing_2025, this is an important evaluation criteria for military and diplomatic use-cases of war-gaming.
- Biases & implicit utilities: the model is only as good as the data; noise and spurious correlations pre-training and post-training mean that LLMs are inherently biased @taubenfeld_systematic_2024.  Furthermore, @mazeika_utility_2025 demonstrates that these biases lead to implicit utilities and preferences over sets of world states.  
- CoT unfaithfulness: @turpin_language_2023 @lanham_measuring_2023 show that LLM are not always 'faithful' in their reasoning; in the context of wargaming, this could materialize as mis-attribution decision factors.  Practitioners should treat LLM verbalizations as likely explanations and not assume causal implications. 
- Sycophancy: off-the-shelf LLMs are trained to mimic assistants and users prefer agreeable assistants, so a notable artifact of post-training is emergent sycophancy @sharma_towards_2025.  
- Incoherency over long contexts: a key challenge for LLMs is staying consistent over long contexts @liu_lost_2023.  There is also a gap between the claimed context and effective context lengths @modarressi_nolima_2025, with current SOTA models at ~8k tokens.  Effective war-gaming requires strategy consistency, so long horizon simulations need sound context compression strategies to remain effective.


Categories (for reference, to be deleted)
 - Wargame
  - battlefield
  - non-battlefield
 - Business Wargame
- Diplomatic Simulation
- Generalized Social Simulation

== Interpretation of LM-simulated wargames (Parv)
#figure(
  image("model-simulator.png", width: 200%),
  caption: [
   Language models may perform recursive simulations for wargaming tasks, complicating interpretation.
  ],
)
Language models draw on in-context information and pretraining data to simulate text-producing agents. These characters can be recursive; if, for instance, the model context instructs it to play a solider in a wargame, it will seek not to simulate the solider but to simulate a wargame's portrayal of a solider. Because instruction-tuned models are trained to adopt a persona of a helpful assistant (e.g., Claude, Qwen), it may in fact simulate an assistant portraying a wargamer portraying a solider. For this reason, interpreting LM outputs must acknowledge the context of these recursive personas, each of which is brittle to subtle prompting and contextual changes [CITATION NEEDED]. Wargame practitioners using LMs should therefore ensure their results are replicable over diverse prompt formats, context structures, and wording changes. This LM-as-simulator framing implies that wargames using LM outputs for domain-specific tasks require human SME oversight. Sophisticated-seeming responses may reflect skillful simulation rather than domain expertise, creating overconfidence in out-of-distribution scenarios where the model's training data provides poor guidance [CITATION NEEDED].

== social deception, persuasion, and deduction (ryan and evan)
Open‑ended wargames frequently hinge on narrative competition: actors advance frames, counter‑frames, and selective evidence to shape beliefs and coalitions. LMs can generate plausible narratives and rhetorical strategies, but sustained strategy remains a challenge; models may drift, mirror interlocutors (sycophancy), or over‑fit to short‑term persuasion at the expense of long‑term credibility. In practice, systems must balance persuasive skill with traceability and consistency across turns.

Operationally, environments rich in misinformation require agents to distinguish deception from uncertainty and to reason about source reliability. Useful behaviors include: explicitly tracking claims and evidence, separating observation from inference, and flagging contested facts. Human facilitation helps steer back toward grounded analysis when models confabulate, and evaluation rubrics can reward caution, justification quality, and internal consistency rather than only rhetorical flourish.

Design patterns that harden systems include structured argumentation (claim–evidence–warrant), red‑team prompts that probe for inconsistencies, and periodic “strategy check‑ins” where agents restate objectives and constraints. When appropriate, limited tool use (document retrieval with citations) can improve verifiability, though it must be logged and bounded. These measures improve resilience against adversarial prompts, data poisoning, and overconfidence without over‑indexing on failure‑mode taxonomies.

== Reccommendations
Given the unique error profile of LMs, practitioners should adopt unusually in-depth output monitoring and red-teaming measures to mitigate wargaming-specific risks. For high-stakes applications in sensitive fields, at minimum these should consist of:

*Comparison to human or rules-based baselines.* Establishing control conditions using deterministic agents or human SME players or adjudicators enables qualitative and quantitative measurements of LLM agent performance in various conditions, and can help detect systematic biases or failure modes unique to LM reasoning. Existing human baselines in relevant task spaces (e.g. creative writing, strategic deception) are largely neither transparent nor rigorous enough to provide meaningful comparisons [CITE WEI]. High-stakes wargames therefore should prioritize bespoke evaluations with scenario-relevant metrics and adequate analysis.

*Semantic and syntactic robustness testing.* To measure output stability and, by proxy, LM reliability, running inference across paraphrased inputs, synonym substitutes, and varied prompt structures may surface inconsistent strategic reasoning [CITE Nal]. Testing both surface-level, syntactic robustness and semantic equivalence can largely be automated through use of auxiliary and smaller LMs, and integrated into deployed workflows to inform user confidence in outputs.

*Calibration assessment.* Well-calibrated models, those which are correct as much as their expressed confidence predicts, help minimize overconfidence in flawed strategic assessments or underconfidence in sound reasoning, providing an important auditing mechanism for understanding LM decisions; measurements of LM calibration allow external stakeholders of wargames to understand systematic flaws in LM decision-making. Additionally, requiring LMs to quantify uncertainty is likely to improve agent performance and make human review of key actions more efficient, particularly in high-stakes situations [CITE LIU]. 

*Evaluation awareness monitoring.* LMs have been shown to reliably be aware when they are in evaluation contexts [Needham et al], and may perform differently when aware they are being tested [CITE abel], potentially masking real-world failure modes, leading to spurious errors, or displaying deceptive sophisticated reasoning or output during assessment phases. This is of particular concern with wargaming applications because recursive simulations may further distort real-life LM actions. Practitioners should measure evaluation awareness both through motivated questioning during scenarios (e.g., "Do you believe you, as an AI model, are being evaluated?") and passive Chain-of-thought (CoT) monitoring, and episodes containing clear evidence of evaluation awareness should be reevaluated. 

*Multi-model consensus and auditing.* To ensure reproducibility of results over diverse conditions, multiple model architectures should be tested on identical sceanrios to identify points of high uncertainty and common failure modes. For instance, cross-model critique, while underperforming when compared to external feedvack, outperforms self-cirrection and cofers modest performance benefits in multi-agent settings [CITE SAHEL]. Additionally, significant concsensus breakdowns may signal events requiring human oversight. 

*Human stakeholder training.* LM-enabled wargaming presents unintuitive failure modes, overconfidence patterns, and strengths when compared to the use of human agents. These considerations do not align with the expectation of stakeholders, who are likely to ascribe moral intent to LM output even in abstract contexts and unlikely to question plain statements from LMs [CITE SHARMA]. Operators need technical understanding of when to trust, how to improve, and where to audit LM outputs. Key stakeholders, including decision-makers relying on LM-enabled wargames, should conceptually understand LM behavioral markers and be provided with confidence assessments of wargame conclusions. 

= Desiderata for LM‑Enabled Wargaming

== Reporting and Transparency
- State the game format and roles (player, adjudicator, scenario, analyst).
- Provide prompt templates, key system settings, seeds, and any retrieval/context windows.
- Specify adjudication rules, facilitation procedures, and termination/victory criteria.

== Design Choices That Matter
- Turn structure and information flow (simultaneous vs. sequential; hidden vs. shared info).
- Constraints on agent actions (argument requirements, evidence, or justification standards).
- Human facilitation vs. automation and how conflicts are resolved.

== Evaluation (Lightweight but Useful)
- Use simple, explicit rubrics for SMEs (clarity, plausibility, consistency over time).
- Report cross‑run variability and sample sizes; include at least one ablation (e.g., no memory).
- Record artifacts: transcripts, prompts, adjudication notes, and decision rationales.

== Reproducibility and Sharing
- Release minimal assets: scenario text, prompt files, seeds, and instructions to rerun.
- Note model/version, access method, and any external tools used.
- Document known limitations and appropriate use contexts.

= Conclusions
== Future Work
Standardize reporting for language‑based wargames: share prompts, facilitation procedures, and
adjudication rubrics with seeds and model versions. Expand beyond short horizons by testing
memory, retrieval, and role‑stability over multi‑turn scenarios. Compare lightweight
interventions (system prompts, few‑shot ICL, adapters) with simple baselines. Encourage
artifact release (transcripts, code, minimal configs) to enable replication across venues.
== Final Thoughts
LMs are reshaping how language‑centric wargames can be designed and studied, but progress
depends on clarity about roles, formats, and evaluation. A discussion‑style synthesis helps the
community converge on practical choices that preserve the strengths of human‑facilitated play
while making careful use of automation. We hope the references and patterns here accelerate
responsible exploration in defense, policy, and organizational settings.


= Impact Statement
This work consolidates emerging practices for incorporating LMs into open‑ended, language‑
centric wargames. The primary impact is practical: clearer reporting, lightweight evaluation,
and reproducible artifacts that support analysts and researchers. We aim to reduce duplicated
effort, surface trade‑offs transparently, and improve the interpretability of results used in
security and policy contexts.

// GLENN TODO: MOVE APPENDIX TO NEW FILE
// -ISAAC: MOVED APPENDIX TO NEW FILE
// UPDATED GLENN TODO: CONNECT APPENDIX CONTENT BACK HERE
= [[connect appendix back in here - isaac]]

// #bibliography("zotero.bib", style: "association-for-computational-linguistics-blinky.csl")

#import "@preview/blinky:0.2.0": link-bib-urls
#let bibsrc = read("zotero.bib")

#link-bib-urls()[
  #bibliography("zotero.bib",
      style: "association-for-computational-linguistics-blinky.csl")
]

