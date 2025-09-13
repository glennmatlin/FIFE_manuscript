// ===== Appendix A: Selected AI in Wargames Papers (ACL-style) =====

#set page(
  paper: "a4",
  margin: (left: 2.5cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm),
  columns: 2
)

#import "@preview/booktabs:0.0.4": toprule, midrule, bottomrule
#set text(size: 9pt, lang: "en", hyphenate: true)

// Optional (keeps bold/strong tidy at small sizes)
// #show strong: set text(weight: "semibold")

= Appendix A: Selected AI in Wargames Papers

#{
  // Make column 2 (Title) ragged-right for nicer wraps in narrow measures.
  show table.cell.where(x: 2): set par(justify: false)

  table(
    columns: (11mm, 1fr, 9mm),   // Year (fixed), Title (flex), Q (narrow)
    align: (right, left, center),
    inset: (x: 4pt, y: 2pt),
    column-gutter: 4pt,
    row-gutter: 0pt,
    stroke: none,                // Booktabs rules only

    toprule(),
    table.header(repeat: true)[*Year*][*Paper Title*][*Q*],
    midrule(),

    [2024], ["A Land-Based War-Gaming Simulation Method Based on Multi-Agent Proximal Policy Optimization"], [I],
    [2022], ["Actor–critic-based decision-making method for the artificial intelligence commander in tactical wargames"], [II],
    [2025], ["Adaptive Command: Real-Time Policy Adjustment via Language Models in StarCraft II"], [I],
    [2025], ["Advancing AI Negotiations: New Theory and Evidence from an International AI Negotiation Competition"], [III],
    [2025], ["Agent Exchange: Shaping the Future of AI Agent Economics"], [III],
    [2025], ["Agents of Change: Self-Evolving LLM Agents for Strategic Planning"], [III],
    [2024], ["AMONGAGENTS: Evaluating Large Language Models in the Interactive Text-Based Social Deduction Game"], [III],
    [2022], ["An experiment in tactical wargaming with platforms enabled by artificial intelligence"], [II],
    [2024], ["Applying Deep Reinforcement Learning to Train AI Agents in a Wargaming Framework"], [I],
    [2022], ["Ares: A System-Oriented Wargame Framework for Adversarial ML"], [I],
    [2023], ["AvalonBench: Evaluating LLMs Playing the Game of Avalon"], [III],
    [2024], ["BALROG: Benchmarking Agentic LLM and VLM Reasoning On Games"], [I],
    [2024], ["BattleAgent: Multi-modal Dynamic Emulation on Historical Battles to Complement Historical Analysis"], [II],
    [2024], ["BattleAgentBench: A Benchmark for Evaluating Cooperation and Competition Capabilities of Language Models in Multi-Agent Systems"], [I],
    [2024], ["Battlefield information and tactics engine (BITE): a multimodal large language model approach for battlespace management"], [III],
    [2024], ["Can Large Language Models Play Games? A Case Study of A Self-Play Approach"], [I],
    [2021], ["Chess AI: Competing Paradigms for Machine Intelligence"], [I],
    [2023], ["ChessGPT: Bridging Policy Learning and Language Modeling"], [I],
    [2024], ["CivRealm: A Learning and Reasoning Odyssey in Civilization for Decision-Making Agents"], [I],
    [2024], ["Collaboration and Confrontation in Avalon Gameplay"], [III],
    [2025], ["Debt Collection Negotiations with Large Language Models"], [III],
    [2025], ["Democratizing Diplomacy: A Harness for Evaluating Any Large Language Model on Full-Press Diplomacy"], [III],
    [2020], ["Developing Combat Behavior through Reinforcement Learning in Wargames and Simulations"], [I],
    [2025], ["Digital Player: Evaluating Large Language Models based Human-like Agent in Games"], [III],
    [2023], ["Diversifying AI: Towards Creative Chess with AlphaZero"], [I],
    [2025], ["DSGBench: A Diverse Strategic Game Benchmark for Evaluating LLM-based Agents in Complex Decision-Making Environments"], [III],
    [2022], ["Dungeons and Dragons as a Dialogue Challenge for Artificial Intelligence"], [III],
    [2024], ["EAI: Emotional Decision-Making of LLMs in Strategic Games and Ethical Dilemmas"], [III],
    [2023], ["Encouraging Divergent Thinking in Large Language Models through Multi-Agent Debate"], [IV],
    [2024], ["Escalation Risks from Language Models in Military and Diplomatic Decision-Making"], [II],
    [2025], ["Evaluating LLM Agent Collusion in Double Auctions"], [III],
    [2020], ["Experimental wargames to address the complexity: scarcity gap"], [II],
    [2025], ["Exploration of Wargaming and AI Applications in Military Decision-Making"], [I],
    [2024], ["Finding deceivers in social context with large language models: the case of the Mafia game"], [III],
    [2025], ["FishBargain: An LLM-Empowered Bargaining Agent for Online Flea-Market Platform Sellers"], [III],
    [2025], ["Game Reasoning Arena: A Framework and Benchmark for Assessing Reasoning Capabilites of Large Language Models via Game Play"], [I],
    [2024], ["Game Theory Approach to Identifying Deception in Large Language Models"], [I],
    [2024], ["GameBench: Evaluating Strategic Reasoning Abilities of LLM Agents"], [I],
    [2024], ["Game-Theoretic LLM: Agent Workflow for Negotiation Games"], [I],
    [2025], ["HARBOR: Exploring Persona Dynamics in Multi-Agent Competition"], [III],
    [2024], ["Harnessing Language for Coordination: A Framework and Benchmark for LLM-Driven Multi-Agent Control"], [I],
    [2021], ["Hierarchical control of multi-agent reinforcement learning team in real-time strategy (RTS) games"], [I],
    [2024], ["Human vs. Machine: Behavioral Differences Between Expert Humans and Language Models in Wargame Simulations"], [III],
    [2023], ["Human-level play in the game of Diplomacy by combining language models with strategic reasoning"], [III],
    [2023], ["Intelligent Decision-Making and Human Language Communication Based on Deep Reinforcement Learning in a Wargame Environment"], [I],
    [2024], ["Intuitionistic Fuzzy MADM in Wargame Leveraging With Deep Reinforcement Learning"], [I],
    [2023], ["It Takes Two to Negotiate: Modeling Social Exchange in Online Multiplayer Games"], [III],
    [2024], ["Large Language Models in Wargaming: Methodology, Application, and Robustness"], [IV],
    [2023], ["Large Language Models on the Chessboard: A Study on ChatGPT's Formal Language Comprehension and Complex Reasoning Skills"], [I],
    [2023], ["Large Language Models Play StarCraft II: Benchmarks and A Chain of Summarization Approach"], [I],
    [2025], ["Learning from Synthetic Labs: Language Models as Experimental Subjects in Auctions"], [III],
    [2020], ["Learning to Play No-Press Diplomacy with Best Response Policy Iteration"], [I],
    [2025], ["Leveraging Generative AI to Create Lightweight Simulations for Far-Future Autonomous Teammates"], [I],
    [2023], ["LLM-Based Agent Society Investigation: Collaboration and Confrontation in Avalon Gameplay"], [I],
    [2024], ["LLMs of Catan: Exploring Pragmatic Capabilities of Generative Chatbots"], [III],
    [2024], ["Maia-2: A Unified Model for Human-AI Alignment in Chess"], [I],
    [2025], ["Managing Escalation in Off-the-Shelf Large Language Models"], [IV],
    [2024], ["Mastering the Digital Art of War: Developing Intelligent Combat Simulation Agents for Wargaming Using Hierarchical Reinforcement Learning"], [I],
    [2022], ["Mastering the Game of No-Press Diplomacy via Human-Regularized Reinforcement Learning and Planning"], [I],
    [2022], ["Mastering the Game of Stratego with Model-Free Multiagent Reinforcement Learning"], [I],
    [2024], ["Measuring Free-Form Decision-Making Inconsistency of Language Models in Military Crisis Simulations"], [III],
    [2024], ["Microscopic Analysis on LLM Players via Social Deduction Game"], [III],
    [2021], ["Modeling fog of war effects in AFSIM"], [I],
    [2024], ["More Victories, Less Cooperation: Assessing Cicero's Diplomacy Play"], [III],
    [2024], ["Multiattribute Decision-Making in Wargames Leveraging the Entropy–Weight Method in Conjunction With Deep Reinforcement Learning"], [I],
    [2025], ["MultiMind: Enhancing Werewolf Agents with Multimodal Memory"], [III],
    [2023], ["Naval Wargame Prototyping: Multiplayer Real-Time Strategy Game Simulation Using Unreal Engine"], [I],
    [2022], ["Negotiation and honesty in artificial intelligence methods for the board game of Diplomacy"], [III],
    [2020], ["No Press Diplomacy: Modeling Multi-Agent Gameplay"], [I],
    [2024], ["Open-Ended Wargames with Large Language Models"], [IV],
    [2024], ["Outwit, Outplay, Out-Generate: A Framework for Designing Strategic Generative Agents in Competitive Environments"], [IV],
    [2020], ["Playing a Strategy Game with Knowledge-Based Reinforcement Learning"], [I],
    [2023], ["Playing Games With GPT: What Can We Learn About a Large Language Model From Canonical Strategic Games?"], [I],
    [2025], ["Playing repeated games with large language models"], [III],
    [2024], ["PokeLLMon: A Human-Parity Agent for Pokemon Battles with Large Language Models"], [I],
    [2024], ["Project Sid: Many-agent simulations toward AI civilization"], [I],
    [2020], ["Recurrent MADDPG for Object Detection and Assignment in Combat Tasks"], [I],
    [2023], ["Research on Wargame Decision-Making Method Based on Multi-Agent Deep Deterministic Policy Gradient"], [I],
    [2024], ["Richelieu: Self-Evolving LLM-Based Agents for AI Diplomacy"], [III],
    [2025], ["SC2Arena and StarEvolve: Benchmark and Self-Improvement Framework for LLMs in Complex Decision-Making Tasks"], [I],
    [2024], ["Scaling Laws For Scalable Oversight"], [IV],
    [2024], ["SC-Phi2: A Fine-tuned Small Language Model for StarCraft II Macromanagement Tasks"], [I],
    [2023], ["Self Generated Wargame AI: Double Layer Agent Task Planning Based on Large Language Model"], [I],
    [2023], ["Self Generated Wargame AI: Double Layer Agent Task Planning Based on Large Language Model"], [III],
    [2024], ["Shall We Team Up: Exploring Spontaneous Cooperation of Competing LLM Agents"], [I],
    [2025], ["Should I Trust You? Detecting Deception in Negotiations using Counterfactual RL"], [III],
    [2025], ["SPIN-Bench:  How Well Do LLMs Plan Strategically and Reason Socially?"], [III],
    [2024], ["Strategic behavior of large language models and the role of game structure versus contextual framing"], [I],
    [2025], ["Strategy-Augmented Planning for Large Language Models via Opponent Exploitation"], [I],
    [2025], ["Super-additive Cooperation in Language Model Agents"], [III],
    [2024], ["SwarmBrain: Embodied agent for real‑time strategy game StarCraft II via large language models."], [I],
    [2024], ["The Automated but Risky Game: Modeling Agent-to-Agent Negotiations and Transactions in Consumer Markets"], [I],
    [2021], ["The Surprising Effectiveness of PPO in Cooperative Multi-Agent Games"], [I],
    [2025], ["The Traitors: Deception and Trust in Multi-Agent Language Systems"], [III],
    [2025], ["Tracing LLM Reasoning Processes with Strategic Games: A Framework for Planning, Revision, and Resource-Constrained Decision Making"], [I],
    [2023], ["War and Peace (WarAgent): Large Language Model-based Multi-Agent Simulation of World Wars"], [II],
    [2023], ["Welfare Diplomacy: Benchmarking Language Model Cooperation"], [I],
    [2024], ["What if LLMs Have Different World Views: Simulating Alien Civilizations with LLM-based Agents"], [IV],
    [2025], ["When Two LLMs Debate, Both Think They'll Win"], [IV],
    [2022], ["Rethinking Adversarial Examples in Wargames"], [I],

    bottomrule(),
  )
}

// --- Legend & Count ---
#v(6pt)
#block(
  width: 100%,
  fill: luma(96),
  inset: (x: 6pt, y: 4pt),
  radius: 2pt,
)[
  #set text(size: 8pt)
  *Legend:* Q = Quadrant (I–IV)
]

#text(size: 8pt)[Total papers: 100 | Quadrant I: 52 | Quadrant II: 6 | Quadrant III: 34 | Quadrant IV: 8]
