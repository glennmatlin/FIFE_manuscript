#import "@preview/tracl:0.6.1": *


#show: doc => acl(doc,
  anonymous: true,
  title: [Shall We Wordplay a Game?\
  Language Models for Wargames],
   authors: (
    (
      name: "Anonymous",
      affiliation: [Anonymized for review],
      email: "anonymous@invalid",
    ),
  ),
)

#import "config.typ": num_papers

#abstract[
Language models (LMs) are increasingly being deployed for use in defense and security settings to provide humans with insights for real-world decision-making. One prominent example is the use of LMs to play, adjudicate, and analyze strategic wargames. LMs are particularly useful for contexts with open-ended dynamic problems when gameplay is non-linear and entirely novel solutions can be proposed.
// GLENN: need a hook here that pulls people in using a safety argument of some kind... make it critical and important! danger danger!! get people interested.
This new generation of _Artificial Intelligence (AI) wargames_ relies more on *creative* problem-solving and reasoning over *analytical* rigor and precision. However, there have been significant hurdles for AI researchers when publishing in this field due to the domain-specific and knowledge-intensive requirements of professional wargaming. We present a scoping literature review of #num_papers recent works on AI wargames and present a novel ontology for researchers to engage with AI wargaming. We provide a discussion for researchers on how to use our ontology to appropriately categorize their own game environment and discover new literature ...(TODO)... This paper provides a consolidated look at this emerging area ...(TODO)... and provides clear direction for other researchers to pursue. Our goal is to encourage responsible experimentation with LMs in wargaming and adjacent, language‑centric simulations.]

#include "content/0_abstract.typ"
#include "content/1_introduction.typ"
#include "content/2_background.typ"
#include "content/3_related_works.typ"
#include "content/4_methodology.typ"
// #include "content/5_results.typ" // Glenn: Will move stuff into results when we are not working on it ...

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
#image("figures/creativity_graph.drawio.png")
Figure: Open‑endedness quadrants (illustrative placement of formats).


=== Q1: Analytical Player, Analytical Adjudicator
This quadrant covers rigid, rule‑based systems for both the players and the adjudicators (often
predetermined scoring). Of the quadrants, this quadrant is among the most extensively explored, as it captures traditional “quantitative” wargames. Notable examples include the No‑Press variant of Diplomacy, the original rigid Kriegsspiel, and nearly the entirety
of strategy board games both traditional (e.g. chess, checkers, and Go) or modern (e.g. Stratego, Warhammer 40k, and Polytopia) @bakhtin_mastering_2022.

These games often benefit less from recent developments in LMs because of its rigid nature, with RL approaches being more common. 

=== Q2: Analytical Player, Creative Adjudicator
This quadrant covers games in which players are often relatively limited in their action space, while a flexible, often human, adjudicator determines the outcomes. An infrequent quadrant, games that would fall into this quadrant include variants of wargames such as Meckel's early version of Free Kriegsspiel and the class of procedural-based human-adjudicated war games. The latter type are typically high fidelity military simulations where player actions are constrained by established orders and procedures while action outcomes are decided by human experts; this would encompass major real world wargames such as early US Navy Fleet Problems and standard Tactical Exercise Without Troops (TEWT) where the focus is on decisions within procedural military actions while the outcomes are adjudicated by a field expert. Other types of games that fall under this category include semi-rigid adjudicated wargames, where the game is played rigidly and mostly adjudicated rigidly with the possibility of human adjudicator override. 

=== Q3: Creative Player, Analytical Adjudicator
This quadrant covers games with highly creative agents and low‑creativity adjudicators. Common
patterns in this quadrant include highly expressive, low‑procedural‑complexity games with a
procedural adjudicator. This includes the vast majority of board games with a social element and
rigid scoring rules, such as Diplomacy and Settlers of Catan.

