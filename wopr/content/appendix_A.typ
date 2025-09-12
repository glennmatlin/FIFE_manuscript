#import "../config.typ":num_papers
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

