#import "@preview/tracl:0.6.1": *

#show: doc => acl(doc,
  anonymous: true,
  title: [Shall We Wordplay a Game? \
  A Scoping Literature Review for Large Language Models \
  in Language-based and Open-Ended War Games],
  authors: (
    (
      name: "Glenn Matlin,Parv,Evan,Stu,Yixiong,Ryan,Mark,Issac",
      affiliation: [Georgia Institute of Technology],
      email: "wopr@gatech.edu",
    ),
  ),
)

#let num_papers = 42069

#abstract[
  #lorem(50)
]



= Introduction
The field of artificial intelligence has experienced an explosion in research and application. the pace at which artificial intelligence is reaching the capability of long-term or high-expertise tasks is rapidly decreasing. One of the main reasons at the time of writing is the recognition of large language models to act as a general purpose technology built on a natural language interface for humans. LMs can be recognized as a new basic technology upon which many further technologies are built from. As a result of these abilities there has been a marked rise by state actors who have or are exploring further integration of AI systems to exploit the capabilities of LMs for their organizational goals in military security, intelligence services, and diplomatic engagement .
there has been a recent emergence of reserarch artificial on the cutting edge of the current research for ai in open-ended and language-based wargames. ((need to talk here about the aspect of why -- security implications, safety problems, open-endednes scauses concerns etc with use..))
... This research provides a scoping literature review of how Language Models (LMs) are being used in open-ended and language-focused strategic wargames. Wargames are used to enhance and analyze decision-making in complex security environments. Traditional wargaming is limited by its reliance on human experts, while existing computational methods fail to capture the narrative depth and multi-party dynamics essential for realistic scenarios.  \
... LMs offer a way for AI to access the advanced contextual understanding and structured argumentation capabilities to automate players, adjudicate outcomes, and assist in analysis across political, military, economic, social, informational, and infrastructure (PMESII) domains.\
... We survey peer‑reviewed or high‑quality literature that used large language models (LLMs) to play, adjudicate, or evaluate wargames. The goal is to characterize current methods, evaluation practices, and known failure modes, and to identify research gaps relevant to defense and security stakeholders.\
... We believe the issue is that there is a lack of open-ended wargames that are qualitative, argument‑based, and rely on creativity.\
RQ: How are LLMs used in open-ended and qualitative wargames?
+ Which open-ended game types (seminar, matrix, digital multi‑turn, etc.) are most frequently studied?
+ What evaluation metrics (human SME ratings, game‑outcome measures, proxy language metrics, etc.) are reported?
+ What recurring limitations or failure modes (bias, escalation, prompt sensitivity) are documented?

NOTE:  we need to hit a few RQs really tight and they need to be tied to our contributions
contribution
c1 the lit survey, paper info, the hard work done
c2 the scoping of the open ended fully creative game space and highlighting the importance of the emerging area
c3 we highlight problems, research directions, provide information and resources, etc.

= Related Work
== Background
// Riedl says we might neeed background and definitions as separate, and not in related works. signposting is ok. one option to keep this in related work is to present and cite all the terminology used by others and why we use and extend it. we also would present things here we disagree with etc but we are likely in the former category so we just need to communicate what we do. communicate these sections in terms of related works rather than WE DEFINE. we would want to place our diffs at the end. we should use this section to lay down what others say and really adopt and lay it on them. this is the section for all the others
=== wargame
We define “wargame” as “a multi-faceted depiction of conflict with one or more parties in which the participants' decisions influence the future outcomes of events” [5, 12, 28]. For this research, we adopt the following definition of wargames: 
+ Ongoing conflict from opposing interests or needs occurring inside of a … 
+ Synthetic environment created to enable agent choice and behavior where … 
+ Agents will make decisions and experience the consequences of the results and … 
+ Use reasoning, analysis, and planning to engage in strategic thinking while taking into consideration information on other agents and the environment. [2, 11, 20, 33]. 
For our purposes, we adopt The RAND Corporation’s definition of “Artificial Intelligence” (AI) as “the use of computers to carry out tasks that previously required human intelligence” [31, 37].
=== serious game
#lorem(25)

