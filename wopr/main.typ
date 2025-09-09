#import "@preview/tracl:0.6.1": *

#show: doc => acl(doc,
  anonymous: true,
  title: [Shall We Wordplay a Game?\
  Language Model Agents as Players and Adjudicators\
  in Highly Creative and Open-Ended War Games],
  authors: (
    (
      name: "Glenn Matlin",
      affiliation: [Georgia Institute of Technology],
      email: "glenn@gatech.edu",
    ),
    (
      name: "Parv",
      affiliation: [Georgia Institute of Technology],
      email:"@gatech.edu",
    ),
    (
      name: "Evan",
      affiliation: [Georgia Institute of Technology],
      email:"@gatech.edu",
    ),
    (
      name: "Stu",
      affiliation: [Georgia Institute of Technology],
      email:"@gatech.edu",
    ),
    (
      name: "Yixiong",
      affiliation: [Georgia Institute of Technology],
      email:"@gatech.edu",
    ),
    (
      name: "Ryan",
      affiliation: [Georgia Institute of Technology],
      email:"@gatech.edu",
    ),
    (
      name: "Isaac",
      affiliation: [Georgia Institute of Technology],
      email:"@gatech.edu",
    ),
    (
      name: "Mark",
      affiliation: [Georgia Institute of Technology],
      email:"@gatech.edu",
    ),
  ),
)

#let num_papers = "TBD"

#abstract[
Language models (LMs) are increasingly used to play, adjudicate, and analyze language‑based, open‑ended wargames in defense, government, and financial settings to provide insights for real-world decision-making. This new generation of _Artificial Intelligence (AI) wargame_ relies more on *creative* problem-solving and qualitative judgment over *analytical* rigor and precision. However, there have been significant hurdles for AI researchers when publishing in this field due to the domain-specific and knowledge-intensive requirements of professional wargaming. We present a discussion‑oriented literature review of #num_papers recent works which include AI wargames. We present a novel ontology for researchers to understand  Analytical vs Creative wargaming, for both the Player and Adjudicator roles. We provide a discussion for researchers on how to use our ontology to appropriately categorize their own game environment and discover new literature ... (needs work)
This paper provides a conslidated look at this emerging area ... (etc) ... and
provides clear direction for other researchers to pursue. Our  responsible experimentation with LLMs in wargaming and
adjacent, language‑centric simulations.
]



_"[War is a] strange game.\
The only winning move is not to play.\
How about a nice game of chess?"\
-- WOPR (War Operation Plan Response) a.k.a. "Joshua"_

= Introduction

Applications of Artificial Intelligence (AI) for real-world decision-making has accelerated due to the due to research and engineering behind Language Models (LMs). LMs are increasingly treated as a general‑purpose technology, providing a natural‑
language interface for help with analysis, reasoning, and planning. Wargames are used by Subject Matter Experts (SMEs) to draw information about the potential outcome of decisions made in security and policy contexts. Wargame SMEs have begun to explore how they can use AI agents which are enabled by LMs to act as players, adjudicators, scenario generators, and analysis aids.
There is growing interest in language‑based and open‑ended wargames that emphasize
qualitative, argument‑centric play and multi‑party dynamics. Traditional computational
approaches often struggle to capture narrative depth, while purely human exercises are
resource‑intensive. LLMs open new possibilities but introduce fresh design choices about roles,
formats, and evaluation.
This paper offers a scoping view of the space and a discussion‑oriented desiderata for using
LLMs in language‑based and open‑ended wargames. We synthesize patterns across recent
studies and practice to highlight what is being built, how these systems are used, and which
design choices matter for realism and usefulness.

== Scope and Aims
- Scope: language‑based and open‑ended wargames (e.g., seminar, matrix, digital multi‑turn);
  LLM roles include player, adjudicator, scenario generation, and analyst.
- Aims: (1) catalog recent approaches and design patterns; (2) discuss trade‑offs in format,
  prompting, and evaluation; (3) propose desiderata for clarity, reproducibility, and practical
  value; (4) curate references and resources for practitioners and researchers.

