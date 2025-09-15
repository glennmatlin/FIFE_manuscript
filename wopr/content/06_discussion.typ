#import "@preview/tracl:0.6.1": *
#import "@preview/tracl:0.6.1": *

#import "../config.typ":num_papers

= Discussion of Application Domains

The motivation for integrating LMs into wargaming is rooted in the need to better navigate complex, high-stakes decision-making under uncertainty across diverse domains. 
LMs offer a way to enhance these simulations, enabling more dynamic, nuanced, and scalable explorations of strategic landscapes,
and making the exercises more repeatable and easier to conduct more often.
// that are often characterized by incomplete information and adversarial interactions.
The application of LMs in wargaming, however, varies significantly across domains.

// In military strategy and international diplomacy, wargames have been critical for crisis response and strategic advantage @black_scaling_2024. 
// In business and finance, simulations help stress-test strategies against market volatility @scherpereel_decision_2005 and provide a controlled environment for exploration of fiscal policies. 
// In public health, wargames are essential for preparing for crises such as pandemics @smith_serious_2020.

Military wargames serve a variety of purposes across the tactical, operational, strategic, and grand strategic levels. 
At the tactical and operational levels, LMs are less useful; player experience and SME evaluation and feedback are often more important than the outcome of the wargame itself. 
At the strategic level, wargames develop, evaluate, and update operations plans for potential, future wars. 
These wargames invite LMs as both creative players and creative adjudicators to explore a wide spectrum of player objectives and decision-making in high-stakes contexts @black_mastering_2024. 
This pushes the boundaries of AI alignment and reliability in high-stakes environments. 

// In national security, the focus is often on material force and battlefield outcomes and LMs often explored as players and adjudicators to model decision-making in safety-critical contexts @black_mastering_2024. 
// building on a long tradition of using wargames for military training and education @us_army_war_college_strategic_2015. 

Grand strategy wargames merge the threat or use of military force with statecraft, including International Relations (IR).
// In contrast, International Relations (IR) 
IR wargames are centered on language, signaling, and credibility. 
The work in this domain uses seminar-style formats where LMs can draft diplomatic communications, maintain narrative coherence, and explore the evolution of political positions through persuasion @lin-greenberg_wargaming_2022. 
This is significant as it highlights the potential of LMs to model and analyze the nuances of human negotiation and diplomacy. 

For businesses, wargames are a tool to test corporate strategy against competitive dynamics and market uncertainties @schwarz_business_2013. LMs can simulate competitors, customers, or regulators, surfacing narrative risks that traditional analysis might miss. This is valuable because it allows organizations to anticipate and prepare for a wider range of future scenarios. In economics and finance, wargames serve as laboratories for testing economic theories in dynamic, multi-agent systems @qi_civrealm_2024. 

// Games like _Settlers of Catan_ model resource negotiation and trade, allowing researchers to study emergent strategic behaviors like collusion or predatory expansion with AI agents, providing insights into market dynamics without real-world risk.

// TODO SRT: insert cybersecurity

Finally, in medicine and public health, wargames are used for crisis preparedness and response planning @smith_serious_2020. These tabletop exercises test emergency plans and inter-agency coordination, with LMs potentially assisting in scenario generation and analysis. This is crucial for improving societal resilience to future health crises.

While this section provides a high-level synthesis, a more granular analysis of the unique characteristics and applications within each domain is available in Appendix.
Additionally, @sec:detailedrecommendations enumerates implementation considerations to ensure that LMs are being effectively applied.
