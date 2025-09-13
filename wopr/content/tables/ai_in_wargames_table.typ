// ===== Table of Selected AI in Wargames Papers (2 columns: Title, Q) =====

#set page(
  paper: "a4",
  margin: (left: 2.5cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm),
  columns: 2
)

// #set text(font: "Times New Roman", size: 11pt)

= Appendix A: Selected AI in Wargames Papers

// The table is in normal flow (no #place / no float).
// It will break across columns and pages; header repeats automatically.
#set text(size: 8pt)
#table(
  columns: (2.8fr, 0.8cm),
  align: (left, center),
  stroke: 0.5pt + gray,
  inset: 3pt,

  // Header (repeats on breaks)
  table.header(
    [*Paper Title*],
    [*Q*],
  ),

  ["A Land-Based War-Gaming Simulation Method Based on Multi-Agent Proximal Policy Optimization" gao_land-based_2024],
  [I],

  ["Adaptive Command: Real-Time Policy Adjustment via Language Models in StarCraft II" ma_adaptive_2025],
  [I],

  ["Ares: A System-Oriented Wargame Framework for Adversarial ML" ahmed_ares_2022],
  [I],

  ["BALROG: Benchmarking Agentic LLM and VLM Reasoning On Games" paglieri_balrog_2024],
  [I],

  ["BattleAgentBench: A Benchmark for Evaluating Cooperation and Competition Capabilities of Language Models in Multi-Agent Systems" wang_battleagentbench_2024],
  [I],

  ["Can Large Language Models Play Games? A Case Study of A Self-Play Approach" guo_can_2024],
  [I],

  ["Chess AI: Competing Paradigms for Machine Intelligence" maharaj_chess_2022],
  [I],

  ["ChessGPT: Bridging Policy Learning and Language Modeling" feng_chessgpt_2023],
  [I],

  ["CivRealm: A Learning and Reasoning Odyssey in Civilization for Decision-Making Agents" qi_civrealm_2024],
  [I],

  ["Diversifying AI: Towards Creative Chess with AlphaZero" zahavy_diversifying_2024],
  [I],

  ["Exploration of Wargaming and AI Applications in Military Decision-Making" li_exploration_2025],
  [I],

  ["Game Reasoning Arena: A Framework and Benchmark for Assessing Reasoning Capabilites of Large Language Models via Game Play" cipolina-kun_game_2025],
  [I],

  ["Game Theory Approach to Identifying Deception in Large Language Models" maggio_game_2024],
  [I],

  ["Game-Theoretic LLM: Agent Workflow for Negotiation Games"],
  [I],

  ["GameBench: Evaluating Strategic Reasoning Abilities of LLM Agents" costarelli_gamebench_2024],
  [I],

  ["Harnessing Language for Coordination: A Framework and Benchmark for LLM-Driven Multi-Agent Control"],
  [I],

  ["Hierarchical control of multi-agent reinforcement learning team in real-time strategy (RTS) games" zhou_hierarchical_2021],
  [I],

  ["LLM-Based Agent Society Investigation: Collaboration and Confrontation in Avalon Gameplay" lan_llm-based_2024],
  [I],

  ["Large Language Models Play StarCraft II: Benchmarks and A Chain of Summarization Approach" ma_large_2024],
  [I],

  ["Large Language Models on the Chessboard: A Study on ChatGPT's Formal Language Comprehension and Complex Reasoning Skills" kuo_large_2023],
  [I],

  ["Learning to Play No-Press Diplomacy with Best Response Policy Iteration" anthony_learning_2022],
  [I],

  ["Leveraging Generative AI to Create Lightweight Simulations for Far-Future Autonomous Teammates"],
  [I],

  ["Maia-2: A Unified Model for Human-AI Alignment in Chess" tang_maia-2_2024],
  [I],

  ["Mastering the Digital Art of War: Developing Intelligent Combat Simulation Agents for Wargaming Using Hierarchical Reinforcement Learning" black_mastering_2024],
  [I],

  ["Mastering the Game of No-Press Diplomacy via Human-Regularized Reinforcement Learning and Planning" bakhtin_mastering_2022],
  [I],

  ["Mastering the Game of Stratego with Model-Free Multiagent Reinforcement Learning" perolat_mastering_2022],
  [I],

  ["No Press Diplomacy: Modeling Multi-Agent Gameplay" paquette_no_2019],
  [I],

  ["Playing Games With GPT: What Can We Learn About a Large Language Model From Canonical Strategic Games?"],
  [I],

  ["Playing a Strategy Game with Knowledge-Based Reinforcement Learning" voss_playing_2020],
  [I],

  ["PokeLLMon: A Human-Parity Agent for Pokemon Battles with Large Language Models"],
  [I],

  ["Project Sid: Many-agent simulations toward AI civilization"],
  [I],

  ["Research on Wargame Decision-Making Method Based on Multi-Agent Deep Deterministic Policy Gradient"],
  [I],

  ["SC-Phi2: A Fine-tuned Small Language Model for StarCraft II Macromanagement Tasks"],
  [I],

  ["SC2Arena and StarEvolve: Benchmark and Self-Improvement Framework for LLMs in Complex Decision-Making Tasks"],
  [I],

  ["Self Generated Wargame AI: Double Layer Agent Task Planning Based on Large Language Model" sun_self_2023],
  [I],

  ["Shall We Team Up: Exploring Spontaneous Cooperation of Competing LLM Agents"],
  [I],

  ["Strategic behavior of large language models and the role of game structure versus contextual framing" lore_strategic_2024],
  [I],

  ["Strategy-Augmented Planning for Large Language Models via Opponent Exploitation"],
  [I],

  ["SwarmBrain: Embodied agent for real‑time strategy game StarCraft II via large language models." shao_swarmbrain_2024],
  [I],

  ["The Automated but Risky Game: Modeling Agent-to-Agent Negotiations and Transactions in Consumer Markets"],
  [I],

  ["The Surprising Effectiveness of PPO in Cooperative Multi-Agent Games" yu_surprising_2022],
  [I],

  ["Tracing LLM Reasoning Processes with Strategic Games: A Framework for Planning, Revision, and Resource-Constrained Decision Making"],
  [I],

  ["Welfare Diplomacy: Benchmarking Language Model Cooperation" mukobi_welfare_2023],
  [I],

  ["BattleAgent: Multi-modal Dynamic Emulation on Historical Battles to Complement Historical Analysis" lin_battleagent_2024],
  [II],

  ["Escalation Risks from Language Models in Military and Diplomatic Decision-Making" rivera_escalation_2024],
  [II],

  ["Experimental wargames to address the complexity: scarcity gap" lakkaraju_experimental_2020],
  [II],

  ["War and Peace (WarAgent): Large Language Model-based Multi-Agent Simulation of World Wars"],
  [II],

  ["AMONGAGENTS: Evaluating Large Language Models in the Interactive Text-Based Social Deduction Game" chi_amongagents_2024],
  [III],

  ["Advancing AI Negotiations: New Theory and Evidence from an International AI Negotiation Competition"],
  [III],

  ["Agent Exchange: Shaping the Future of AI Agent Economics"],
  [III],

  ["Agents of Change: Self-Evolving LLM Agents for Strategic Planning"],
  [III],

  ["AvalonBench: Evaluating LLMs Playing the Game of Avalon" light_avalonbench_2023],
  [III],

  ["Battlefield information and tactics engine (BITE): a multimodal large language model approach for battlespace management" connolly_battlefield_2024],
  [III],

  ["Collaboration and Confrontation in Avalon Gameplay" lan_llm-based_2024],
  [III],

  ["DSGBench: A Diverse Strategic Game Benchmark for Evaluating LLM-based Agents in Complex Decision-Making Environments" tang_dsgbench_2025],
  [III],

  ["Debt Collection Negotiations with Large Language Models"],
  [III],

  ["Democratizing Diplomacy: A Harness for Evaluating Any Large Language Model on Full-Press Diplomacy"],
  [III],

  ["Digital Player: Evaluating Large Language Models based Human-like Agent in Games" wang_digital_2025],
  [III],

  ["Dungeons and Dragons as a Dialogue Challenge for Artificial Intelligence"],
  [III],

  ["EAI: Emotional Decision-Making of LLMs in Strategic Games and Ethical Dilemmas"],
  [III],

  ["Evaluating LLM Agent Collusion in Double Auctions"],
  [III],

  ["Finding deceivers in social context with large language models: the case of the Mafia game" yoo_finding_2024],
  [III],

  ["FishBargain: An LLM-Empowered Bargaining Agent for Online Flea-Market Platform Sellers"],
  [III],

  ["HARBOR: Exploring Persona Dynamics in Multi-Agent Competition"],
  [III],

  ["Human vs. Machine: Behavioral Differences Between Expert Humans and Language Models in Wargame Simulations" lamparth_human_2024],
  [III],

  ["Human-level play in the game of Diplomacy by combining language models with strategic reasoning" meta_fundamental_ai_research_diplomacy_team_human-level_2022],
  [III],

  ["It Takes Two to Negotiate: Modeling Social Exchange in Online Multiplayer Games" jaidka_it_2023],
  [III],

  ["LLMs of Catan: Exploring Pragmatic Capabilities of Generative Chatbots" martinenghi_llms_2024],
  [III],

  ["Learning from Synthetic Labs: Language Models as Experimental Subjects in Auctions"],
  [III],

  ["Measuring Free-Form Decision-Making Inconsistency of Language Models in Military Crisis Simulations" shrivastava_measuring_2024],
  [III],

  ["Microscopic Analysis on LLM Players via Social Deduction Game" kim_microscopic_2024],
  [III],

  ["More Victories, Less Cooperation: Assessing Cicero's Diplomacy Play" wongkamjan_more_2024],
  [III],

  ["MultiMind: Enhancing Werewolf Agents with Multimodal Memory"],
  [III],

  ["Negotiation and honesty in artificial intelligence methods for the board game of Diplomacy" kramar_negotiation_2022],
  [III],

  ["Playing repeated games with large language models" akata_playing_2025],
  [III],

  ["Richelieu: Self-Evolving LLM-Based Agents for AI Diplomacy" guan_richelieu_2024],
  [III],

  ["SPIN-Bench:  How Well Do LLMs Plan Strategically and Reason Socially?" yao_spin-bench_2025],
  [III],

  ["Should I Trust You? Detecting Deception in Negotiations using Counterfactual RL" wongkamjan_should_2025],
  [III],

  ["Super-additive Cooperation in Language Model Agents" tonini_super-additive_2025],
  [III],

  ["The Traitors: Deception and Trust in Multi-Agent Language Systems"],
  [III],

  ["Encouraging Divergent Thinking in Large Language Models through Multi-Agent Debate" liang_encouraging_2024],
  [IV],

  ["Large Language Models in Wargaming: Methodology, Application, and Robustness"],
  [IV],

  ["Managing Escalation in Off-the-Shelf Large Language Models" elbaum_managing_2025],
  [IV],

  ["Open-Ended Wargames with Large Language Models" hogan_open-ended_2024],
  [IV],

  ["Outwit, Outplay, Out-Generate: A Framework for Designing Strategic Generative Agents in Competitive Environments"],
  [IV],

  ["Scaling Laws For Scalable Oversight"],
  [IV],

  ["What if LLMs Have Different World Views: Simulating Alien Civilizations with LLM-based Agents"],
  [IV],

  ["When Two LLMs Debate, Both Think They'll Win"],
  [IV],

)

#v(0.5cm)
#block(width: 100%, [
  #set text(size: 9pt)
  *Table Legend:* Q = Quadrant (I–IV)
])

#text(size: 9pt)[Total papers in table: 88]