= Related Work
== Background
// Riedl says we might neeed background and definitions as separate, and not in related works. signposting is ok. one option to keep this in related work is to present and cite all the terminology used by others and why we use and extend it. we also would present things here we disagree with etc but we are likely in the former category so we just need to communicate what we do. communicate these sections in terms of related works rather than WE DEFINE. we would want to place our diffs at the end. we should use this section to lay down what others say and really adopt and lay it on them. this is the section for all the others
=== wargame
We define “wargame” as “a multi‑faceted depiction of conflict with one or more parties in which the participants’ decisions influence the future outcomes of events” [@perla_what_1985; @noauthor_wargaming_2017; @caffrey_toward_nodate]. For this paper, we use the following working definition:
+ Ongoing conflict between actors with opposing interests or needs;
+ A synthetic environment that enables agent choice and feedback;
+ Agents make decisions and experience consequences via adjudication or rules;
+ Strategic reasoning uses information about other agents and the environment [@coulthart_whats_2017; @james_markley_strategic_2015; @perla_what_1985; @page_modeling_nodate].
For our purposes, we adopt policy definitions of “Artificial Intelligence” (AI) as “the use of computers to carry out tasks that previously required human intelligence” [@national_security_commission_on_artificial_intelligence_final_2021; @sayler_artificial_2019].
=== serious game
“Serious games” are games designed for purposes beyond entertainment—such as training,
education, analysis, or policy exploration. Wargames can be considered a subset of serious
games when they are used to explore strategic choices, elicit expert judgment, or stress‑test
plans. Unlike recreational games, the primary objective is to generate insight rather than to
optimize win conditions, and design choices (facilitation, documentation, evaluation) are
selected to support learning and analysis rather than spectacle.

=== Creative vs Analytical
Current approaches fall into two broad families: (1) human‑computer wargames used in
defense and policy contexts, and (2) strict rule‑based games (e.g., board or digital games like
Diplomacy). Human‑computer wargames rely heavily on subject‑matter experts (SMEs) for
scenario design, player actions, and adjudication [@coulthart_whats_2017; @perla_what_1985]. Seminar‑style formats prioritize
argumentation and open‑ended decision‑making.\

By contrast, most automation and AI for wargaming has targeted “quantitative” games with
discrete moves and predictable outcomes, using traditional AI or expert systems. These systems
struggle with the ambiguity, creativity, and multi‑party interactions central to seminar formats.
Computational support exists for tightly scoped kinetic or logistical simulations (e.g., Monte
Carlo tree search; reinforcement learning) over specific mechanics, but offers little help with
narrative argumentation [@black_scaling_2024; @page_modeling_nodate]. Such approaches often have limited interpretability, poor
generalization to novel scenarios, and difficulty handling long‑form, multi‑party discourse.\
While militaries have begun experimenting with LLMs, there is no established methodology for
integrating them into open‑ended, qualitative formats. Early experiments that let off‑the‑shelf
LLMs “play” scripted moves showed brittle reasoning, hallucination, and rule non‑adherence
[@lamparth_human_2024; @meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022; @wu_enhance_2024; @xu_exploring_2023; @xu_language_2023]. Open‑ended wargames remain predominantly human‑driven because they
require creativity, persuasion, and negotiation—not merely optimal move search [@perla_why_2011; @noauthor_wargaming_2017; @coulthart_whats_2017].
==== Analytical
Analytical wargaming emphasizes formal rules, codified mechanics, and quantitative outcomes.
It favors repeatability and narrow uncertainty, supports deterministic or stochastic models,
and enables automation through explicit state representations and scoring.
==== Creative
Creative wargaming emphasizes narrative reasoning, argumentation, and expert judgment.
It values plausibility and explanatory richness over strict optimality, and relies on facilitation
and qualitative adjudication to explore alternative futures.
== seminal works in the field that help define it  Artificial Intelligence in Wargaming 
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
== other lit reviews, other game papers
Surveys of LLMs in games and simulation describe agents that negotiate, plan, or role‑play in
constrained environments [@ma_computational_2024; @zhang_llm_2024]; work on Diplomacy combines
language models with planning and tool use [@meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022; @lamparth_human_2024]; and multi‑agent LLM frameworks
explore coordination, debate, and self‑critique [@zhang_llm_2024; @yao_spin-bench_2025]. Parallel reviews
in defense communities catalog AI for training and analysis but emphasize quantitative or kinetic
models [@geist_understanding_nodate].