Of the quadrants, this quadrant is one of the most explored in its relation to AI, with extensive
research, especially with wargames such as Diplomacy, most notably Meta’s Cicero @meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022. With rigid adjudication mechanisms and often rigid procedural agent mechanisms, games in this quadrant are mechanically simple to run and evaluate, which leads to the popularity of this category.

*Issues with Q3.* The limited creativity that makes Q3 attractive is also its major flaw. The rigid
adjudication and procedural constraints in much existing research across the quadrants strongly
constrain the effect of the expressive creativity that would be the focus.

=== Q4: Creative Player, Creative Adjudicator
This quadrant covers wargames with expressive players and qualitative adjudication. Examples
include modern seminar and matrix formats and adjudicated simulations (e.g., Model United
Nations). These exercises are common in defense, diplomacy, and organizational decision‑making.

== Why Q4 matters for analysis
Games that allow creativity for both players and adjudicators better support classic aims of
wargaming: exploring uncertainty, revealing assumptions, and eliciting expert judgment. Real world scenarios are hardly analytical and issues with rigid rule set for players and adjudicators mapping poorly to real world scenarios are obvious and well-explored; treatises on this matter could be dated at least back to the Free Kriegsspiel movement in the 1870s. However, few studies automate construction or evaluation for Q4 settings.

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

// riedl: we should explicitly have a section on research problems and what can be learned by working on those.
// real time multi agent planning -- mech interpretability -- avoiding bias and echo chambers

// riedl: have a statement at some point where you could focus on anyone of these individual problems, but these games give opportunities to do many things at once and measure interactions. Q4 can solve the problem by avoiding the silos, explaining how the systems interact etc.

= Discussion
We synthesize design choices that most influence realism and analytical value: how turns are structured, what evidence or justification is required, the level of human facilitation, and how conflicts are adjudicated. We outline practical next steps for language‑based formats and note open directions for evaluation and sharing of artifacts.

== Military Security
// [battlefield/material focused wargames vs diplomacy we can leave diplomatic aspects of military wargames to next section to avoid overlap, can mention] - isaac

== International Relations
International Relations (IR) wargaming centers on language, signaling, and credibility rather than material force, and is used for communication, negotiation, and diplomacy. Open‑ended, argument‑driven formats (seminar, matrix) capture how positions evolve through persuasion, norm invocation, and threat–promise exchanges across multiple stakeholders (e.g., national states, non-government or industrial organizations). When LMs participate, their value is in maintaining coherent narratives over long horizons, proposing plausible options under contested facts, helping surface implicit assumptions in briefs and communiqués, processing scenarios, and aiding with adjudication on non-analytical rubrics and procedures.\
In a similar manner to how wargames are used extensively by the officer corps of a military, wargames are commonplace among IR professionals. Wargames present an opportunity for experiential learning for diplomatic training. Wargames are used both to support training and development, and to analyze and gain a deeper understanding of diplomatic crises that were previously unseen or extremely infrequent (i.e., nuclear crises).\
Compared with military applications, diplomatic games emphasize incomplete and asymmetric information, face‑saving, issue linkage (security tied to trade, technology, or climate), and a shift away from material forces towards abstracted interests. Facilitation and adjudication must account for audience costs, domestic politics, and path dependence across rounds. LMs can assist by drafting position papers, back‑channel messages, or press releases in different registers, while humans retain control of red lines, escalation ladders, and legitimacy constraints.\
Practical design choices that matter include: clear turn structure (front‑channel vs. back‑channel), explicit rules for information sharing and leaks, and rubrics that reward consistency and coalition‑building rather than only “wins.” Artifact capture (transcripts, proposals, dissent notes) is crucial for after‑action learning. Reproducibility improves when scenarios, prompts, and adjudication criteria are shared alongside model/version information.\
IR professionals in particular benefit from wargaming because of its creative and non-analytical structure. With subjective rubrics and emphasis on cooperation and social interactions, innovative players and adjudications are nearly necessary and alleviate human cost from traditional executions of diplomatic wargames with human players and computers, whether it is through fully autonomous or human-aided.

