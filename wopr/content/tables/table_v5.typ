// ===== Appendix A: Selected AI in Wargames Papers (Title / Citation / Q) =====

// #set page(
//   paper: "a4",
//   margin: (left: 2.5cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm),
//   columns: 2
// )

#import "@preview/booktabs:0.0.4": toprule, midrule, bottomrule

// #set text(size: 9pt, lang: "en", hyphenate: true)

= Appendix A: Selected AI in Wargames Papers

#{
  // Title & Citation columns ragged-right for nicer wraps in a narrow measure.
  show table.cell.where(x: 1): set par(justify: false)
  // show table.cell.where(x: 2): set par(justify: false)

  // Quadrant palette (same scheme as before).
  let qcol = (
    "I":   rgb(0, 114, 178),
    "II":  rgb(230, 159, 0),
    "III": rgb(0, 158, 115),
    "IV":  rgb(204, 121, 167),
  )

  // Larger, centered badge (fixed size so it reads as an icon).
  let qtag(q) = box(
    width: 7.5mm,
    height: 4.2mm,
    fill: qcol.at(q).lighten(68%),
    radius: 2pt,
    stroke: none,
  )[
    #align(center)[ #text(size: 8pt, weight: "bold")[#q] ]
  ]

  table(
    columns: (1fr, 9mm),  // Title flex, Q narrow
    align: (left, center),
    inset: (x: 4pt, y: 2pt),
    column-gutter: 4pt,
    row-gutter: 0pt,
    stroke: none,

    toprule(),
    table.header(repeat: true)[*Title*][*Citation*][*Q*],
    midrule(),

    // ===== Rows (Title, Quadrant) =====
    ["A Land-Based War-Gaming Simulation Method Based on Multi-Agent Proximal Policy Optimization" @gao_land-based_2024], [#qtag("I")],
    ["Actor–critic-based decision-making method for the artificial intelligence commander in tactical wargames" @zhang_actorcritic-based_2022], [#qtag("II")],
    ["Adaptive Command: Real-Time Policy Adjustment via Language Models in StarCraft II" @ma_adaptive_2025], [#qtag("I")],
    ["Advancing AI Negotiations: New Theory and Evidence from an International AI Negotiation Competition" @vaccaro_advancing_2025], [#qtag("III")],
    ["Agent Exchange: Shaping the Future of AI Agent Economics" @yang_agent_2025], [#qtag("III")],
    ["Agents of Change: Self-Evolving LLM Agents for Strategic Planning" @belle_agents_2025], [#qtag("III")],
    ["AMONGAGENTS: Evaluating Large Language Models in the Interactive Text-Based Social Deduction Game" @chi_amongagents_2024], [#qtag("III")],
    ["An experiment in tactical wargaming with platforms enabled by artificial intelligence" @tarraf_experiment_2025], [#qtag("II")],
    ["Applying Deep Reinforcement Learning to Train AI Agents in a Wargaming Framework" @rinaudo_applying_2024], [#qtag("I")],
    ["Ares: A System-Oriented Wargame Framework for Adversarial ML" @ahmed_ares_2022], [#qtag("I")],
    ["AvalonBench: Evaluating LLMs Playing the Game of Avalon" @light_avalonbench_2023], [#qtag("III")],
    ["BALROG: Benchmarking Agentic LLM and VLM Reasoning On Games" @paglieri_balrog_2024], [#qtag("I")],
    ["BattleAgent: Multi-modal Dynamic Emulation on Historical Battles to Complement Historical Analysis" @lin_battleagent_2024], [#qtag("II")],
    ["BattleAgentBench: A Benchmark for Evaluating Cooperation and Competition Capabilities of Language Models in Multi-Agent Systems" @wang_battleagentbench_2024], [#qtag("I")],
    ["Battlefield information and tactics engine (BITE): a multimodal large language model approach for battlespace management" @connolly_battlefield_2024], [#qtag("III")],
    ["Can Large Language Models Play Games? A Case Study of A Self-Play Approach" @guo_can_2024], [#qtag("I")],
    ["Chess AI: Competing Paradigms for Machine Intelligence" @maharaj_chess_2022], [#qtag("I")],
    ["ChessGPT: Bridging Policy Learning and Language Modeling" @feng_chessgpt_2023], [#qtag("I")],
    ["CivRealm: A Learning and Reasoning Odyssey in Civilization for Decision-Making Agents" @qi_civrealm_2024], [#qtag("I")],
    ["Collaboration and Confrontation in Avalon Gameplay" @lan_llm-based_2024], [#qtag("III")],
    ["Debt Collection Negotiations with Large Language Models" @wang_debt_2025], [#qtag("III")],
    ["Democratizing Diplomacy: A Harness for Evaluating Any Large Language Model on Full-Press Diplomacy" @duffy_democratizing_2025], [#qtag("III")],
    ["Developing Combat Behavior through Reinforcement Learning in Wargames and Simulations" @boron_developing_2020], [#qtag("I")],
    ["Digital Player: Evaluating Large Language Models based Human-like Agent in Games" @wang_digital_2025], [#qtag("III")],
    ["Diversifying AI: Towards Creative Chess with AlphaZero" @zahavy_diversifying_2024], [#qtag("I")],
    ["DSGBench: A Diverse Strategic Game Benchmark for Evaluating LLM-based Agents in Complex Decision-Making Environments" @tang_dsgbench_2025], [#qtag("III")],
    ["Dungeons and Dragons as a Dialogue Challenge for Artificial Intelligence" @callison-burch_dungeons_2022], [#qtag("III")],
    ["EAI: Emotional Decision-Making of LLMs in Strategic Games and Ethical Dilemmas" @mozikov_eai_2025], [#qtag("III")],
    ["Encouraging Divergent Thinking in Large Language Models through Multi-Agent Debate" @liang_encouraging_2024], [#qtag("IV")],
    ["Escalation Risks from Language Models in Military and Diplomatic Decision-Making" @rivera_escalation_2024], [#qtag("II")],
    ["Evaluating LLM Agent Collusion in Double Auctions" @agrawal_evaluating_2025], [#qtag("III")],
    ["Experimental wargames to address the complexity: scarcity gap" @lakkaraju_experimental_2020], [#qtag("II")],
    ["Exploration of Wargaming and AI Applications in Military Decision-Making" @li_exploration_2025], [#qtag("I")],
    ["Finding deceivers in social context with large language models: the case of the Mafia game" @yoo_finding_2024], [#qtag("III")],
    ["FishBargain: An LLM-Empowered Bargaining Agent for Online Flea-Market Platform Sellers" @kong_fishbargain_2025], [#qtag("III")],
    ["Game Reasoning Arena: A Framework and Benchmark for Assessing Reasoning Capabilites of Large Language Models via Game Play" @cipolina-kun_game_2025], [#qtag("I")],
    ["Game Theory Approach to Identifying Deception in Large Language Models" @maggio_game_2024], [#qtag("I")],
    ["GameBench: Evaluating Strategic Reasoning Abilities of LLM Agents" @costarelli_gamebench_2024], [#qtag("I")],
    ["Game-Theoretic LLM: Agent Workflow for Negotiation Games" @hua_game-theoretic_2024], [#qtag("I")],
    ["HARBOR: Exploring Persona Dynamics in Multi-Agent Competition" @jiang_harbor_2025], [#qtag("III")],
    ["Harnessing Language for Coordination: A Framework and Benchmark for LLM-Driven Multi-Agent Control" @anne_harnessing_2025], [#qtag("I")],
    ["Hierarchical control of multi-agent reinforcement learning team in real-time strategy (RTS) games" @zhou_hierarchical_2021], [#qtag("I")],
    ["Human vs. Machine: Behavioral Differences Between Expert Humans and Language Models in Wargame Simulations" @lamparth_human_2024], [#qtag("III")],
    ["Human-level play in the game of Diplomacy by combining language models with strategic reasoning" @meta_fundamental_ai_research_diplomacy_team_human-level_2022], [#qtag("III")],
    ["Intelligent Decision-Making and Human Language Communication Based on Deep Reinforcement Learning in a Wargame Environment" @sun_intelligent_2023], [#qtag("I")],
    ["Intuitionistic Fuzzy MADM in Wargame Leveraging With Deep Reinforcement Learning" @sun_intuitionistic_2024], [#qtag("I")],
    ["It Takes Two to Negotiate: Modeling Social Exchange in Online Multiplayer Games" @jaidka_it_2023], [#qtag("III")],
    ["Large Language Models in Wargaming: Methodology, Application, and Robustness" @chen_large_2024], [#qtag("IV")],
    ["Large Language Models on the Chessboard: A Study on ChatGPT's Formal Language Comprehension and Complex Reasoning Skills" @kuo_large_2023], [#qtag("I")],
    ["Large Language Models Play StarCraft II: Benchmarks and A Chain of Summarization Approach" @ma_large_2024], [#qtag("I")],
    ["Learning from Synthetic Labs: Language Models as Experimental Subjects in Auctions" @shah_learning_2025], [#qtag("III")],
    ["Learning to Play No-Press Diplomacy with Best Response Policy Iteration" @anthony_learning_2022], [#qtag("I")],
    ["Leveraging Generative AI to Create Lightweight Simulations for Far-Future Autonomous Teammates" @flathmann_leveraging_2025], [#qtag("I")],
    ["LLM-Based Agent Society Investigation: Collaboration and Confrontation in Avalon Gameplay" @lan_llm-based_2024], [#qtag("I")],
    ["LLMs of Catan: Exploring Pragmatic Capabilities of Generative Chatbots" @martinenghi-etal-2024-llms], [#qtag("III")],
    ["Maia-2: A Unified Model for Human-AI Alignment in Chess" @tang_maia-2_2024], [#qtag("I")],
    ["Managing Escalation in Off-the-Shelf Large Language Models" @elbaum_managing_2025], [#qtag("IV")],
    ["Mastering the Digital Art of War: Developing Intelligent Combat Simulation Agents for Wargaming Using Hierarchical Reinforcement Learning" @black_mastering_2024], [#qtag("I")],
    ["Mastering the Game of No-Press Diplomacy via Human-Regularized Reinforcement Learning and Planning" @bakhtin_mastering_2022], [#qtag("I")],
    ["Mastering the Game of Stratego with Model-Free Multiagent Reinforcement Learning" @perolat_mastering_2022], [#qtag("I")],
    ["Measuring Free-Form Decision-Making Inconsistency of Language Models in Military Crisis Simulations" @shrivastava_measuring_2024], [#qtag("III")],
    ["Microscopic Analysis on LLM Players via Social Deduction Game" @kim_microscopic_2024], [#qtag("III")],
    ["Modeling fog of war effects in AFSIM" @tryhorn_modeling_2023], [#qtag("I")],
    ["More Victories, Less Cooperation: Assessing Cicero's Diplomacy Play" @wongkamjan_more_2024], [#qtag("III")],
    ["Multiattribute Decision-Making in Wargames Leveraging the Entropy–Weight Method in Conjunction With Deep Reinforcement Learning" @xue_multiattribute_2024], [#qtag("I")],
    ["MultiMind: Enhancing Werewolf Agents with Multimodal Memory" @zhang_multimind_2025], [#qtag("III")],
    ["Naval Wargame Prototyping: Multiplayer Real-Time Strategy Game Simulation Using Unreal Engine" @chavanit_naval_2023], [#qtag("I")],
    ["Negotiation and honesty in artificial intelligence methods for the board game of Diplomacy" @kramar_negotiation_2022], [#qtag("III")],
    ["No Press Diplomacy: Modeling Multi-Agent Gameplay" @paquette_no_2019], [#qtag("I")],
    ["Open-Ended Wargames with Large Language Models" @hogan_open-ended_2024], [#qtag("IV")],
    ["Outwit, Outplay, Out-Generate: A Framework for Designing Strategic Generative Agents in Competitive Environments" @thudium_outwit_2025], [#qtag("IV")],
    ["Playing a Strategy Game with Knowledge-Based Reinforcement Learning" @voss_playing_2020], [#qtag("I")],
    ["Playing Games With GPT: What Can We Learn About a Large Language Model From Canonical Strategic Games?" @brookins_playing_2023], [#qtag("I")],
    ["Playing repeated games with large language models" @akata_playing_2025], [#qtag("III")],
    ["PokeLLMon: A Human-Parity Agent for Pokemon Battles with Large Language Models" @hu_pokellmon_2024], [#qtag("I")],
    ["Project Sid: Many-agent simulations toward AI civilization" @al_project_2024], [#qtag("I")],
    ["Recurrent MADDPG for Object Detection and Assignment in Combat Tasks" @wei_recurrent_2020], [#qtag("I")],
    ["Research on Wargame Decision-Making Method Based on Multi-Agent Deep Deterministic Policy Gradient" @yu_research_2023], [#qtag("I")],
    ["Richelieu: Self-Evolving LLM-Based Agents for AI Diplomacy" @guan_richelieu_2024], [#qtag("III")],
    ["SC2Arena and StarEvolve: Benchmark and Self-Improvement Framework for LLMs in Complex Decision-Making Tasks" @shen_sc2arena_2025], [#qtag("I")],
    ["Scaling Laws For Scalable Oversight" @engels_scaling_2025], [#qtag("IV")],
    ["SC-Phi2: A Fine-tuned Small Language Model for StarCraft II Macromanagement Tasks" @khan_sc-phi2_2024], [#qtag("I")],
    ["Self Generated Wargame AI: Double Layer Agent Task Planning Based on Large Language Model" @sun_self_2023], [#qtag("I")],
    ["Self Generated Wargame AI: Double Layer Agent Task Planning Based on Large Language Model" @sun_self_2023], [#qtag("III")],
    ["Shall We Team Up: Exploring Spontaneous Cooperation of Competing LLM Agents" @wu_shall_2024], [#qtag("I")],
    ["Should I Trust You? Detecting Deception in Negotiations using Counterfactual RL" @wongkamjan_should_2025], [#qtag("III")],
    ["SPIN-Bench:  How Well Do LLMs Plan Strategically and Reason Socially?" @yao_spin-bench_2025], [#qtag("III")],
    ["Strategic behavior of large language models and the role of game structure versus contextual framing" @lore_strategic_2024], [#qtag("I")],
    ["Strategy-Augmented Planning for Large Language Models via Opponent Exploitation" @xu_strategy-augmented_2025], [#qtag("I")],
    ["Super-additive Cooperation in Language Model Agents" @tonini_super-additive_2025], [#qtag("III")],
    ["SwarmBrain: Embodied agent for real‑time strategy game StarCraft II via large language models." @shao_swarmbrain_2024], [#qtag("I")],
    ["The Automated but Risky Game: Modeling Agent-to-Agent Negotiations and Transactions in Consumer Markets" @zhu_automated_2025], [#qtag("I")],
    ["The Surprising Effectiveness of PPO in Cooperative Multi-Agent Games" @yu_surprising_2022], [#qtag("I")],
    ["The Traitors: Deception and Trust in Multi-Agent Language Systems" @curvo_traitors_2025], [#qtag("III")],
    ["Tracing LLM Reasoning Processes with Strategic Games: A Framework for Planning, Revision, and Resource-Constrained Decision Making" @yuan_tracing_2025], [#qtag("I")],
    ["War and Peace (WarAgent): Large Language Model-based Multi-Agent Simulation of World Wars" @hua_war_2024], [#qtag("II")],
    ["Welfare Diplomacy: Benchmarking Language Model Cooperation" @mukobi_welfare_2023], [#qtag("I")],
    ["What if LLMs Have Different World Views: Simulating Alien Civilizations with LLM-based Agents" @xue_what_2025], [#qtag("IV")],
    ["When Two LLMs Debate, Both Think They'll Win" @prasad_when_2025], [#qtag("IV")],
    ["Rethinking Adversarial Examples in Wargames" @chen_rethinking_2022], [#qtag("I")],

    bottomrule(),
  )
}
// #block(fill: luma(230), inset: 8pt, radius: 4pt)[
//   stack(spacing: 3pt, align: top)[
//     text(size: 9pt)[*Table 1 Legend*],
//     text(size: 8pt)[*Total papers: 100*],
//     text(size: 8pt, fill: color.navy)["Quadrant I: 52"],
//     text(size: 8pt, fill: color.yellow)["Quadrant II: 6"],
//     text(size: 8pt, fill: color.eastern)["Quadrant III: 34"],
//     text(size: 8pt, fill: color.red)["Quadrant IV: 8"],
//   ]
// ]
#block(
  fill: luma(180),
  inset: 8pt,
  radius: 8pt,

  stack(
    spacing: 3pt,
    text(size: 9pt)[*Table 1 Legend*],
    text(size: 8pt)[*Total papers: 100*],
    text(size: 8pt, fill: color.navy)[Quadrant I: 52],
    text(size: 8pt, fill: color.yellow)[Quadrant II: 6],
    text(size: 8pt, fill: color.eastern)[Quadrant III: 34],
    text(size: 8pt, fill: color.red)[Quadrant IV: 8],
    // text(size: 8pt, fill: color.linear-rgb(#0172B2))[Quadrant I: 52],
    // text(size: 8pt, fill: color.linear-rgb(#E69F01))[Quadrant II: 6],
    // text(size: 8pt, fill: color.linear-rgb(#009E73))[Quadrant III: 34],
    // text(size: 8pt, fill: color.linear-rgb(#C97BA6))[Quadrant IV: 8],
  ),
)