Across these threads, reporting is heterogeneous and evaluation often short‑horizon or
subjective; prompts and facilitation procedures are rarely standardized; and open‑ended,
qualitative wargames remain under‑served. Our discussion consolidates approaches for
language‑based formats and highlights practical choices that affect realism and utility.

= Results
We summarize descriptive statistics and qualitative themes from the surveyed works. Counts
cover venues, years, and domains; design patterns group LLM roles (player, adjudicator,
scenario, analyst) and game formats (seminar, matrix, digital multi‑turn). We highlight
typical prompting strategies, facilitation approaches, and reported outcomes. Figure 2 shows
yearly paper counts by quadrant; Figure 3 summarizes the screening flow. Tables provide quick
reference; detailed extraction lives in the appendix.

Time analysis: annual volume and venue mix.
Paper stats: LLM families, roles, formats, artifacts released.
Figures: open‑endedness quadrants and representative placements.



== Quadrants: Analytical vs Creative

#image("creativity_quadrants.png")
image("creativity_quadrants.png") 
Figure: Open‑endedness quadrants (illustrative placement of formats).

=== Q1: Analytical Player, Creative Adjudicator
This quadrant covers games in which players are often relatively limited in their action space,
while a flexible, often human, adjudicator computes the outcomes. A less common quadrant,
well‑known games that would fall into this quadrant include classic Free Kriegsspiel, where the
focus is on limited procedural military actions while the outcomes are adjudicated by a human
adjudicator. Many other battlefield‑scale wargames would fall under this category.

=== Q2: Analytical Player, Analytical Adjudicator
This quadrant covers rigid, rule‑based systems for both the players and the adjudicators (often
predetermined scoring). Of the quadrants, this quadrant—alongside Q4—is among the most
extensively explored, as it captures traditional “quantitative” wargames. Notable examples
include the No‑Press variant of Diplomacy, the original rigid Kriegsspiel, and nearly the entirety
of traditional strategy board games such as chess, checkers, and Go.

=== Q3: Creative Player, Analytical Adjudicator
This quadrant covers games with highly creative agents and low‑creativity adjudicators. Common
patterns in this quadrant include highly expressive, low‑procedural‑complexity games with a
procedural adjudicator. This includes the vast majority of board games with a social element and
rigid scoring rules, such as Diplomacy and Settlers of Catan.

Of the quadrants, this quadrant is one of the most explored in its relation to AI, with extensive
research—especially with wargames such as Diplomacy, most notably Meta’s Cicero [@meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022]. With rigid
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

LLMs are trending toward longer time‑horizon
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
  caption: [Yearly paper counts by quadrant (2019–present). Final figure will visualize bars colored by quadrant.],
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
  caption: [Screening flow (PRISMA‑style) with counts per stage and inclusion criteria.],
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

=== Human-Agent Interactions (HAI) vs Agent-Agent Interactions (A2A)
Especially in the areas of Diplomacy and highly creative agents, previous research leans toward Human–Agent Interactions (HAI) with emphasis on emulating or integrating with human diplomatic behavior. Often it is a single AI agent interacting with a group of human players, as seen typically in AI research with _Diplomacy_. With diplomacy and collaboration being the focus, the state of the game strongly encourages AI agents to adopt the social language of the rest of the players. Such research is often conducted through random games on online platforms with text‑based communications, and mostly without the human users being strongly informed of the presence of the AI agent on the platform, let alone that they are playing against an AI agent. The focus is often on how AI interacts compared to human diplomatic strategies as the primary benchmark, with the target of human‑like behavior, and evaluated on performance against humans. 


