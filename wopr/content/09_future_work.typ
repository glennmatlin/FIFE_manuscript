#import "../config.typ":num_papers

= Open Research Questions

As AI wargames proliferate in sensitive fields smth smth we present open problems

Standardize reporting for language‑based wargames: share prompts, facilitation procedures, and
adjudication rubrics with seeds and model versions @reddie_next-generation_2018 @downes-martin_wargaming_2025. 

Expand beyond short horizons by testing memory, retrieval, and role‑stability over multi‑turn scenarios. Compare lightweight
interventions (system prompts, few‑shot ICL, adapters) with simple baselines. Encourage
artifact release (transcripts, code, minimal configs) to enable replication across venues @reddie_wargames_2023.

- *How can we reliably elicit and maintain coherant heirarchal personas without behavioral leakage between persona levels?* 
- *Which interpretability methods can recover explanations for tactical decisions in multi-agent wargaming environments involving deception and opponent modeling?* 
- *What evaluation metrics can reliably compare agent strategic depth and long-term planning capability in open-ended wargames?* 
- *How can we mitigate brittle wargaming agent behavior in open-ended wargames when facing out-of-distribution scenarios?* 


[something something mech interp] Another class of promising solutions involves intervening on model internals through activation steering, which leverages un-interpretable yet meaningful hidden states or personas @turner_steering_2024 @chalnev_improving_2024 @chen_persona_2025. However, such techniques remain highly brittle and unpredictable @tan_analyzing_2025 @hao_patterns_2025 and require further investigation.