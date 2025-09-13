#import "../config.typ":num_papers
= Safety Considerations

The results of wargames often directly inform organizational policy, discussions, and institutional decision-making, including in sensitive policy and defensive contexts @uk_ministry_of_defense_influence_2023 ((RIEDL: this reference doesn't look right)). Because the design and interpretation of wargames usually assume human players and adjudicators with meaningfully different behavior patterns than LMs, the incorporation of LMs in wargaming necessitates reevaluation of traditional wargaming methodology and interpretation when LMs are involved @downes-martin_adjudication_2013. 
Some safety implications are: 

- *Implicit Bias:* Prior work notes recurring issues when LMs are used for simulation, including bias, (lack of) diversity, and sycophancy @lamparth_human_2024 @anthis_llm_2025 @hammond_multi-agent_2025. 
- *Escalation dynamics:* Empirical evidence shows escalatory tendencies in diplomatic and military games ((CITE rivera24; elbaum25)), possibly due to training on fictional narratives.
- *Unfaithful explanations:* LMs externalized reasoning (e.g., chain-of-thought) is not necessarily faithful to how LMs make decisions ((cite turpin, lanham)). This can hinder human player ability to trust that games are representative of the world, or to learn from the games.

In addition, classical notions of value alignment post-training around principles of helpfulness, harmlessnes, and honest ((CITE: Amanda Askew paper)) do not translate well to contexts where the LM is required to behave adversarially or deceiptfully. The tendency for post-training to result in models that defer to users or act sycophantically can undermine the intended usage of LMs in wargame contexts.
// These observations vary by model and motivate context-dependent guardrails rather than categorical claims about capability. We outline a non-exhaustive set of vulnerabilities as they apply to the most common applications of wargaming, but practitioners should carefully evaluate LM behavior in their own contexts. 
These vulnerabilities, and others, are discussed in greater detail in Appendix @app:safety-details.