However, agent–agent interaction (A2A) is increasingly important as agentic AI proliferates in
practice, including organizational and enterprise contexts. Conflicts between multiple agentic
systems will differ from HAI dynamics. Much prior work studies cooperative tasks or MoE
coordination; competitive diplomatic A2A remains sparse. Human‑likeness, a common HAI
benchmark, may not translate to A2A settings with different equilibria and strategies.

=== cybersecurity risks, military aspects (stu)
==== Cyber risks overview
This section outlines representative cyber risks relevant to LLM‑enabled wargames; it is a non‑exhaustive set intended to frame subsequent event/target/effect listings.
_*D4M:* Deny, degrade, disrupt, destroy, modify_
===== Asset: The AI/Agent Model
====== Event: Data D4M  
======= Event Targets: data types
  - Raw data (corpora) that may be included in training data, knowledge graphs, or searches
  - Training data sets
  - Model weights
  - Prompts
  - Agent packages (e.g., the set of files required for a user to install/integrate and deploy/use an AI agent)
======= Event Locations:
  - External (outside of the organization and its vendors or contractors): Internet, open‑source, open‑access data
  - Commercial/Contractor: commercial/vendor or contractor‑owned or licensed resources, including closed‑source and proprietary data, and curated external data
  - Organization: organization‑owned or licensed resources, including closed‑source or proprietary data, and curated commercial/vendor and external data
======= Event Effects:
The following aspects of a wargame that include AI in some manner may be denied, degraded, disrupted, destroyed, or modified: 
  - Wargame development (e.g., scenario or prompt generation)
  - Player or adjudicator behavior/decisions (e.g., unrealistically escalatory or de‑escalatory, not aggressive/too aggressive, erratic, manipulative, non‑compliant)
  - Adherence to rules
  - Chain‑of‑thought, reasoning logs, retrieval links
  - Meta‑gaming
  - Agent jailbreaking to access game/meta‑game
  - Agent jailbreaking to access information technology systems
Other effects may include:
  - Data exfiltration: wargame, meta‑game, and non‑game (organizational)
  - Information technology system exploitation and lateral movement into non‑wargame systems
====== Event: API D4M
======= Event Targets: external and internal APIs
  - Open‑access raw data providers (e.g., Internet databases, Wikipedia)
  - Commercial/contractor data providers (e.g., cloud storage)
  - Commercial/contractor AI providers (e.g., commercially hosted AI models)
======= Event Effects:
  - As above.

I could go into much more detail, but that would turn into a series of repetitive narratives about who/what/when/where/how. I could also cover other vectors that target the wargame system and related information (results, analysis, etc.)—but that’s typical cybersecurity scope.



=== concerns about international diplomacy (isaac)
Diplomatic wargaming centers on language, signaling, and credibility rather than material force. Open‑ended, argument‑driven formats (seminar, matrix) capture how positions evolve through persuasion, norm invocation, and threat–promise exchanges across multiple stakeholders (states, IOs, NGOs, industry). When LLMs participate, their value is in maintaining coherent narratives over long horizons, proposing plausible options under contested facts, and helping surface implicit assumptions in briefs and communiqués.

Compared with battlefield scenarios, diplomatic games emphasize incomplete and asymmetric information, face‑saving, and issue linkage (security tied to trade, technology, or climate). Facilitation and adjudication must account for audience costs, domestic politics, and path dependence across rounds. LLMs can assist by drafting position papers, back‑channel messages, or press releases in different registers, while humans retain control of red lines, escalation ladders, and legitimacy constraints.

Practical design choices that matter include: clear turn structure (front‑channel vs. back‑channel), explicit rules for information sharing and leaks, and rubrics that reward consistency and coalition‑building rather than only “wins.” Artifact capture (transcripts, proposals, dissent notes) is crucial for after‑action learning. Reproducibility improves when scenarios, prompts, and adjudication criteria are shared alongside model/version information.