=== Creative vs Analytical
[original text]
Current wargaming approaches rely heavily on human subject-matter experts (SMEs) for scenario development, player actions, and adjudication[11, 12]. One of the most useful types of exercises is a predominantly human-driven process with qualitative “seminar-style” games, which value argumentation and open-ended decision-making.\

[[isaac proposed changes]]
Current wargaming approaches could often be divided into two types: human-computer wargames (like in military wargames) and strict rule based war games (such as board games like Diplomacy).

Human-computer wargames rely heavily on human subject-matter experts (SMEs) for scenario development, player actions, and adjudication[11, 12]. One of the most useful types of exercises is a predominantly human-driven process with qualitative “seminar-style” games, which value argumentation and open-ended decision-making.\

However, the existing computer automation and AI for wargaming literature focuses on rule based, or “quantitative”, games with discrete moves and predictable outcomes, using traditional AI or expert systems. These systems lack the capacity to handle the ambiguity, creativity, and complex human interactions central to the seminar wargaming format we focus on. Computational support exists for tightly scoped kinetic or logistical simulations using Monte Carlo tree search or Reinforcement Learning over specific gaming mechanics, but prior methods provide little help with narrative argumentation [13, 17, 29]. These approaches suffer from limited interpretability, poor generalization to novel scenarios, and inability to handle the semantic complexity of long-form multi-party argumentation.\
[[isaac changes end]]

The existing computer automation and AI for wargaming literature focuses on “quantitative” games with discrete moves and predictable outcomes, using traditional AI or expert systems. These systems lack the capacity to handle the ambiguity, creativity, and complex human interactions central to the seminar wargaming format we focus on. Computational support exists for tightly scoped kinetic or logistical simulations using Monte Carlo tree search or Reinforcement Learning over specific gaming mechanics, but prior methods provide little help with narrative argumentation [13, 17, 29]. These approaches suffer from limited interpretability, poor generalization to novel scenarios, and inability to handle the semantic complexity of long-form multi-party argumentation.\
While militaries have begun experimenting with LMs, there is no established methodology for integrating them into these open-ended, qualitative analytical formats. Early experiments that allowed off‑the‑shelf LMs to “play” scripted moves showed brittle reasoning, hallucination, and non‑compliance with rules [7, 22, 38, 45, 46–49]. As a result, open‑ended wargames remain predominantly human‑driven because they require creativity, persuasion, and negotiation and not only merely optimal move search [24, 25, 30].
==== Analytical
#lorem(25)
==== Creative
#lorem(25)
== seminal works in the field that help define it  Artificial Intelligence in Wargaming 
#lorem(50)
== other lit reviews, other game papers
#lorem(50)
// Riedl: in terms of defenseive writing we should definitely have this section for other lit reviews and discuss how others wrote and worked here but we should also provide deficencies. i.e., this one doesn't focus on experiments; ie, this paper is very broad and does not scope out. ie the paper is old. point to 2-4 and describe how they arent doing what we need to do in the paper. describe the insufficiencies gently and properly. and therefore we need this new review.

// Riedl: we should present the paper for review with the methodology before and we can flip it after. we do want a paragraph here or two. we need to provide it for reviewers ahead of time. it should be very very vshort and just to explain there was thought and meticulous work etc great. let them chase everything else in appendices. 

= Results
#lorem(20)
time analysis, etc.
Paper stats, quant info, etc
1graphs here

// Riedl: I think it would helpful and important to mention the concept of input/output spaces and how they are semantically different. 


== breakdown of each quadrant in analytical vs creative aspect (open endedness)
#image("creativity_quadrants.png") 
// tentative

=== Q1: Uncreative Agent, Creative Adjudicator
This quadrant covers games which the players are often relatively limited in their action space while possessing a flexible often human adjudicator computing the outcomes. A less common quadrant, well-known games that would fall into this quadrant would include classic Free Kriegsspiel where the focus is on limited procedural military actions while the outcomes are adjudicated by a human umpire. Many other battlefield-scale war games would fall under this category.

