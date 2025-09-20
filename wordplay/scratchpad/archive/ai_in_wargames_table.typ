// Archived: original Appendix A table (outdated)
// Moved from content/tables/ai_in_wargames_table.typ
// Note: table_v2 is the maintained version used in main.typ

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

  ["A Land-Based War-Gaming Simulation Method Based on Multi-Agent Proximal Policy Optimization" gao_LandBasedWarGamingSimulation_2024],
  [I],

  ["Adaptive Command: Real-Time Policy Adjustment via Language Models in StarCraft II" ma_AdaptiveCommandRealTime_2025],
  [I],

  ["Ares: A System-Oriented Wargame Framework for Adversarial ML" ahmed_AresSystemOrientedWargame_2022],
  [I],

  ["BALROG: Benchmarking Agentic LLM and VLM Reasoning On Games" paglieri_balrog_2024],
  [I],

  ["BattleAgentBench: A Benchmark for Evaluating Cooperation and Competition Capabilities of Language Models in Multi-Agent Systems" wang_BattleAgentBenchBenchmarkEvaluating_2024],
  [I],

  ["Can Large Language Models Play Games? A Case Study of A Self-Play Approach" guo_CanLargeLanguage_2024],
  [I],

  ["Chess AI: Competing Paradigms for Machine Intelligence" maharaj_ChessAICompeting_2022],
  [I],

  ["ChessGPT: Bridging Policy Learning and Language Modeling" feng_chessgpt_2023],
  [I],

  ["CivRealm: A Learning and Reasoning Odyssey in Civilization for Decision-Making Agents" qi_civrealm_2024],
  [I],

  ["Diversifying AI: Towards Creative Chess with AlphaZero" zahavy_diversifying_2024],
  [I],

  ["Exploration of Wargaming and AI Applications in Military Decision-Making" li_exploration_2025],
  [I],

  ["Game Reasoning Arena: A Framework and Benchmark for Assessing Reasoning Capabilities of Large Language Models via Game Play" cipolina-kun_game_2025],
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

  ["Large Language Models Play StarCraft II: Benchmarks and A Chain of Summarization Approach" ma_ComputationalExperimentsMeet_2024],
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

  // … (content preserved; see original for full list) …
)

#v(0.5cm)
#block(width: 100%, [
  #set text(size: 9pt)
  *Table Legend:* Q = Quadrant (I–IV)
])

#text(size: 9pt)[Total papers in table: 88]