=== business/organization wargames (glenn and rohan)
Business and organizational wargames use competitive or cooperative scenarios to stress‑test strategy under uncertainty (market entry, pricing, regulatory change, supply‑chain disruption, M&A). Open‑ended play surfaces narrative risks (misaligned incentives, vendor lock‑in, reputation shocks) that spreadsheets can miss. LLMs can play roles as competitor teams, regulators, customers, or internal functions (legal, comms), generating options and counter‑moves in natural language.

Effective formats combine structured turns (brief → move → challenge → adjudication) with qualitative evidence requirements: claims must cite assumptions, external signals, or benchmarks. Adjudication blends simple quantitative checks (unit economics, capacity) with narrative plausibility. LLMs can draft memos, scenario briefs, or stakeholder analyses conditioned on constraints (budget, brand voice, compliance) and can help enumerate second‑order effects, but human facilitators keep realism and ethics in scope.

For organizational adoption, reproducibility and governance are key. Keep minimal artifacts (scenario text, prompts, seeds, facilitation script), log model/version and any tool use (RAG, calculators), and separate confidential data from public scaffolds. Typical evaluation rubrics emphasize clarity of reasoning, sensitivity analysis (what if X changes), and decision traceability. Sharing sanitized transcripts and prompt scaffolds accelerates reuse across teams while protecting proprietary details.
=== social deception, persuasion, and deduction (ryan and evan)
Open‑ended wargames frequently hinge on narrative competition: actors advance frames, counter‑frames, and selective evidence to shape beliefs and coalitions. LLMs can generate plausible narratives and rhetorical strategies, but sustained strategy remains a challenge; models may drift, mirror interlocutors (sycophancy), or over‑fit to short‑term persuasion at the expense of long‑term credibility. In practice, systems must balance persuasive skill with traceability and consistency across turns.

Operationally, environments rich in misinformation require agents to distinguish deception from uncertainty and to reason about source reliability. Useful behaviors include: explicitly tracking claims and evidence, separating observation from inference, and flagging contested facts. Human facilitation helps steer back toward grounded analysis when models confabulate, and evaluation rubrics can reward caution, justification quality, and internal consistency rather than only rhetorical flourish.

Design patterns that harden systems include structured argumentation (claim–evidence–warrant), red‑team prompts that probe for inconsistencies, and periodic “strategy check‑ins” where agents restate objectives and constraints. When appropriate, limited tool use (document retrieval with citations) can improve verifiability, though it must be logged and bounded. These measures improve resilience against adversarial prompts, data poisoning, and overconfidence without over‑indexing on failure‑mode taxonomies.

=== Economic, Financial, and Business Implications of Wargaming

= Methodology
We conducted a structured literature review following Kitchenham’s SLR phases and PRISMA reporting guidance. We searched Google Scholar, arXiv, and Semantic Scholar using three Boolean queries, deduplicated by DOI, and screened title/abstract before full‑text review. Our final set of #num_papers papers was extracted into a CSV for quantitative counts and qualitative theme coding.

````sql
("wargame" OR "seminar wargame" OR "matrix wargame") AND ("large language model" OR "LLM" OR "GPT")
````
Academic Sources: Scopus, Web of Science, IEEE Xplore, ACM DL, arXiv, SSRN;
Niche: Defense Technical Information Center, The RAND Corporation, Simulations & Gaming Journals, Military wargaming centers, DoD, UK MOD

... and see appendix B

= Safety considerations (Parv and Yixiong)

How wargaming outputs are used in practice should shape safety posture. In policy and defense contexts, results inform discussion, training, or exploratory analysis—not binding action—but they can still influence perception and decision framing. We emphasize documenting scope and limits, separating model output from analyst judgment, and preserving provenance (who decided what, with which evidence) so that readers do not over‑generalize from illustrative runs.

== Known vulnerabilities of LLM as simulation method in strategic games [Yixiong]

