// ===== Table of Selected AI in Wargames Papers (3 columns) =====

#set page(
  paper: "a4",
  margin: (left: 2.5cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm),
  columns: 2
)

#set text(font: "Times New Roman", size: 11pt)

== Selected AI in Wargames Papers

// Wide table spanning both columns
#place(
  top + center,
  scope: "parent",
  float: true,
  [
    #block(
      width: 100%,
      [
        #set text(size: 8pt)  // Smaller font for table content
        #table(
          columns: (2.8fr, 0.8cm, 3fr),
          align: (left, center, left),
          stroke: 0.5pt + gray,
          inset: 3pt,

          // Header
          table.header(
            [*Paper Title*],
            [*Q*],
            [*URL*],
          ),

          [A Land-Based War-Gaming Simulation Method Based on Multi-Agent Proximal Policy Optimization],
          [I],
          [—],

          [Adaptive Command: Real-Time Policy Adjustment via Language Models in StarCraft II],
          [I],
          [#link("https://arxiv.org/abs/2508.16580")[https://arxiv.org/abs/2508.16580]],

          [Ares: A System-Oriented Wargame Framework for Adversarial ML],
          [I],
          [#link("https://arxiv.org/abs/2210.12952")[https://arxiv.org/abs/2210.12952]],

          [BALROG: Benchmarking Agentic LLM and VLM Reasoning On Games],
          [I],
          [#link("https://arxiv.org/abs/2411.13543")[https://arxiv.org/abs/2411.13543]],

          [BattleAgentBench: A Benchmark for Evaluating Cooperation and Competition Capabilities of Language Models in Multi-Agent Systems],
          [I],
          [#link("https://arxiv.org/abs/2408.15971")[https://arxiv.org/abs/2408.15971]],

          [Can Large Language Models Play Games? A Case Study of A Self-Play Approach],
          [I],
          [#link("https://arxiv.org/abs/2403.05632")[https://arxiv.org/abs/2403.05632]],

          [Chess AI: Competing Paradigms for Machine Intelligence],
          [I],
          [—],

          [ChessGPT: Bridging Policy Learning and Language Modeling],
          [I],
          [#link("https://arxiv.org/abs/2306.09200")[https://arxiv.org/abs/2306.09200]],

          [CivRealm: A Learning and Reasoning Odyssey in Civilization for Decision-Making Agents],
          [I],
          [#link("https://arxiv.org/abs/2401.10568")[https://arxiv.org/abs/2401.10568]],

          [Diversifying AI: Towards Creative Chess with AlphaZero],
          [I],
          [—],

          [Exploration of Wargaming and AI Applications in Military Decision-Making],
          [I],
          [—],

          [Game Reasoning Arena: A Framework and Benchmark for Assessing Reasoning Capabilites of Large Language Models via Game Play],
          [I],
          [#link("https://arxiv.org/abs/2508.03368")[https://arxiv.org/abs/2508.03368]],

          [Game Theory Approach to Identifying Deception in Large Language Models],
          [I],
          [—],

          [Game-Theoretic LLM: Agent Workflow for Negotiation Games],
          [I],
          [#link("https://arxiv.org/abs/2411.05990")[https://arxiv.org/abs/2411.05990]],

          [GameBench: Evaluating Strategic Reasoning Abilities of LLM Agents],
          [I],
          [#link("https://arxiv.org/html/2406.06613v1")[https://arxiv.org/html/2406.06613v1]],

          [Harnessing Language for Coordination: A Framework and Benchmark for LLM-Driven Multi-Agent Control],
          [I],
          [#link("https://arxiv.org/abs/2412.11761")[https://arxiv.org/abs/2412.11761]],

          [Hierarchical control of multi-agent reinforcement learning team in real-time strategy (RTS) games],
          [I],
          [#link("https://doi.org/10.1016/j.eswa.2021.115707")[https://doi.org/10.1016/j.eswa.2021.115707]],

          [LLM-Based Agent Society Investigation: Collaboration and Confrontation in Avalon Gameplay],
          [I],
          [#link("https://arxiv.org/abs/2310.14985")[https://arxiv.org/abs/2310.14985]],

          [Large Language Models Play StarCraft II: Benchmarks and A Chain of Summarization Approach],
          [I],
          [#link("https://arxiv.org/abs/2312.11865")[https://arxiv.org/abs/2312.11865]],

          [Large Language Models on the Chessboard: A Study on ChatGPT's Formal Language Comprehension and Complex Reasoning Skills],
          [I],
          [#link("https://arxiv.org/abs/2308.15118")[https://arxiv.org/abs/2308.15118]],

          [Learning to Play No-Press Diplomacy with Best Response Policy Iteration],
          [I],
          [#link("https://arxiv.org/abs/2006.04635")[https://arxiv.org/abs/2006.04635]],

          [Leveraging Generative AI to Create Lightweight Simulations for Far-Future Autonomous Teammates],
          [I],
          [#link("https://journals.sagepub.com/doi/10.1177/10711813251357885")[https://journals.sagepub.com/doi/10.1177/10711813251357885]],

          [Maia-2: A Unified Model for Human-AI Alignment in Chess],
          [I],
          [—],

          [Mastering the Digital Art of War: Developing Intelligent Combat Simulation Agents for Wargaming Using Hierarchical Reinforcement Learning],
          [I],
          [#link("https://arxiv.org/abs/2408.13333")[https://arxiv.org/abs/2408.13333]],

          [Mastering the Game of No-Press Diplomacy via Human-Regularized Reinforcement Learning and Planning],
          [I],
          [#link("https://arxiv.org/pdf/2210.05492")[https://arxiv.org/pdf/2210.05492]],

          [Mastering the Game of Stratego with Model-Free Multiagent Reinforcement Learning],
          [I],
          [#link("https://arxiv.org/pdf/2206.15378")[https://arxiv.org/pdf/2206.15378]],

          [No Press Diplomacy: Modeling Multi-Agent Gameplay],
          [I],
          [#link("https://arxiv.org/abs/1909.02128")[https://arxiv.org/abs/1909.02128]],

          [Playing Games With GPT: What Can We Learn About a Large Language Model From Canonical Strategic Games?],
          [I],
          [#link("http://dx.doi.org/10.2139/ssrn.4493398")[http://dx.doi.org/10.2139/ssrn.4493398]],

          [Playing a Strategy Game with Knowledge-Based Reinforcement Learning],
          [I],
          [#link("https://arxiv.org/abs/1908.05472")[https://arxiv.org/abs/1908.05472]],

          [PokeLLMon: A Human-Parity Agent for Pokemon Battles with Large Language Models],
          [I],
          [#link("https://arxiv.org/abs/2402.01118")[https://arxiv.org/abs/2402.01118]],

          [Project Sid: Many-agent simulations toward AI civilization],
          [I],
          [#link("https://arxiv.org/abs/2411.00114")[https://arxiv.org/abs/2411.00114]],

          [Research on Wargame Decision-Making Method Based on Multi-Agent Deep Deterministic Policy Gradient],
          [I],
          [#link("https://doi.org/10.3390/app13074569")[https://doi.org/10.3390/app13074569]],

          [SC-Phi2: A Fine-tuned Small Language Model for StarCraft II Macromanagement Tasks],
          [I],
          [#link("https://arxiv.org/abs/2409.18989")[https://arxiv.org/abs/2409.18989]],

          [SC2Arena and StarEvolve: Benchmark and Self-Improvement Framework for LLMs in Complex Decision-Making Tasks],
          [I],
          [#link("https://arxiv.org/abs/2508.10428")[https://arxiv.org/abs/2508.10428]],

          [Self Generated Wargame AI: Double Layer Agent Task Planning Based on Large Language Model],
          [I],
          [#link("https://arxiv.org/abs/2312.01090v2")[https://arxiv.org/abs/2312.01090v2]],

          [Shall We Team Up: Exploring Spontaneous Cooperation of Competing LLM Agents],
          [I],
          [#link("https://arxiv.org/abs/2402.12327")[https://arxiv.org/abs/2402.12327]],

          [Strategic behavior of large language models and the role of game structure versus contextual framing],
          [I],
          [—],

          [Strategy-Augmented Planning for Large Language Models via Opponent Exploitation],
          [I],
          [#link("https://arxiv.org/abs/2505.08459")[https://arxiv.org/abs/2505.08459]],

          [SwarmBrain: Embodied agent for real‑time strategy game StarCraft II via large language models.],
          [I],
          [#link("https://arxiv.org/abs/2401.17749")[https://arxiv.org/abs/2401.17749]],

          [The Automated but Risky Game: Modeling Agent-to-Agent Negotiations and Transactions in Consumer Markets],
          [I],
          [#link("https://arxiv.org/abs/2410.10479")[https://arxiv.org/abs/2410.10479]],

          [The Surprising Effectiveness of PPO in Cooperative Multi-Agent Games],
          [I],
          [#link("https://arxiv.org/abs/2103.01955")[https://arxiv.org/abs/2103.01955]],

          [Tracing LLM Reasoning Processes with Strategic Games: A Framework for Planning, Revision, and Resource-Constrained Decision Making],
          [I],
          [#link("https://arxiv.org/abs/2506.12012")[https://arxiv.org/abs/2506.12012]],

          [Welfare Diplomacy: Benchmarking Language Model Cooperation],
          [I],
          [#link("https://arxiv.org/abs/2310.08901")[https://arxiv.org/abs/2310.08901]],

          [BattleAgent: Multi-modal Dynamic Emulation on Historical Battles to Complement Historical Analysis],
          [II],
          [#link("https://arxiv.org/abs/2404.15532")[https://arxiv.org/abs/2404.15532]],

          [Escalation Risks from Language Models in Military and Diplomatic Decision-Making],
          [II],
          [#link("https://dl.acm.org/doi/abs/10.1145/3630106.3658942")[https://dl.acm.org/doi/abs/10.1145/3630106.3658942]],

          [Experimental wargames to address the complexity: scarcity gap],
          [II],
          [#link("https://ieeexplore.ieee.org/document/9185413")[https://ieeexplore.ieee.org/document/9185413]],

          [War and Peace (WarAgent): Large Language Model-based Multi-Agent Simulation of World Wars],
          [II],
          [#link("https://arxiv.org/abs/2311.17227")[https://arxiv.org/abs/2311.17227]],

          [AMONGAGENTS: Evaluating Large Language Models in the Interactive Text-Based Social Deduction Game],
          [III],
          [#link("https://arxiv.org/abs/2407.16521")[https://arxiv.org/abs/2407.16521]],

          [Advancing AI Negotiations: New Theory and Evidence from an International AI Negotiation Competition],
          [III],
          [#link("https://arxiv.org/abs/2503.06416")[https://arxiv.org/abs/2503.06416]],

          [Agent Exchange: Shaping the Future of AI Agent Economics],
          [III],
          [#link("https://arxiv.org/abs/2507.03904")[https://arxiv.org/abs/2507.03904]],

          [Agents of Change: Self-Evolving LLM Agents for Strategic Planning],
          [III],
          [#link("https://arxiv.org/abs/2506.04651")[https://arxiv.org/abs/2506.04651]],

          [AvalonBench: Evaluating LLMs Playing the Game of Avalon],
          [III],
          [#link("https://arxiv.org/abs/2310.05036")[https://arxiv.org/abs/2310.05036]],

          [Battlefield information and tactics engine (BITE): a multimodal large language model approach for battlespace management],
          [III],
          [#link("https://doi.org/10.1117/12.3012352")[https://doi.org/10.1117/12.3012352]],

          [Collaboration and Confrontation in Avalon Gameplay],
          [III],
          [—],

          [DSGBench: A Diverse Strategic Game Benchmark for Evaluating LLM-based Agents in Complex Decision-Making Environments],
          [III],
          [#link("https://arxiv.org/abs/2503.06047")[https://arxiv.org/abs/2503.06047]],

          [Debt Collection Negotiations with Large Language Models],
          [III],
          [#link("https://arxiv.org/abs/2502.18228")[https://arxiv.org/abs/2502.18228]],

          [Democratizing Diplomacy: A Harness for Evaluating Any Large Language Model on Full-Press Diplomacy],
          [III],
          [#link("https://arxiv.org/abs/2508.07485")[https://arxiv.org/abs/2508.07485]],

          [Digital Player: Evaluating Large Language Models based Human-like Agent in Games],
          [III],
          [#link("https://arxiv.org/abs/2502.20807")[https://arxiv.org/abs/2502.20807]],

          [Dungeons and Dragons as a Dialogue Challenge for Artificial Intelligence],
          [III],
          [#link("https://arxiv.org/abs/2210.07109")[https://arxiv.org/abs/2210.07109]],

          [EAI: Emotional Decision-Making of LLMs in Strategic Games and Ethical Dilemmas],
          [III],
          [#link("https://dl.acm.org/doi/10.5555/3737916.3739625")[https://dl.acm.org/doi/10.5555/3737916.3739625]],

          [Evaluating LLM Agent Collusion in Double Auctions],
          [III],
          [#link("https://arxiv.org/abs/2507.01413")[https://arxiv.org/abs/2507.01413]],

          [Finding deceivers in social context with large language models: the case of the Mafia game],
          [III],
          [#link("https://www.nature.com/articles/s41598-024-81997-5")[https://www.nature.com/articles/s41598-024-81997-5]],

          [FishBargain: An LLM-Empowered Bargaining Agent for Online Flea-Market Platform Sellers],
          [III],
          [#link("https://arxiv.org/abs/2502.10406")[https://arxiv.org/abs/2502.10406]],

          [HARBOR: Exploring Persona Dynamics in Multi-Agent Competition],
          [III],
          [#link("https://arxiv.org/abs/2502.12149")[https://arxiv.org/abs/2502.12149]],

          [Human vs. Machine: Behavioral Differences Between Expert Humans and Language Models in Wargame Simulations],
          [III],
          [#link("https://arxiv.org/abs/2403.03407")[https://arxiv.org/abs/2403.03407]],

          [Human-level play in the game of Diplomacy by combining language models with strategic reasoning],
          [III],
          [—],

          [It Takes Two to Negotiate: Modeling Social Exchange in Online Multiplayer Games],
          [III],
          [#link("https://arxiv.org/abs/2311.08666")[https://arxiv.org/abs/2311.08666]],

          [LLMs of Catan: Exploring Pragmatic Capabilities of Generative Chatbots],
          [III],
          [#link("https://aclanthology.org/2024.games-1.12/")[https://aclanthology.org/2024.games-1.12/]],

          [Learning from Synthetic Labs: Language Models as Experimental Subjects in Auctions],
          [III],
          [#link("https://arxiv.org/abs/2507.09083")[https://arxiv.org/abs/2507.09083]],

          [Measuring Free-Form Decision-Making Inconsistency of Language Models in Military Crisis Simulations],
          [III],
          [#link("https://arxiv.org/abs/2410.13204")[https://arxiv.org/abs/2410.13204]],

          [Microscopic Analysis on LLM Players via Social Deduction Game],
          [III],
          [#link("https://arxiv.org/abs/2408.09946v1")[https://arxiv.org/abs/2408.09946v1]],

          [More Victories, Less Cooperation: Assessing Cicero's Diplomacy Play],
          [III],
          [#link("https://arxiv.org/abs/2406.04643")[https://arxiv.org/abs/2406.04643]],

          [MultiMind: Enhancing Werewolf Agents with Multimodal Memory],
          [III],
          [#link("https://arxiv.org/abs/2504.18039")[https://arxiv.org/abs/2504.18039]],

          [Negotiation and honesty in artificial intelligence methods for the board game of Diplomacy],
          [III],
          [#link("https://www.nature.com/articles/s41467-022-34473-5")[https://www.nature.com/articles/s41467-022-34473-5]],

          [Playing repeated games with large language models],
          [III],
          [#link("https://arxiv.org/pdf/2305.16867")[https://arxiv.org/pdf/2305.16867]],

          [Richelieu: Self-Evolving LLM-Based Agents for AI Diplomacy],
          [III],
          [#link("https://arxiv.org/abs/2407.06813")[https://arxiv.org/abs/2407.06813]],

          [SPIN-Bench:  How Well Do LLMs Plan Strategically and Reason Socially?],
          [III],
          [#link("https://arxiv.org/abs/2503.12349")[https://arxiv.org/abs/2503.12349]],

          [Should I Trust You? Detecting Deception in Negotiations using Counterfactual RL],
          [III],
          [#link("https://arxiv.org/abs/2502.12436")[https://arxiv.org/abs/2502.12436]],

          [Super-additive Cooperation in Language Model Agents],
          [III],
          [#link("https://arxiv.org/abs/2508.15510")[https://arxiv.org/abs/2508.15510]],

          [The Traitors: Deception and Trust in Multi-Agent Language Systems],
          [III],
          [#link("https://arxiv.org/abs/2505.12923")[https://arxiv.org/abs/2505.12923]],

          [Encouraging Divergent Thinking in Large Language Models through Multi-Agent Debate],
          [IV],
          [#link("https://arxiv.org/abs/2305.19118")[https://arxiv.org/abs/2305.19118]],

          [Large Language Models in Wargaming: Methodology, Application, and Robustness],
          [IV],
          [—],

          [Managing Escalation in Off-the-Shelf Large Language Models],
          [IV],
          [#link("https://arxiv.org/abs/2508.01056")[https://arxiv.org/abs/2508.01056]],

          [Open-Ended Wargames with Large Language Models],
          [IV],
          [#link("https://arxiv.org/abs/2404.11446")[https://arxiv.org/abs/2404.11446]],

          [Outwit, Outplay, Out-Generate: A Framework for Designing Strategic Generative Agents in Competitive Environments],
          [IV],
          [#link("https://www.cis.upenn.edu/~ccb/publications/survivor-sim.pdf")[https://www.cis.upenn.edu/~ccb/publications/survivor-sim.pdf]],

          [Scaling Laws For Scalable Oversight],
          [IV],
          [#link("https://arxiv.org/abs/2504.18530")[https://arxiv.org/abs/2504.18530]],

          [What if LLMs Have Different World Views: Simulating Alien Civilizations with LLM-based Agents],
          [IV],
          [#link("https://arxiv.org/abs/2402.13184")[https://arxiv.org/abs/2402.13184]],

          [When Two LLMs Debate, Both Think They'll Win],
          [IV],
          [#link("https://arxiv.org/abs/2505.19184")[https://arxiv.org/abs/2505.19184]],

        )
      ]
    )
  ]
)

#v(0.5cm)
#block(width: 100%, [
  #set text(size: 9pt)
  *Table Legend:* Q = Quadrant (I–IV)
])

#text(size: 9pt)[Total papers in table: 88]