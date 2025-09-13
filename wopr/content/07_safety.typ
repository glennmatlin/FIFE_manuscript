#import "../config.typ":num_papers
= Safety Considerations

The results of wargames often directly inform organizational policy, discussions, and institutional decision-making, including in sensitive policy and defensive contexts @uk_ministry_of_defense_influence_2023 ((RIEDL: this reference doesn't look right)). Because the design and interpretation of wargames usually assume human players and adjudicators with meaningfully different behavior patterns than LMs, the incorporation of LMs in wargaming necessitates reevaluation of traditional wargaming methodology and interpretation when LMs are involved @downes-martin_adjudication_2013. Some safety implications are: 

- *Escalation dynamics:* LMs show escalatory tendencies in diplomatic and military contexts @rivera_escalation_2024, requiring mitigation techniques @elbaum_managing_2025 for wargaming applications.
- *Unfaithful explanations:* LMs exhibit unfaithful Chain-of-Thought reasoning @turpin_language_2023 @lanham_measuring_2023, potentially misattributing decision factors in wargaming contexts.
- *Sycophancy*: Post-training creates emergent sycophancy @sharma_towards_2025, which may mask strategic vulnerabilities and incorrectly validate operator assumptions in red-team exercises.
- *Implicit bias*: Pre-training noise creates systematic errors @taubenfeld_systematic_2024 leading to implicit world state preferences @mazeika_utility_2025, causing blind spots in adversarial modeling.

In addition, classical notions of value alignment post-training around principles of helpfulness, harmlessnes, and honest ((CITE: Amanda Askew paper)) do not translate well to contexts where the LM is required to behave adversarially or deceiptfully. The tendency for post-training to result in models that defer to users or act sycophantically can undermine the intended usage of LMs in wargame contexts.

These vulnerabilities, and others, are discussed in greater detail in Appendix @app:safety-details.