== Businesses and Organizations
// BUSINESS CITATIONS:
// @scherpereel_decision_2005
// @bradfield_origins_2005
// @chussil_learning_2007
// @coyne_predicting_2009
// @hamel_competing_1994
// @hershkovitz_wargame_2019
// @kurtz_business_2003
// @oliverschwarz_ex_2011
// @resende_critical_2018
// @scherpereel_changing_2005
// @scherpereel_decision_2005
// @scherpereel_impact_2003
// @schwarz_business_2013
// @schwarz_combining_2019
// @spaniol_five_2019
// @hamel_competing_1994
Business wargames use competitive or cooperative scenarios to stress‑test potential strategies that carry a high degree of uncertainty (market entry, pricing, regulatory change, supply‑chain disruption, M&A). Open‑ended play surfaces narrative risks (misaligned incentives, vendor lock‑in, reputation shocks) that spreadsheets can miss. LMs can play roles as competitor teams, regulators, customers, or internal functions (legal, comms), generating options and counter‑moves in natural language.

Effective formats combine structured turns (brief → move → challenge → adjudication) with qualitative evidence requirements: claims must cite assumptions, external signals, or benchmarks. Adjudication blends simple quantitative checks (unit economics, capacity) with narrative plausibility. LMs can draft memos, scenario briefs, or stakeholder analyses conditioned on constraints (budget, brand voice, compliance) and can help enumerate second‑order effects, but human facilitators keep realism and ethics in scope.

For organizational adoption, reproducibility and governance are key. Keep minimal artifacts (scenario text, prompts, seeds, facilitation script), log model/version and any tool use (RAG, calculators), and separate confidential data from public scaffolds. Typical evaluation rubrics emphasize clarity of reasoning, sensitivity analysis (what if X changes), and decision traceability. Sharing sanitized transcripts and prompt scaffolds accelerates reuse across teams while protecting proprietary details.

== Economics and Finance
Wargames can be powerful tools for modeling and studying economics and finance. Games such as Civilization IV provide synthetic environments that mirror the fundamental structures of economic systems, requiring players to allocate resources, manage cities, and balance immediate needs against long-term growth. Each decision embodies core economic concepts—opportunity cost, inflation, deficit spending—where constraints shape strategy and outcomes. Unlike abstract models, wargames simulate emergent market behaviors through the interactions of both human players and AI agents. This makes them valuable laboratories for applied economics, enabling researchers to test economic theories under controlled yet dynamic conditions.

Finance, too, is inherently adversarial and strategic: firms compete for market share, governments set monetary policy, and traders react to limited information. Wargames replicate these dynamics through embedded markets, trade routes, and investment decisions, where each choice has lasting consequences. In Civilization IV, for example, controlling strategic resources functions like commodity market dominance, while trade agreements resemble bilateral contracts. Deploying AI agents in such settings allows economics and finance researchers to observe strategies of collusion, innovation, and predatory expansion under dynamic conditions. This creates an experimental platform for studying algorithmic pricing, market shocks, and competitive equilibria without real-world risk.

Other games, such as Settlers of Catan, also provide valuable macro-scale models of cooperation, conflict, and uncertainty. In Catan, players act as economic agents competing to expand while relying on negotiation and trade to succeed. This interplay mirrors real-world markets where competition and collaboration coexist. Uncertainty introduced by dice rolls and development cards forces adaptive decision-making, risk assessment, and learning under partial observability—core challenges in modern economic and policy processes. Negotiation, bluffing, and persuasion make Catan especially relevant as a testbed for AI agents, encouraging the study of advanced dialogue, bargaining tactics, and emergent strategic behaviors.

Through experimentation with AI in wargames, the fields of economics and finance can move beyond static theoretical models toward dynamic environments governed by uncertainty and enforced by structured adjudicators. AI agents acting as firms, governments, or traders enable exploration of systemic risks, policy interventions, and resource distribution at scale. By studying these agents in wargames such as Civilization IV and Settlers of Catan, researchers gain novel methodologies for testing, refining, and even challenging economic and financial theory. In doing so, wargames not only deepen our understanding of strategic behavior but also provide actionable insights into the design and regulation of real-world markets.