=== Q2: Uncreative Agent, Uncreative Adjudicator
This quadrant covers rigid rule based systems for both the players and the adjudicators (often merely predetermined scoring). Of the quadrants, this quadrant alongside Q4 is one of the most extensively explored as it captures traditional "quantitative" war games. Such notable wargames in this field would include the No Press variant of Diplomacy and the original rigid Kriegsspiel and nearly the entirety of traditional strategy board games such as Chess, Checkers, and Go. As 

=== Q3: Creative Agent, Uncreative Adjudicator
This quadrant covers games which the high creativity agents with low creativity adjudicators. Common patterns of games in this quadrant includes high expressive low procedural complexity games with a procedural adjudicator. This includes vast majority of board games with a social element and also rigid scoring rules such as Diplomacy and The Settlers of Catan. 

Of the quadrants, this quadrant is one of the most explored in its relation with AI as extensive research has been conducted especially with wargames such as Diplomacy most notably from Meta's Cicero. With a rigid adjudicating mechanisms and often rigid procedural agent mechanisms, games in this quadrant are mechanically simple to run and evaluate which leads to the popularity of this category.

*Issues with Q3* The limited creativity that makes Q3 attractive also is its major flaw. The rigid adjudication and procedural creativity of many existing research in the quadrants strongly constrains the effect of the expressive creativity that would be the focus. 

=== Q4: Creative Agent, Creative Adjudicator
This quadrant covers war games with often high procedural, expressive players and a qualitative adjudicator. Games that would fall under this category are modern military war games or adjudicated simulations such as Model United Nations. Common elements present in similar Real world implementation of these games are used in every aspect of serious games.

== Q4 is uniquely important for analysis (workshop this wording)
Games providing ample opportunity for both agent and adjudicator creativity are highly valuable to achieve traditional aims of wargaming: [name a couple axes for wargaming for which Q4 does quite well, cite each]. However, few studies (PERCENTAGE, n=NUMBER) automated approaches to construction and evaluation of wargames in Q4, and 

// Riedl: in order to avoid someone jumping down throat about serious games as tutoring games we should introduce a term or use an adjective to specialize it to wargames or social decision making. decision making is important here. drawing inference wont be enough. we want to specifically avoid the aspect of 'serious games' that are educational ie chess is serious game for toddlers so serious is relative to the human. we have to define the usage itself ie decision making for social decisions policy etc define it sepcifically be defensive

*Q4 is highest value in serious game*
Reality is highly creative and higher creativity provides more value as a serious game. 

- War Game
  - battlefield
  - non-battlefield
- Business War Game
- Diplomatic Simulation
- Generalized Social Simulation

