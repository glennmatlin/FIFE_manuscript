#import "../config.typ":num_papers
= Discussion
(TODO: use a better lead in here ie this section is for... etc one sentence needed )
Using our research catalog we investigate each individual domain and analyzed the design choices to provide AI researchers an overview of (TODO: need to summarize what kind of things we overview here like "we overview X, Y, and Z"
// old text: what evidence or justification is required, the level of human facilitation, and how conflicts are adjudicated.

== Military Security
// [battlefield/material focused wargames vs diplomacy we can leave diplomatic aspects of military wargames to next section to avoid overlap, can mention] - isaac

== International Relations
International Relations (IR) wargaming centers on language, signaling, and credibility rather than material force, and is used for communication, negotiation, and diplomacy. Open‑ended, argument‑driven formats (seminar, matrix) capture how positions evolve through persuasion, norm invocation, and threat–promise exchanges across multiple stakeholders (e.g., national states, non-government or industrial organizations). When LMs participate, their value is in maintaining coherent narratives over long horizons, proposing plausible options under contested facts, helping surface implicit assumptions in briefs and communiqués, processing scenarios, and aiding with adjudication on non-analytical rubrics and procedures.\
In a similar manner to how wargames are used extensively by the officer corps of a military, wargames are commonplace among IR professionals. Wargames present an opportunity for experiential learning for diplomatic training. Wargames are used both to support training and development, and to analyze and gain a deeper understanding of diplomatic crises that were previously unseen or extremely infrequent (i.e., nuclear crises). @reddie_evidence_2023 @hersman_under_2020 @worman_designing_2023

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

== Medicine and Public Health
(TODO: Dark winter and other wargames)
// todo: ask parv|yixiong 