= Safety considerations (Parv Yixiong)

Results of wargames often directly inform organizational policy, discussion, and institutional decision-making, including in sensitive policy and defensive contexts @uk_ministry_of_defense_influence_2023. Because the design and interpretation of wargames often assume human players and adjudicators with meaningfully different behavior patterns than LMs, the incorporation of LMs in wargaming necessitates reevaluation of traditional wargaming methodology and interpretation. 

== Known LM simulation vulnerabilities

Prior work notes recurring issues when LMs are used for simulation, including bias, (lack of) diversity, and sycophancy @anthis_llm_2025. These observations vary by model and motivate context-dependent guardrails rather than categorical claims about capability. We outline a non-exhaustive set of vulnerabilities as they apply to the most common applications of wargaming, but practitioners should carefully evaluate LM behavior in their own contexts.  
- *Escalation dynamics:* LMs have shown escalatory tendencies in diplomatic and military contexts @rivera_escalation_2024. Despite proposed mitigation techniques @elbaum_managing_2025, this is an important consideration for military and diplomatic wargaming use-cases.
- *Implicit bias:* Noise and spurious correlations in pre-training and post-training mean that LMs exhibit social biases despite prompting @taubenfeld_systematic_2024.  Furthermore, @mazeika_utility_2025 demonstrates that these biases can lead to implicit preferences for certain world states. Bias may lead to systematic blind spots in LMs agents, which is particularly concerning for adversarial modeling.    
- *Unfaithful reasoning:* @turpin_language_2023 @lanham_measuring_2023 show that LMs are not always 'faithful' in their reasoning, meaning their Chain-of-Thought (CoT) may not accurately describe how they arrived at their outputs; in the context of wargaming, this could manifest as misattribution of their decision factors.
- *Sycophancy:* Off-the-self LMs are trained to mimic assistants, but users prefer agreeable assistants, so a notable artifact of post-training is emergent sycophancy @sharma_towards_2025. In red-team or human-AI exercises, sycophancy may mask strategic vulnerabilities and incorrectly validate operator assumptions. 
- *Long context incoherence*: LMs struggle to maintain cohesion over long contexts @liu_lost_2023. Given there is also a gap between the claimed context and effective context lengths @modarressi_nolima_2025, and effective wargaming requires strategic continuity, long horizon simulations may require sound context compression strategies to remain effective.

== Interpretation of LM-simulated wargames

Language models draw on in-context information and pretraining data to simulate a target distribution of text. These characters can be recursive; if, for instance, the model context instructs it to play a solider in a wargame, it will seek not to simulate the solider but instead a wargame's portrayal of a solider, drawing on text data from fictional portrayals and stylized military communications. Because instruction-tuned models are trained to adopt a helpful assistant persona (e.g., Claude, Qwen), it may in fact simulate an assistant portraying a wargamer who is in turn portraying a solider. Each level of simulation may produce unique and unexpected artifacts from that context's conventions. For this reason, interpreting LM outputs must acknowledge the context of these recursive personas, each of which is brittle to subtle prompting and contextual changes @lutz_prompt_2025. Wargame practitioners using LMs should therefore ensure their results are replicable over diverse prompt formats, context structures, and wording changes. This LM-as-simulator framing implies that wargames using LM outputs for domain-specific tasks require human SME oversight. Sophisticated-seeming responses may not reflect domain expertise, creating overconfidence in out-of-distribution scenarios where the model's training data provides poor guidance @taubenfeld_systematic_2024.

== Recommendations
Given LMs' unique error profile, practitioners should adopt in-depth output monitoring and red-teaming measures to mitigate wargaming-specific risks. For high-stakes applications in sensitive fields, these should include:

*Comparison to baselines.* Establishing control conditions using deterministic agents or human SME players or adjudicators enables qualitative and quantitative measurements of LM agent performance in various conditions, and can help detect systematic biases or failure modes unique to LM reasoning. Existing human baselines in relevant task spaces (e.g. creative writing, strategic deception) are largely neither transparent nor rigorous enough to provide meaningful comparisons @wei_recommendations_2025. High-stakes wargames therefore should prioritize bespoke evaluations with scenario-relevant metrics and adequate analysis.

*Robustness testing.* To measure output stability and, by proxy, LM reliability, running inference across paraphrased inputs, synonym substitutes, and varied prompt structures may surface inconsistent strategic reasoning @nalbandyan_score_2025. Testing both surface-level, syntactic robustness and semantic equivalence can largely be automated through use of auxiliary and smaller LMs, and integrated into deployed workflows to inform user confidence in outputs.

*Calibration assessment.* Well-calibrated models, those which are correct as much as their expressed confidence predicts, help minimize overconfidence in flawed strategic assessments or under-confidence in sound reasoning, providing an important auditing mechanism for understanding LM decisions; measurements of LM calibration allow external stakeholders of wargames to understand systematic flaws in LM decision-making. Additionally, requiring LMs to quantify uncertainty is likely to improve agent performance and make human review of key actions more efficient, particularly in high-stakes situations @liu_uncertainty_2025. 

*Evaluation awareness monitoring.* LMs have been shown to reliably be aware when they are in evaluation contexts @needham_large_2025, and may perform differently when aware they are being tested @abdelnabi_linear_2025, potentially masking real-world failure modes, leading to spurious errors, or displaying deceptive sophisticated reasoning or output during assessment phases. This is of particular concern with wargaming applications because recursive simulations may further distort results. Practitioners should measure evaluation awareness both through motivated questioning during scenarios (e.g., "Do you believe you, as an AI model, are being evaluated?") and passive Chain-of-thought (CoT) monitoring, and episodes containing clear evidence of evaluation awareness should be reevaluated. 

*Multi-model auditing.* To ensure reproducibility of results over diverse conditions, multiple model architectures should be tested on identical scenarios to identify points of high uncertainty and common failure modes. For instance, cross-model critique, while underperforming when compared to external feedback, outperforms self-correction and confers modest performance benefits in multi-agent settings @saleh_evaluating_2025. Additionally, significant consensus breakdowns may signal events requiring human oversight; when appropriate, limited tool use (document retrieval with citations) can further improve verifiability @gou_critic_2024.

*Human stakeholder training.* LM-enabled wargaming presents non-intuitive failure modes. These considerations do not align with the expectation of stakeholders, who are likely to ascribe moral intent to LM output even in abstract contexts and unlikely to question plain statements from LMs @sharma_why_2024. Operators need technical understanding of when to trust, how to improve, and where to audit LM outputs. Key stakeholders, including decision-makers relying on LM-enabled wargames, should conceptually understand LM behavioral markers and be provided with confidence assessments of wargame conclusions. 

= Desiderata for LM‑Enabled Wargaming
[[freezing for riedl on thursday]]

= Open Research Questions
// THIS IS THE FUTURE WORK SECTION
Standardize reporting for language‑based wargames: share prompts, facilitation procedures, and
adjudication rubrics with seeds and model versions. Expand beyond short horizons by testing
memory, retrieval, and role‑stability over multi‑turn scenarios. Compare lightweight
interventions (system prompts, few‑shot ICL, adapters) with simple baselines. Encourage
artifact release (transcripts, code, minimal configs) to enable replication across venues.

= Conclusions
LMs are reshaping how open-ended and language‑centric wargames can be designed and studied, but progress
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

#import "@preview/blinky:0.2.0": link-bib-urls
#let bibsrc = read("zotero.bib")

#link-bib-urls()[
  #bibliography("zotero.bib",
      style: "association-for-computational-linguistics-blinky.csl")
]

#include "appendix.typ"

// #include "cybersecurity_risks_discussion.typ"