*Q4 takes advantage of improving AI capabilities*. AI systems built on LLMs in particular are expected to improve at long time-horizon tasks [METR Paper] thanks to ever expanding context windows [CITE] and long context retrieval capabilities [CITE]. Additionally, LLMs have been shown to consistently improve at tasks involving persuasion [CITE], creative writing [CITE], and qualified judgement [CITE], and thus will likely become both more creative agents and more creative adjudicators. [One sentence about this paper's findings [https://arxiv.org/abs/2504.02234].] Therefore, games in Q4 are uniquely poised to take advantage of the current trajectory of LLM capabilities.

A paragraph introducing param efficient fine-tuning and ICL - I think these techniques are important to run LLM wargames well.

- add high marginal benefits from automating human effort 

*Q4 faces unique safety and security concerns* Providing ample latitude for creativity at both the agent and adjudicator layer of wargames necessarily permits [breaking out of] constraints. 

== Analysis of Q4 (qualitative)
here, we talk about the papers in q4 only and characterize them

// riedl: we should explicitly have a section on research problems and what can be larned by working on those.
// real time multi agent planning -- mech interpability -- avoiding bias and echochambers

// riedl: have a statement at some point where you could focus on anyone of these individual problems, but these games give opportunities to do many things at once and measure interactions. Q4 can solve the problem by avoiding the silos, explaining how the systems interact etc.

== discussion
we just talk about whatever
you can just do things
future directions we see, risks in the field 

=== Human-Agent Interactions (HAI) vs Agent-Agent Interactions (A2A)
Especially in the areas of Diplomacy and highly creative agents, previous research leans towards Human-Agent Interactions (HAI) with emphasis on emulating or integrating with human diplomatic behavior. Often, it is only a single AI agent interacting with a group of human players as seen typically in AI research with _Diplomacy_. With diplomacy and collaboration being the focus, the state of the game strongly encourages the AI agents to adopt the social language of the rest of the players. Such research often are conducted through random games on online platforms with text based communications, and mostly without the human users being strongly informed of the presence of the AI agent on the platform let alone that they are playing against an AI agent. The focus is often on how AI interacts compared human diplomatic strategies as the primary benchmark with the target of human-like behavior and evaluated on performances against humans. 

However, agent-agent interactions (A2A) are ever more important especially with the advancements and popularization of LM and agentic AI in society and especially in business industries (note: reword as opposed to purely social cases to emphasis serious game factors). As agentic systems become more common, conflicts of interests between multiple agentic systems would be inevitable and the nature of this interaction would be different than HAI. Existing agentic research are often on simple collaboration on tasks or mixture-of-experts, research involving competitive diplomatic A2A remains sparse. While language models are trained on human language, there is a clear difference in social strategy with humans against one of just language models.  The benchmark towards human-like behavior common in HAI may very well not hold up for A2A. 

=== cybersecurity risks, military aspects (stu)
==== cybercybercybercybercyber
*non-exhaustive list of nasty things a threat actor could do*
_*D4M:* Deny, degrade, disrupt, destroy, modify_
===== Asset: The AI/Agent Model
====== Event: Data D4M  
======= Event Targets: data types
  - Raw data (corpora) that may be included in training data, knowledge graphs, or searches
  - Training data sets
  - Model weights
  - Prompts
  - Agent packages (e.g., the set of files required for a user to install/integrate and deploy/use an AI agent)
======= Event Locations:
  - External (outside of the organization and its vendors or contractors): Internet, open-source, open-access data
  - Commercial/Contractor: commercial/vendor or contractor-owned or licensed resources, including closed-source and proprietary data, and curated external data
  - Organization: organization-owned or licensed resources, including closed-source or proprietary data, and curated commercial/vendor and external data
======= Event Effects:
The following aspects of a wargame that includes AI in some manner may be denied, degraded, disrupted, destroyed, or modified: 
  - Wargame development (e.g., scenario or prompt generation)
  - Agent/player or adjudication behavior/decisions (e.g., unrealistically escalatory or de-escalatory, not aggressive/too aggressive, erratic, manipulative, non-compliant)
  - Adherence to rules
  - Chain-of-thought, reasoning logs, retrieval links
  - Meta-gaming
  - Agent jailbreaking to access game/meta-game
  - Agent jailbreaking to access information technology systems
Other effects may include:
  - Data exfiltration: wargame, meta-game, and non-game (organizational)
  - Information technology system exploitation and lateral movement into non-wargame systems
====== Event: API D4M
======= Event Targets: external and internal APIs
  - Open-acces raw data providers (e.g., Internet databases, Wikipedia)
  - Commercial/contractor data providers (e.g., cloud storage)
  - Commercial/contractor AI providers (e.g., commercially-hosted AI models)
======= Event Effects:
  - As above.

I could go into way more detail but that would turn into a series of very repetitive narratives about who/what/when/where/how. I could also go into other vectors that target the wargame system and other information about the wargame, results, analysis, etc.--but that's just "regular" cybersecurity stuff.



=== concerns about international diplomacy (isaac)
- shift from military -> diplomacy
- 

=== business/organization wargames (glenn and rohan)

=== social deception, persuasion, and deduction (ryan and evan)
points to discuss:
-LLMs need to be able to understand competing narratives and frameworks and how it can utilize current narratives/info streams to achieve its goals.
-Current studies show that LLMs are good at constructing viable narratives but currently suffer from harnessing a consistent strategy (Digital Player, Strategic Behavior of Large Language Models, AMONGAGENTS)
- In the real world, especially one embraced in conflict, competing narratives and information warfare run rampant, an LLM must be able to discern deception from adversaries, persuasion from over-zealous friendly newssources, and be able to create a ground truth deduction that accruately reflects the real world instead of confirming biases. 
-Current academic research proposes human intervention in these models in order to prevent issues with reliability, biases, and provide oversight (Reducing the Risks of Artificial Intelligence)
-While open-ended scenarios such as warfare or negotiations are not solely based on the principals of social deduction, future LLMs would be wise to incorporate findings from this area of research as a way of hardening AI to adversarial attacks, either from data poisoning, jailbreaking, or even biased overconfidence (Game theory approahch to identifying Deception in Large Language Models, When Two LLMs Debate, Reducing the Risks of Artificial Intelligence,Both Think They'll Win)

= Methodology
We conducted a structured literature review following Kitchenham’s SLR phases and PRISMA reporting guidance. We searched Google Scholar, ArXiv, and Semantic Scholar using three Boolean queries, deduplicated by DOI, and screened title/abstract before full-text review. Our final set of #num_papers papers was extracted into a CSV for quantitative counts and qualitative theme coding

````sql
("wargame" OR "seminar wargame" OR "matrix wargame") AND ("large language model" OR "LLM" OR "GPT")
````
Academic Sources: Scopus, Web of Science, IEEE Xplore, ACM DL, arXiv, SSRN;
Niche: Defense Technical Information Center, The RAND Corporation, Simulations & Gaming Journals, Military wargaming centers, DoD, UK MOD

... and see appendix B

= Safety considerations (Parv and Yixiong)

Figure out how wargaming results are used in practice, this informs our safety concerns - one paragraph on this. [Parv]

== Known vulnerabilities of LLM as simulation method in strategic games [Yixiong]

- Several papers on escalation dynamics
- Biases [utility engineering paper], CoT unfaithfulness, sycophancy, etc etc
- I'm sure there are more, see the James Evans paper on llm in simulations linked above
- Project Vend [nuclear thing]

== Interpretation of LLM-simulated wargames [Parv]

On how to safety interpret and use the results.  People are usually bad at this. 
- Explain lack of grounding and the nature of LLM outputs
- Delegation of power - warn of scenario where LLMs can make better stragetic decisions than humans - we willingly hand over control.

== Pre-deployment evaluation [Parv]

- Somehow compare with human baseline...?  Not sure how
- Red team the system
  - Semantic flaws: like not giving LLM enough context, improper context control, etc etc.
  - Effect(s) of above vulnerabilities
  - Security vulnerbilities
- CoT monitoring
- The usual security tests for high stakes software systems


= Conclusions
== Future Work
#lorem(75)
== Final Thoughts
#lorem(75)


= Impact statement
#lorem(50) // what was the point, why did we do this, etc
TODO: read neurips guideline or acl guideline and see 

= Appendix A: On Wargames

== Social Games
//placeholder citation until they are input here, will edit - Ryan 
While wargames may contain elements of social reasoning or deception, they differ fundamentally from social deduction games in that deception is not the objective but a component of broader strategic reasoning. Wargames require agents to pursue defined goals through planning and decision-making within a structured conflict environment. In contrast, social deduction games are centered around identity discovery and psychological misdirection, making them categorically distinct. This distinction is critical for evaluating LLMs in open-ended scenarios, as social deduction games test their ability to navigate dynamic, multi-agent interactions involving trust and deception (AMONGAGENTS, 2025).
\\
Psychological misdirection is prolific in warfare, however, and history is rife with examples of cunning tacticians using it with great success. As the Chinese military strategist Sun Tzu famously wrote, "All warfare is based on deception," exemplified by tactics like the Trojan Horse, the Empty Fort Strategy, and Hannibal’s crossing of the Alps to outmaneuver Roman forces through strategic diversions. For this literature review, social deduction games represent a complementary effort to wargames, as their focus on harnessing psychological misdirection in game scenarios can enhance LLMs’ performance in real-life contexts where information may be unreliable, mislabeled, or intentionally deceptive (Game Theory Approach to Identifying Deception in Large Language Models, 2025; Human vs. Machine: Language Models and Wargames, 2025). By studying LLMs in these settings, researchers can improve their adaptability to ambiguous, deception-heavy scenarios critical to both wargaming and broader AI applications



== Creativity vs Analytical
Below are the wargaming methods arranged by their focus on creativity and original though (1) compared with rigor and analytical precision (7).
Information is borrowed from Figure "Emphasis of selected structured analytical techniques"; Source: IHS Markit/UK Ministry of Defence Wargaming Handbook; Red Teaming Guide (c) 2018 IHS Markit 1695832
1. *Red teaming* (Scale: 1): "A technique associated with but distinct from wargaming – the independent application of a range of structured, creative and critical thinking techniques to assist the end user make a better informed decision."
2. *Seminar wargaming* (Scale: 2): "Open-ended, argument-based discussion between experts, to elicit opinions and judgements" with casual interactivity and an adversarial component.
3. *Matrix wargaming* (Scale: 3): "Matrix games demand that players provide several specific arguments for the success of a proposed action… These characteristics stimulate free-thinking creativity and novel outcomes from the narrative generated in the game. Matrix games rely on an experienced facilitator…"
4. *Course of action wargaming* (Scale: 4): "[A] systematic method for analysing a plan to visualise the potential ebb and flow of an operation or campaign" used in military planning.
5. *Free Kriegsspiel* (Scale: 5): "A traditional wargame, in which adjudication is conducted by an expert umpire."
6. *Rigid Kriegsspiel* (Scale: 6): "As with a Free Kriegsspiel, but with adjudication through detailed rules rather than expert judgement."
7. *Computer-assisted wargaming* (Scale: 7): "Software-based simulations, usually highly detailed, with assessments of probability derived from data."

// riedl: we should explicitly list all the papers that were analyzed. we shouuld only cite the things we need to know in the paper. for example we would not cite every single paper we collected. we should cite anything that was main body in the references; if not main and included methods, appendix for sure. if no main and no reference dont even put in paper. any paper that went into forming the quadrants and informing it is important. for example auctiong ames and business games would be in the list because they are defined as not. table should have name, relevant info, bib info, comments, rank/ratings etc as needed. we want to help guide people towards reading papers that are relevant for them


// riedl has said that anytime we put stuff in appendix it should be tied back to our paper. so for example all the rand visualizations or epxert infographics etc are not going to be in appendix unless we specifically tie it back to our paper. wwe could explain how they relate and differ, how they link and combine, etc. this is subjective but it is helpful for making tight writing.

= Appendix B: Systemic Literature Review Protocols

== Key Definitions
(locked before screening starts)

*Wargame:* A multi-actor, multi-turn interactive scenario whose purpose is to explore conflict decisions and consequences. Examples include seminar games, matrix games, and digital crisis simulations.

*Open-ended:* Games where rules permit *unconstrained natural-language moves*, allowing players to propose novel actions beyond a preset menu. Outcomes are adjudicated by facilitators, subject matter experts, or dynamic rules rather than a fixed payoff matrix. Matrix wargames and Diplomacy (with negotiation phases) exemplify this approach, contrasting with constrained games like Chess or Go or social games like Werewolf or Among Us.

*Quantitative wargame:* Formats that track numeric scores, payoffs, probabilities, or optimization objectives, though they may still contain open-ended dialogue components. Examples include Diplomacy (with victory points) and stochastic combat models.

*Qualitative wargame:* Games relying on narrative adjudication or subject matter expert judgment with minimal or no numeric scoring. Tabletop seminar games with after-action discussions represent this category.

*Language-centric game:* Formats where progress depends fundamentally on *textual or spoken communication* among actors (human or LLM). CICERO Diplomacy and conflict negotiations exemplify this approach, contrasting with action-based games like StarCraft with micromanagement handled by LLM-powered bots.

*Failure mode:* Any recurring, documented shortcoming of an LLM-powered wargame, including bias, escalation, hallucination, deception, data leakage, or prompt sensitivity issues.

== Inclusion / Exclusion Criteria

=== Inclusion Criteria

Studies were included if they met all of the following criteria:
- (I1) Publication year 2022 or later to ensure GPT-era relevance.
- (I2) Includes the use of LLMs with at least one billion (1B) parameters (e.g., GPT-2 and later, PaLM, Claude, Llama, OLMO, etc.) to establish a modern capability floor.
- (I3) Games involving *natural-language interaction between one or more agents* (LLMs or humans) to ensure focus on language-based gameplay.
- (I4) Games qualifying as *open-ended wargames* per our definitions to capture both analytic and creative styles.
- (I5) LLMs serving as agents, adjudicators, or generators to ensure breadth of roles.
- (I6) Provision of any evaluation outcome (quantitative metrics, subject matter expert narratives, or explicit statement of “none”) as needed for synthesis.
- (I7) Full text accessibility with machine translation acceptable to ensure global coverage.
- (I8) Publication in peer-reviewed venues or formal technical reports (RAND, CNA, DoD, MoD) with grey literature flagged but included.

=== Exclusion Criteria

Studies were excluded for the following reasons:
- (E1) Single-move polls or surveys presented as games due to lack of interactivity.
- (E2) Non-language game AI systems (Go, StarCraft, Atari, etc.) as out of scope.
- (E3) Opinion or editorial pieces without research content, including any blog posts which lack technical appendices or methodology.
- (E5) Systems primarily relies on LLMs below one billion parameters as falling below the modern capability threshold.

== Data-Extraction Template

Failure-mode controlled vocab (initial list): `escalation`, `bias`, `hallucination`, `prompt_sensitivity`, `data_leakage`, `deception`, `other`.

#figure(
  placement: top,
  scope: "parent",
  table(
  columns: (auto, auto, auto),
  stroke: none,
  column-gutter: 1em,
  align: left,
  [*Column*], [*Example value*], [*Notes*],
  table.hline(y:1),
  table.vline(x: 1),
  [`title`], [#lorem(8)], [#lorem(16)],
  [`year`], [2024], [#lorem(10)],
  [`venue_type`], [`workshop`], [conf / journal / tech-report],
  [`game_type`], [`matrix`], [seminar / matrix / digital / hybrid],
  [`open_ended`], [`yes`], [y/n per definition],
  [`quantitative`], [`yes`], [y/n],
  [`llm_family`], [GPT-3], [#lorem(5)],
  [`llm_role`], [player], [player / generator / analyst],
  [`eval_metrics`], [SME ratings; win-rate], [free text],
  [`failure_modes`], [escalation; hallucination], [pipe-separated list],
  [`awscale`], [3], [1-5 analytic-wild],
  [`code_release`], [github.com/xyz], ["none" if absent],
  [`grey_lit_flag`], [true], [#lorem(5)],
  [`language`], [English], [after translation if needed],
  table.hline(),
),
  caption: [#lorem(10)],
)

== Analytic vs Creative Scale (Analytic ↔ Creative)

We treat "creativity" and "analytical focus" as two poles of a single continuum: the more a role relies on open-ended imagination, the less it relies on formal, rule-based analysis, and vice versa. We create an ordinal scale (1–7) and assign every game two ratings. The *Agent score* representing where the *players* sit on the open-endedness continuum, and the *Adjudicator score* – where the *umpire / rules / software* sit on that same continuum.

#figure(
  placement: top,
  scope: "parent",
  table(
    columns: (auto, auto, auto, auto),
    stroke: none,
    column-gutter: 1em,
    align: left,
    table.hline(),
    [*Score*], [*Pole*], [*Agent-side*], [*Adjudicator-side*],
    [*1*], [Ultra-Analytical], [Fixed script/moves], [Deterministic tables only],
    [*2*], [Strongly Analytical], [Narrow choices], [Detailed rules, minimal interpretation],
    [*3*], [Moderately Analytical], [Occasional novel ideas], [Rule-driven + minor calls],
    [*4*], [Balanced], [Equal creativity/rules], [Mixed models + judgment],
    [*5*], [Moderately Creative], [Many novel actions], [Free interpretation],
    [*6*], [Strongly Creative], [Encouraged invention], [Expert narrative judgment],
    [*7*], [Ultra-Creative], [Unlimited proposals], [Pure expert storytelling],
    table.hline()
  ),
  caption: [Open-endedness scoring framework with role-specific definitions],
)

== Placing Representative Wargames on the Two-Axis Plot

#figure(
  placement: top,
  scope: "parent",
  table(
    // columns: (auto, auto,auto,auto),
    // align: left,
    columns: (1fr, auto, auto, 2fr),
    align: (left, center, center, left),
    stroke: none,
    column-gutter: 1em,
    table.hline(),
    [*Wargame Name *], [*Agent\ Creativity*], [*Adjudicator\ Creativity*], [*Notes*],
  [Seminar wargame], [7], [7], [Open proposals; facilitated discussion],
  [Matrix wargame], [6], [5], [Invented actions; light adjudication],
  [Free Kriegsspiel], [6], [7], [Free play; expert umpire judgment],
  [Red Teaming], [7], [5], [Extreme novelty; structured critique],
  [Diplomacy], [7], [1], [Open negotiation; algorithmic resolution],
  [Course-of-Action wargame], [3], [3], [Scripted analysis; doctrinal checks],
  [Warhammer 40k], [4], [2], [Varied tactics; heavy dice/rules],
  [Computer sim (unclear!)], [3], [1], [Menu actions; software computation],
  [Rigid Kriegsspiel], [2], [1], [Rulebook tactics; deterministic tables],
  [Chess], [1], [0], [Codified moves; formal rules],
  [Tic-Tac-Toe], [1], [0], [Strict move; formal rules],
  [Conway's Game of Life], [0], [0] ,[lorem ipsum],
  [linear graphic novel games], [x], [x], [lorem ipsum],
    table.hline()
  ),
    caption: [Representative wargames plotted on dual-axis framework],
)

=== Framework Interpretation

The *x-axis* represents *Agent open-endedness* (1 = fully analytical, 7 = fully creative), while the *y-axis* represents *Adjudicator open-endedness* on the same 1-7 scale.

When plotted as a scatter-plot, four intuitive regions emerge:

*Top-right (7,7) – "Pure brainstorming":* Seminar games occupy this space, proving useful for ideation but weak for reproducible analysis.

*Bottom-left (1-2,1-2) – "Pure calculation":* Rigid rules or computer simulations excel at repeatability but offer poor novel insight generation.

*Top-left – "Creative players, rigid resolution":* Negotiation games such as _Diplomacy_ exemplify this quadrant, featuring creative strategy development with mechanical outcome determination.

*Bottom-right – "Constrained players, creative umpire":* This configuration is not common but possible, such as tightly scripted training vignettes where subject matter expert adjudicators improvise consequences.


== E Seed Papers (coverage check)

- Hogan & Brennen 2024 – _Open-ended Wargames with LLMs_
- FAIR Diplomacy (Science 2022)
- Lamparth et al. 2024 (two versions)
- Shrivastava et al. 2024 (inconsistency)
- Rivera et al. 2024 (escalation)

All search strings must surface these five.
// Uncomment this to include your bibliography

/*
#import "@preview/blinky:0.2.0": link-bib-urls
#let bibsrc = read("custom.bib")

#link-bib-urls()[
   #bibliography("custom.bib", style: "./association-for-computational-linguistics-blinky.csl")
]
*/