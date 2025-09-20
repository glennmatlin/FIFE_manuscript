#import "../config.typ":num_papers

// NOTES: We are redoing this part. If it is 3 AM and this is still here, ping Glenn.


// We talk about the current work in each domain of Q4 wargames. then, we say something like "in general, all the stuff in [DOMAIN] has xyz charecteristics. this is interesting because XYZ."

/** PARV NOTES START 
// 1st para: motivation. 2nd para: work

// open a new view, look at all the q4 stuff and categorize naturally 

PARV SCRATCH END **/



/**

== Analysis of Q4 (qualitative)

((RIEDL: I'm not sure why this has to be a separate section from 4.4. If things get complex to read, then 4.5 and 4.6 could be 4.4.1 and 4.4.2.))

here, we talk about the papers in q4 only and characterize them

// riedl: we should explicitly have a section on research problems and what can be learned by working on those.
// real time multi agent planning -- mech interpretability -- avoiding bias and echo chambers

// riedl: have a statement at some point where you could focus on anyone of these individual problems, but these games give opportunities to do many things at once and measure interactions. Q4 can solve the problem by avoiding the silos, explaining how the systems interact etc.


= Discussion
This section synthesizes key design principles for developing and evaluating LM-driven agents in open-ended wargames. Drawing from our comprehensive survey, we distill a set of core methodological considerations—such as turn structure, evidence requirements, human facilitation, and adjudication protocols—that influence the validity and analytical utility of language-based strategic simulations @robinson_stride_2018. We then contextualize these principles within specific domains to provide actionable guidance for researchers.

== Military and National Security
// [battlefield/material focused wargames vs diplomacy we can leave diplomatic aspects of military wargames to next section to avoid overlap, can mention] - isaac
At the time of writing, numerous national military and security organizations are actively exploring how they can use AI to provide experiential learning and potentially establish a strategic advantage through superior decision-making and judgment @black_scaling_2024. We have observed how both military SMEs and academic researchers are currently investigating how LMs can be used to help AI act as players and adjudicators in open-ended wargames @black_mastering_2024 @griffin_matrix_2024. This news comes at a time when the safety-critical nature of these systems is of high importance and is receiving considerable attention. However, there is not currently a resource to help bridge the understanding gap between AI researchers and SMEs for this domain. We believe that non-military scientists and academics have a major role to play in the effectiveness and alignment of AI systems, particularly those in safety-critical settings. \


Because wargames offer humans a simplified mental model that allows them to abstract away particulars and navigate decision-making and analyze the results @us_naval_war_college_fundamentals_1966 @usarmywarcollege_StrategicWargamingHandbook_2015, they have been used in education and training, particularly in military contexts @us_naval_war_college_war_2015 @deutschland_bundeswehr_wargaming_2017 @ukministryofdefense_WargamingHandbook_2017 @ukministryofdefense_WargamingHandbook_2017 @croatian_military_academy_introduction_2019 @australianarmedforces_WargamingHandbook_2022 @polish_armed_forces_wargaming_2022 @us_army_how_2023 @nato_wargaming_2023 @french_ministry_of_the_armed_forces_wargaming_2024

== International Relations
International Relations (IR) wargaming centers on language, signaling, and credibility rather than material force, and is used for communication, negotiation, and diplomacy. Open‑ended, argument‑driven formats (seminar, matrix) capture how positions evolve through persuasion, norm invocation, and threat–promise exchanges across multiple stakeholders (e.g., national states, non-government or industrial organizations) @mans_training_2010 @schechter_wargaming_2021 @lin-greenberg_wargaming_2022. When LMs participate, their value is in maintaining coherent narratives over long horizons, proposing plausible options under contested facts, helping surface implicit assumptions in briefs and communiqués, processing scenarios, and aiding with adjudication on non-analytical rubrics and procedures.
In a similar manner to how wargames are used extensively by the officer corps of a military, wargames are commonplace among IR professionals. Wargames present an opportunity for experiential learning for diplomatic training. Wargames are used both to support training and development, and to analyze and gain a deeper understanding of diplomatic crises that were previously unseen or extremely infrequent (i.e., nuclear crises). @hersman_under_2020 @lin-greenberg_wargaming_2022 @reddie_evidence_2023 @worman_designing_2023

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
// @resende_CriticalSuccessFactors_2018
// @scherpereel_changing_2005
// @scherpereel_decision_2005
// @scherpereel_impact_2003
// @schwarz_BusinessWargamingTeaching_2013
// @schwarz_CombiningScenarioPlanning_2019
In business and organizational contexts, wargaming draws on competitive strategy (Porter) and scenario planning to stress‑test hypotheses under adversarial dynamics, market shifts, and policy shocks. Seminar‑style sessions often combine narrative role‑play (competitor, regulator, customer) with structured turns where teams propose moves (pricing, product launch, alliances) and facilitators adjudicate based on feasibility and consistency. Unlike fully quantitative strategy simulators, these games emphasize qualitative reasoning, internal alignment, and the articulation of assumptions.\
When LMs participate, their chief value is speed and breadth in ideation (enumerating strategic options), drafting memos or internal communications in given styles, and probing counterfactuals (“what would a rational competitor do if…”). However, ungrounded extrapolations are a risk; prompts must enforce evidence requirements: claims must cite assumptions, external signals, or benchmarks @wheaton_making_2020. Adjudication blends simple quantitative checks (unit economics, capacity) with narrative plausibility. LMs can draft memos, scenario briefs, or stakeholder analyses conditioned on constraints (budget, brand voice, compliance) and can help enumerate second‑order effects, but human facilitators keep realism and ethics in scope.

For organizational adoption, reproducibility and governance are key. Keep minimal artifacts (scenario text, prompts, seeds, facilitation script), log model/version and any tool use (RAG, calculators), and separate confidential data from public scaffolds. Typical evaluation rubrics emphasize clarity of reasoning, sensitivity analysis (what if X changes), and decision traceability. Sharing sanitized transcripts and prompt scaffolds accelerates reuse across teams while protecting proprietary details.

== Economics and Finance
Wargames can be powerful tools for modeling and studying economics and finance. Games such as Civilization IV provide synthetic environments that mirror the fundamental structures of economic systems, requiring players to allocate resources, manage cities, and balance immediate needs against long-term growth. Each decision embodies core economic concepts—opportunity cost, inflation, deficit spending—where constraints shape strategy and outcomes. Unlike abstract models, wargames simulate emergent market behaviors through the interactions of both human players and AI agents. This makes them valuable laboratories for applied economics, enabling researchers to test economic theories under controlled yet dynamic conditions.

Finance, too, is inherently adversarial and strategic: firms compete for market share, governments set monetary policy, and traders react to limited information. Wargames replicate these dynamics through embedded markets, trade routes, and investment decisions, where each choice has lasting consequences. In Civilization IV, for example, controlling strategic resources functions like commodity market dominance, while trade agreements resemble bilateral contracts. Deploying AI agents in such settings allows economics and finance researchers to observe strategies of collusion, innovation, and predatory expansion under dynamic conditions. This creates an experimental platform for studying algorithmic pricing, market shocks, and competitive equilibria without real-world risk.

Other games, such as Settlers of Catan, also provide valuable macro-scale models of cooperation, conflict, and uncertainty. In Catan, players act as economic agents competing to expand while relying on negotiation and trade to succeed. This interplay mirrors real-world markets where competition and collaboration coexist. Uncertainty introduced by dice rolls and development cards forces adaptive decision-making, risk assessment, and learning under partial observability—core challenges in modern economic and policy processes. Negotiation, bluffing, and persuasion make Catan especially relevant as a testbed for AI agents, encouraging the study of advanced dialogue, bargaining tactics, and emergent strategic behaviors.

Through experimentation with AI in wargames, the fields of economics and finance can move beyond static theoretical models toward dynamic environments governed by uncertainty and enforced by structured adjudicators. AI agents acting as firms, governments, or traders enable exploration of systemic risks, policy interventions, and resource distribution at scale. By studying these agents in wargames such as Civilization IV and Settlers of Catan, researchers gain novel methodologies for testing, refining, and even challenging economic and financial theory. In doing so, wargames not only deepen our understanding of strategic behavior but also provide actionable insights into the design and regulation of real-world markets.

== Medicine and Public Health
Wargaming is not limited to military and geopolitical conflicts. It has also been used to great effect in the fields of medicine and public health to prepare for and respond to health crises. A prominent example is the "Dark Winter" exercise, a 2001 simulation of a smallpox attack on the United States, which highlighted critical deficiencies in the nation's preparedness for a bioterrorist attack.

Following the precedent of "Dark Winter", numerous other wargames and simulation exercises have been conducted to address a variety of public health challenges. These exercises, often referred to as tabletop exercises (TTXs) or drills, are crucial tools for testing emergency plans, training personnel, and improving coordination between different agencies. For instance, "Event 201" simulated a global pandemic to identify and address the economic and societal challenges it would pose. These simulations have proven invaluable in preparing for real-world events like the COVID-19 pandemic, allowing policymakers and healthcare professionals to rehearse their responses in a controlled environment @smith_serious_2020.
