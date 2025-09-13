/*
== Military and National Security
// [battlefield/material focused wargames vs diplomacy we can leave diplomatic aspects of military wargames to next section to avoid overlap, can mention] - isaac
At the time of writing, numerous national military and security organizations are actively exploring how they can use AI to provide experiential learning and potentially establish a strategic advantage through superior decision-making and judgment @black_scaling_2024. We have observed how both military SMEs and academic researchers are currently investigating how LMs can be used to help AI act as players and adjudicators in open-ended wargames @black_mastering_2024 @griffin_matrix_2024. This news comes at a time when the safety-critical nature of these systems is of high importance and is receiving considerable attention. However, there is not currently a resource to help bridge the understanding gap between AI researchers and SMEs for this domain. We believe that non-military scientists and academics have a major role to play in the effectiveness and alignment of AI systems, particularly those in safety-critical settings. 


Because wargames offer humans a simplified mental model that allows them to abstract away particulars and navigate decision-making and analyze the results @us_naval_war_college_fundamentals_1966 @us_army_war_college_strategic_2015, they have been used in education and training, particularly in military contexts @us_naval_war_college_war_2015 @deutschland_bundeswehr_wargaming_2017 @uk_ministry_of_defense_wargaming_2017 @uk_ministry_of_defense_wargaming_2017 @croatian_military_academy_introduction_2019 @australian_armed_forces_wargaming_2022 @polish_armed_forces_wargaming_2022 @us_army_how_2023 @nato_wargaming_2023 @french_ministry_of_the_armed_forces_wargaming_2024

== International Relations
International Relations (IR) wargaming centers on language, signaling, and credibility rather than material force, and is used for communication, negotiation, and diplomacy. Open‑ended, argument‑driven formats (seminar, matrix) capture how positions evolve through persuasion, norm invocation, and threat–promise exchanges across multiple stakeholders (e.g., national states, non-government or industrial organizations) @mans_training_2010 @schechter_wargaming_2021 @lin-greenberg_wargaming_2022. When LMs participate, their value is in maintaining coherent narratives over long horizons, proposing plausible options under contested facts, helping surface implicit assumptions in briefs and communiqués, processing scenarios, and aiding with adjudication on non-analytical rubrics and procedures.
In a similar manner to how wargames are used extensively by the officer corps of a military, wargames are commonplace among IR professionals. Wargames present an opportunity for experiential learning for diplomatic training. Wargames are used both to support training and development, and to analyze and gain a deeper understanding of diplomatic crises that were previously unseen or extremely infrequent (i.e., nuclear crises). @hersman_under_2020 @lin-greenberg_wargaming_2022 @reddie_evidence_2023 @worman_designing_2023

Compared with military applications, diplomatic games emphasize incomplete and asymmetric information, face‑saving, issue linkage (security tied to trade, technology, or climate), and a shift away from material forces towards abstracted interests. Facilitation and adjudication must account for audience costs, domestic politics, and path dependence across rounds. LMs can assist by drafting position papers, back‑channel messages, or press releases in different registers, while humans retain control of red lines, escalation ladders, and legitimacy constraints.
Practical design choices that matter include: clear turn structure (front‑channel vs. back‑channel), explicit rules for information sharing and leaks, and rubrics that reward consistency and coalition‑building rather than only “wins.” Artifact capture (transcripts, proposals, dissent notes) is crucial for after‑action learning. Reproducibility improves when scenarios, prompts, and adjudication criteria are shared alongside model/version information.
IR professionals in particular benefit from wargaming because of its creative and non-analytical structure. With subjective rubrics and emphasis on cooperation and social interactions, innovative players and adjudications are nearly necessary and alleviate human cost from traditional executions of diplomatic wargames with human players and computers, whether it is through fully autonomous or human-aided.

== Social Games
While wargames may require social reasoning (e.g., using deduction, persuasion, or deception), not all social games are wargames. Creative wargames often require deception, but that is not the primary objective; it is instead a method for reaching that goal. Wargames require agents to pursue defined goals through planning and decision-making within a structured conflict environment. In contrast, social deduction games are centered around identity discovery and psychological misdirection, making them categorically distinct. This distinction is critical for evaluating LMs in open-ended scenarios, as social deduction games test their ability to navigate dynamic, multi-agent interactions involving trust and deception @chi_amongagents_2024.

Psychological misdirection is prolific in warfare, however, and history is rife with examples of cunning tacticians using it with great success. As the Chinese military strategist Sun Tzu famously wrote, _"All warfare is based on deception,"_ @sun_art_1910 exemplified by tactics like the Trojan Horse, the Empty Fort Strategy, and Hannibal’s crossing of the Alps to outmaneuver Roman forces through strategic diversions. For this literature review, social deduction games represent a complementary effort to wargames, as their focus on harnessing psychological misdirection in game scenarios can enhance LMs’ performance in real-life contexts where information may be unreliable, mislabeled, or intentionally deceptive @maggio_game_2024 @lamparth_human_2024. By studying LMs in these settings, researchers can improve their adaptability to ambiguous, deception‑heavy scenarios critical to both wargaming and broader AI applications.

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

Effective formats combine structured turns (brief → move → challenge → adjudication) with qualitative evidence requirements: claims must cite assumptions, external signals, or benchmarks @wheaton_making_2020. Adjudication blends simple quantitative checks (unit economics, capacity) with narrative plausibility. LMs can draft memos, scenario briefs, or stakeholder analyses conditioned on constraints (budget, brand voice, compliance) and can help enumerate second‑order effects, but human facilitators keep realism and ethics in scope.

For organizational adoption, reproducibility and governance are key. Keep minimal artifacts (scenario text, prompts, seeds, facilitation script), log model/version and any tool use (RAG, calculators), and separate confidential data from public scaffolds. Typical evaluation rubrics emphasize clarity of reasoning, sensitivity analysis (what if X changes), and decision traceability. Sharing sanitized transcripts and prompt scaffolds accelerates reuse across teams while protecting proprietary details.

== Medicine and Public Health
Wargaming is not limited to military and geopolitical conflicts. It has also been used to great effect in the fields of medicine and public health to prepare for and respond to health crises. A prominent example is the "Dark Winter" exercise, a 2001 simulation of a smallpox attack on the United States, which highlighted critical deficiencies in the nation's preparedness for a bioterrorist attack.

Following the precedent of "Dark Winter", numerous other wargames and simulation exercises have been conducted to address a variety of public health challenges. These exercises, often referred to as tabletop exercises (TTXs) or drills, are crucial tools for testing emergency plans, training personnel, and improving coordination between different agencies. For instance, "Event 201" simulated a global pandemic to identify and address the economic and societal challenges it would pose. These simulations have proven invaluable in preparing for real-world events like the COVID-19 pandemic, allowing policymakers and healthcare professionals to rehearse their responses in a controlled environment @smith_serious_2020.

== Human-Agent Interactions (HAI) vs Agent-Agent Interactions (A2A)
Especially in the areas of Diplomacy and highly creative agents, previous research leans toward Human–Agent Interactions (HAI) with emphasis on emulating or integrating with human diplomatic behavior. Often it is a single AI agent interacting with a group of human players, as seen typically in AI research with _Diplomacy_. With diplomacy and collaboration being the focus, the state of the game strongly encourages AI agents to adopt the social language of the rest of the players. Such research is often conducted through random games on online platforms with text‑based communications, and mostly without the human users being strongly informed of the presence of the AI agent on the platform, let alone that they are playing against an AI agent. The focus is often on how AI interacts compared to human diplomatic strategies as the primary benchmark, with the target of human‑like behavior, and evaluated on performance against humans. 

However, agent–agent interaction (A2A) is increasingly important as agentic AI proliferates in
practice, including organizational and enterprise contexts. Conflicts between multiple agentic
systems will differ from HAI dynamics. Much prior work studies cooperative tasks or MoE
coordination; competitive diplomatic A2A remains sparse. Human‑likeness, a common HAI
benchmark, may not translate to A2A settings with different equilibria and strategies.
*/