Prior work notes recurring issues when LLMs are used for simulation: tendencies toward escalation in some settings, bias amplification, chain‑of‑thought (CoT) unfaithfulness, and sycophancy. These observations vary by model, prompt, and facilitation; they motivate guardrails and careful interpretation rather than categorical claims about capability.
- Escalation dynamics (varies by scenario/design)
- Biases; CoT unfaithfulness; sycophancy
- Additional discussions in simulation critiques (e.g., Evans et al.)
- Domain‑specific concerns (e.g., nuclear risk contexts)

== Interpretation of LLM-simulated wargames [Parv]

Practical guidance for safe interpretation: treat LLM outputs as hypotheses and narratives, not ground truth. Clearly explain the lack of real‑world grounding, the sensitivity to prompts and context, and the potential for confabulation. Retain human accountability and resist over‑delegation, even when LLM suggestions look sophisticated; high‑stakes decisions require SME oversight.
- Explain lack of grounding and the nature of LLM outputs
- Delegation of power: caution even if models appear to outperform humans in narrow tasks

== Pre-deployment evaluation [Parv]

- Compare against simple human or rules baselines where feasible (even if qualitative)
- Red‑team the system:
  - Semantic flaws (insufficient context, improper context control)
  - Observe effects of known issues (e.g., bias, unfaithful CoT) on outcomes
- Security review for data handling, access control, and supply chain
- Chain‑of‑thought (CoT) monitoring and logging policies
- Standard high‑stakes software tests (reliability, auditability, rollback)


= Desiderata for LLM‑Enabled Wargaming

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
LLMs are reshaping how language‑centric wargames can be designed and studied, but progress
depends on clarity about roles, formats, and evaluation. A discussion‑style synthesis helps the
community converge on practical choices that preserve the strengths of human‑facilitated play
while making careful use of automation. We hope the references and patterns here accelerate
responsible exploration in defense, policy, and organizational settings.


= Impact Statement
This work consolidates emerging practices for incorporating LLMs into open‑ended, language‑
centric wargames. The primary impact is practical: clearer reporting, lightweight evaluation,
and reproducible artifacts that support analysts and researchers. We aim to reduce duplicated
effort, surface trade‑offs transparently, and improve the interpretability of results used in
security and policy contexts.

= Appendix A: On Wargames

== Social Games
While wargames may contain elements of social reasoning or deception, they differ fundamentally from social deduction games in that deception is not the objective but a component of broader strategic reasoning. Wargames require agents to pursue defined goals through planning and decision-making within a structured conflict environment. In contrast, social deduction games are centered around identity discovery and psychological misdirection, making them categorically distinct. This distinction is critical for evaluating LLMs in open-ended scenarios, as social deduction games test their ability to navigate dynamic, multi-agent interactions involving trust and deception (AMONGAGENTS, 2025).
\\
Psychological misdirection is prolific in warfare, however, and history is rife with examples of cunning tacticians using it with great success. As the Chinese military strategist Sun Tzu famously wrote, "All warfare is based on deception," exemplified by tactics like the Trojan Horse, the Empty Fort Strategy, and Hannibal’s crossing of the Alps to outmaneuver Roman forces through strategic diversions. For this literature review, social deduction games represent a complementary effort to wargames, as their focus on harnessing psychological misdirection in game scenarios can enhance LLMs’ performance in real-life contexts where information may be unreliable, mislabeled, or intentionally deceptive (Game Theory Approach to Identifying Deception in Large Language Models, 2025; Human vs. Machine: Language Models and Wargames, 2025). By studying LLMs in these settings, researchers can improve their adaptability to ambiguous, deception‑heavy scenarios critical to both wargaming and broader AI applications.



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

= Appendix B: Systematic Literature Review Protocols

== Key Definitions
(locked before screening starts)

*Wargame:* A multi-actor, multi-turn interactive scenario whose purpose is to explore conflict decisions and consequences. Examples include seminar games, matrix games, and digital crisis simulations.

*Open-ended:* Games where rules permit *unconstrained natural-language moves*, allowing players to propose novel actions beyond a preset menu. Outcomes are adjudicated by facilitators, subject matter experts, or dynamic rules rather than a fixed payoff matrix. Matrix wargames and Diplomacy (with negotiation phases) exemplify this approach, contrasting with constrained games like Chess or Go or social games like Werewolf or Among Us.

*Quantitative wargame:* Formats that track numeric scores, payoffs, probabilities, or optimization objectives, though they may still contain open-ended dialogue components. Examples include Diplomacy (with victory points) and stochastic combat models.

*Qualitative wargame:* Games relying on narrative adjudication or subject matter expert judgment with minimal or no numeric scoring. Tabletop seminar games with after-action discussions represent this category.

*Language-centric game:* Formats where progress depends fundamentally on *textual or spoken communication* among actors (human or LLM). CICERO Diplomacy and conflict negotiations exemplify this approach [@meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022], contrasting with action-based games like StarCraft with micromanagement handled by LLM-powered bots.

// (Removed: failure‑mode vocabulary, since not a focus of this paper.)

*Player agent:* The actor that proposes moves during play (human or LLM). Hereafter referred to simply as the “player.”

*Adjudicator agent:* The entity that determines outcomes (via rules, computation, or expert judgment). Hereafter referred to simply as the “adjudicator.”

== Inclusion / Exclusion Criteria

=== Inclusion Criteria

Studies were included if they met all of the following criteria:
- (I1) Publication year 2022 or later to ensure GPT-era relevance.
- (I2) Includes the use of LLMs with at least one billion (1B) parameters (e.g., GPT-2 and later, PaLM, Claude, Llama, OLMO, etc.) to establish a modern capability floor.
- (I3) Games involving *natural-language interaction between one or more agents* (LLMs or humans) to ensure focus on language-based gameplay.
- (I4) Games qualifying as *open-ended wargames* per our definitions to capture both analytic and creative styles.
- (I5) LLMs serving as agents, adjudicators, or generators to ensure breadth of roles.
- (I6) Provision of any evaluation outcome (quantitative metrics, subject matter expert narratives, or explicit statement of “none”) as needed for synthesis.
- (I7) Full text accessibility with machine translation acceptable to ensure global coverage.
- (I8) Publication in peer-reviewed venues or formal technical reports (RAND, CNA, DoD, MoD) with grey literature flagged but included.

=== Exclusion Criteria

Studies were excluded for the following reasons:
- (E1) Single-move polls or surveys presented as games due to lack of interactivity.
- (E2) Non-language game AI systems (Go, StarCraft, Atari, etc.) as out of scope.
- (E3) Opinion or editorial pieces without research content, including any blog posts which lack technical appendices or methodology.
- (E5) Systems primarily relies on LLMs below one billion parameters as falling below the modern capability threshold.

== scoping questions
_"Please search the web for the research paper and read the contents of "BALROG: Benchmarking Agentic LLM and VLM Reasoning On Games" Please help answer the following questions: "Does this experimental methodology of the paper feature (1) open-ended games (2) multiplayer games (3) strategy games (4) war games (5) crisis simulation (6) military simulation (7) moderated policy conflict/debate (8) diplomatic negotiation, or (9) any other form of similar competitive games? Finally (10), would you consider this game to be appropriate for a scoping survey on open-ended language-based war games?" After providing your reasoning and answers, please summarize your reasoning into one sentence explaining why overall the answer for (10) is "YES" or "NO""_

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


== E Seed Papers (coverage check)

- Hogan & Brennen 2024 – _Open-ended Wargames with LLMs_
- FAIR Diplomacy (Science 2022)
- Lamparth et al. 2024 (two versions)
- Shrivastava et al. 2024 (inconsistency)
- Rivera et al. 2024 (escalation)

All search strings must surface these five.
// Uncomment this to include your bibliography

/*
#import "@preview/blinky:0.2.0": link-bib-urls
#let bibsrc = read("custom.bib")

#link-bib-urls()[
   #bibliography("custom.bib", style: "./association-for-computational-linguistics-blinky.csl")
]
*/

#bibliography("zotero.bib", style: "association-for-computational-linguistics-blinky.csl")
