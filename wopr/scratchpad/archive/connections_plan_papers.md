## 1) Prompt for your AI agent

**SYSTEM GOAL**
You are a precise research assistant tasked with finding **1–2 high‑value, correctly supported citation opportunities per paper** inside a Typst project. You will scan all `*.typ` files, extract candidate sentences/paragraphs, and match them to the **Context Pack** (provided below as JSONL). Favor **specific, attributable claims** over generic statements. Output a compact, review‑ready report—**do not edit files**, just propose insertions with exact locations and justification.
>
**INPUTS**
>
* A root directory containing Typst files (`*.typ`).
* A JSONL “Context Pack” with items: `{id, citekey, title, creators, year, url, bluf, topics, citable_claims[...]}`.
>
**WHAT TO CITE (decision rules)**
>
1. **Cite only when the paper clearly supports the exact sentence.** Prefer: definitions, methods, patterns, design choices, trade‑offs, or concrete examples (e.g., *LLM adjudicator in matrix games*, *argumentation mechanics structure*, *human‑in‑the‑box representation*).
2. **Max 2 opportunities per paper across the whole repository.** Skip if no good match.
3. **Match by concepts, not keywords alone.** Confirm semantic fit between the local sentence and a paper’s **BLUF + topics + citable\_claims**.
4. **Avoid over‑broad citations.** Do **not** cite background papers for claims they don’t discuss (e.g., don’t cite *Human‑in‑the‑Box* for reinforcement learning; don’t cite *Argumentation Mechanics* for compute benchmarks).
5. **Prefer variety.** If several papers could fit, choose the **closest topical match** that adds the most value (novel insight, method, or caution relevant to the sentence).
6. **Use background vs support:**
>
   * *Background* = scene‑setting claims (e.g., “matrix games emphasize open‑text argument and adjudication”).
   * *Support* = a more specific claim or technique (e.g., “LLM adjudication pattern for matrix games”).
>
**HOW TO SEARCH THE PROJECT**
>
* Recursively scan all `*.typ` files.
* Ignore build artifacts and images.
* Extract candidate sentences/blocks around these concept clusters (case‑insensitive):
>
  * *(LLMs in open‑ended games)*: `matrix|narrative|open[- ]?ended|adjudicat(e|ion)|umpire|argument(s|ation)|claim(s)?|counter(-)?argument|free-?text|facilitator|prompt(ing)?|persona|NPC|role[- ]?play|diplomacy|negotiation|CICERO|GPT|LLM|generative`
  * *(AI representation methods)*: `human in the box|abstraction|simulation|mechanic(s)?|technology levels|game[- ]?theor(y|etic)|rational|equilibrium`
  * *(Ethics/responsible AI)*: `responsible AI|AI governance|policy|constraints|oversight`
>
**SCORING A MATCH (0–1):**
>
* +0.4 if local text matches a paper’s **topics**.
* +0.3 if it matches a **citable\_claim**’s anchor phrases.
* +0.2 if local text’s **intent** (define / method / design / caution / example) matches the paper’s **use\_type**.
* −0.3 if the sentence is purely rhetorical or unrelated to the paper’s scope.
* Propose only matches with **score ≥ 0.6**.
>
**HOW TO PROPOSE AN INSERTION**
For each accepted match, output one object with:
>
```json
{
  "file": "<relative/path.typ>",
  "line_hint": <first_line_number_of_span>,
  "span": "<short snippet of the sentence/paragraph>",
  "proposed_citation": "@<citekey>", 
  "why_this_fits": "<1–2 sentences; reference the paper’s BLUF or citable_claim>",
  "use_type": "support" | "background",
  "confidence": 0.60–0.95,
  "paper_id": "<id from context pack>"
}
```
>
* **No more than 2 objects per `paper_id`.**
* If the paper is a **slide deck**, treat slide numbers (if available) as “page” indicators in your justification.
* **Typst syntax:** many templates accept `[@key]` or `#cite(@key)`. Don’t assume—just output `@key` and leave formatting to the editor.
>
**OUTPUT**
A JSON array of suggestion objects sorted by file and line. Include a **summary section** at the end: how many candidates considered, how many accepted, and which papers had **0** good opportunities (with a one‑line reason for each).
>
**SAFETY & QUALITY**
>
* Be conservative: if uncertain, **don’t** propose the citation.
* Do not hallucinate page numbers.
* Keep “why\_this\_fits” specific and falsifiable (someone should be able to check the PDF/slide quickly).
* Never exceed 2 suggested insertions per paper.

---

## 2) Context Pack (concise, source‑backed)

*Use this to guide matching; the JSONL version is provided after these notes.*

**Griffin & Zhu — “Matrix Gaming with Large Language Models” (Connections UK 2024).**
**BLUF:** Shows how LLMs (e.g., GPT‑4) can act as **players** or an **adjudicator** in matrix games; includes an example scenario (“QuAI Sera Sera”) and practical facilitation patterns for free‑text argument/adjudication. **Use for:** concrete claims about LLM‑mediated **matrix‑game** play and adjudication patterns. ([Professional Wargaming][1])

**Griffin — “AI & Wargaming” (Connections UK 2023).**
**BLUF:** Primer linking **LLMs** to wargaming use‑cases (asset generation, play assistance), and highlighting negotiation/communication AIs (e.g., *CICERO* in Diplomacy) as a bridge to matrix‑style, text‑driven play. **Use for:** background when you mention LLMs in dialogue/negotiation games or LLM roles in matrix gaming. ([Professional Wargaming][2])

**Freeman — “AI in Wargaming” (Connections UK 2024).**
**BLUF:** Practical examples from Conducttr of using LLMs for **AI personas/NPCs**, narrative injects, and early **adjudication** prototypes; emphasizes SME prompts and oversight. **Use for:** claims about persona simulation, dynamic injects, or production‑grade workflows. ([Professional Wargaming][3])

**Stolk & de Nooijer — “REAIM: a wargame about Responsible AI in the Military Domain” (Connections UK, 2023).**
**BLUF:** A facilitated, multi‑team game in which players **develop and deploy AI** in different environments, drawing on matrix‑style reasoning; useful for governance/ethics framing. **Use for:** ethics/governance context or matrix‑style structure for AI capability growth. ([Professional Wargaming][4])

**Sepinsky — “Modeling Artificial Intelligence in Wargames: Human in the Box” (in *Representing Artificial Intelligence in Wargames*, 2020).**
**BLUF:** Procedure for representing AI by **constraining a human role‑player** (“human in the box”), with setup mechanics and trade‑offs. **Use for:** representing AI behavior under I/O constraints or as a comparator/baseline to LLM runs. (See WG2 report, ch. “Modeling AI…,” pp. \~53–58.)&#x20;

**Wheaton, Hennessey, & Trosky — “Making the Case for a Bigger, Better Widget” (in WG2, 2020).**
**BLUF:** Explains **argumentation mechanics** (claims, counters, evidence) and their limits for speculative tech. **Use for:** scaffolding free‑text LLM play (claims/counter‑claims) and transparent adjudication. (WG2, pp. \~44–51.)&#x20;

**Hanley — “Games, Game Theory, and Artificial Intelligence” (in WG2, 2020).**
**BLUF:** Connects game theory to AI and wargame design; argues normative game‑theoretic solutions often diverge from observed human behavior—supporting **empirical/experimental** approaches. **Use for:** cautions about equilibrium reasoning in LLM‑mediated play; motivation for experimental designs. (WG2, pp. \~59–76.)&#x20;

**Rensel — “Artificial Intelligence – A Wargame Asset” (in WG2, 2020).**
**BLUF:** 2030‑timeframe thought piece; proposes three concrete **implementation routes** for AI in games: **AI cell**, **scripted response sets**, and **pre‑game workshop** to integrate AI into play. **Use for:** mapping AI assistant roles in games and practical control‑cell structures. (WG2, pp. \~25–41; abstract highlights the three routes.)&#x20;

**WG2 Editors (McGrady & Peachey) — *Representing Artificial Intelligence in Wargames* (2020).**
**BLUF (report‑level):** Frames approaches to representing AI: **model the AI**, **abstract the AI**, or (if everyone has parity) **ignore special treatment**; discusses the challenge that AI may **surprise human decision‑makers**. **Use for:** general background on representation choices.&#x20;

**Ellison — “Anything you can do, AI can do better? (Deep Dive Panel)” (Connections UK 2023).**
**BLUF:** Evidence‑based appraisal of where AI helps in **design/execution/analysis** and where human judgment remains essential. **Use for:** balanced claims about opportunities/limits of AI in professional wargaming. ([Professional Wargaming][5])

---

## 3) JSONL “Context Pack” (with Zotero‑style citekeys)

**Note on keys.** Each `citekey` follows your formula `creators(1, "%(f)s").lower + "_" + shorttitle(1,0).lower + "_" + year`, e.g., `griffin_matrix_2024`.
Paste this JSONL straight into a file (e.g., `connections-ai-wargaming.jsonl`) for your agent to load.

```jsonl
{"id":"griffin_matrix_2024","citekey":"@griffin_matrix_2024","title":"Matrix Gaming with Large Language Models","creators":[{"family":"Griffin","given":"Lewis D."},{"family":"Zhu","given":"Boyu"}],"year":2024,"venue":"Connections UK","type":"presentation","url":"https://www.professionalwargaming.co.uk/24MatrixGamingWithLLMs.pdf","bluf":"Shows how LLMs can act as players or an adjudicator in matrix games; includes an example scenario and facilitation patterns for free-text argument/adjudication.","topics":["matrix game","LLM adjudication","umpire prompts","centaur human+AI play","open-text reasoning"],"citable_claims":[{"use_type":"support","anchor_keywords":["matrix game","LLM adjudicator","umpire","arguments","rebuttals"],"claim":"LLMs can participate in matrix games either as players or as the adjudicating umpire using structured prompts."},{"use_type":"background","anchor_keywords":["free-text","argument","adjudication","scenario"],"claim":"Matrix gaming provides a natural setting for open-ended, text-driven play that LLMs can assist or mediate."}]}
{"id":"griffin_ai_2023","citekey":"@griffin_ai_2023","title":"AI & Wargaming","creators":[{"family":"Griffin","given":"Lewis D."}],"year":2023,"venue":"Connections UK","type":"presentation","url":"https://www.professionalwargaming.co.uk/23-AI-LewisGriffin.pdf","bluf":"Primer on LLMs for wargaming, including asset generation and negotiation/dialogue agents (e.g., Diplomacy/CICERO) relevant to matrix-style play.","topics":["LLMs","asset generation","Diplomacy","CICERO","matrix roles"],"citable_claims":[{"use_type":"background","anchor_keywords":["LLM","definition","capabilities"],"claim":"Introduces large language models and their potential wargaming roles."},{"use_type":"support","anchor_keywords":["Diplomacy","negotiation","dialogue","CICERO"],"claim":"Negotiation/communication AIs illustrate how language-based agents interface with adversarial play."}]}
{"id":"freeman_ai_2024","citekey":"@freeman_ai_2024","title":"AI in Wargaming","creators":[{"family":"Freeman","given":"Amelia"}],"year":2024,"venue":"Connections UK","type":"presentation","url":"https://www.professionalwargaming.co.uk/24AIinWargaming-AmeliaFreeman.pdf","bluf":"Production-focused examples of LLM use for AI personas, dynamic narrative injects, and early adjudication; stresses SME prompting and human oversight.","topics":["AI personas","LLM injects","adjudication prototypes","prompt engineering","production workflows"],"citable_claims":[{"use_type":"support","anchor_keywords":["persona","NPC","role-play","Conducttr"],"claim":"LLM-driven personas can provide consistent, domain-bounded behaviors in scenario play with SME-designed prompts."},{"use_type":"background","anchor_keywords":["adjudication","oversight","prompts"],"claim":"Prototype adjudication and narrative inject workflows benefit from structured prompts and human-in-the-loop control."}]}
{"id":"stolk_reaim_2023","citekey":"@stolk_reaim_2023","title":"REAIM: a wargame about Responsible Artificial Intelligence in the Military Domain","creators":[{"family":"Stolk","given":"Diederik"},{"family":"de Nooijer","given":"Ivo"}],"year":2023,"venue":"Connections UK","type":"brief/report","url":"https://www.professionalwargaming.co.uk/REAIMAdSheet.pdf","bluf":"A facilitated, multi-team game where actors develop and deploy AI capabilities across settings, drawing on matrix-game style reasoning; good for ethics/governance framing.","topics":["responsible AI","ethics","matrix-style","capability development"],"citable_claims":[{"use_type":"background","anchor_keywords":["responsible AI","governance","ethics"],"claim":"Provides a worked example of embedding responsible-AI considerations into adversarial play."},{"use_type":"support","anchor_keywords":["matrix","multi-team","capability growth"],"claim":"Uses matrix-style logic to reason about AI capability development and employment across environments."}]}
{"id":"sepinsky_modeling_2020","citekey":"@sepinsky_modeling_2020","title":"Modeling Artificial Intelligence in Wargames: Human in the Box","creators":[{"family":"Sepinsky","given":"Jeremy"}],"year":2020,"venue":"in McGrady & Peachey (eds.), Representing AI in Wargames (Connections US WG2)","type":"chapter","url":"https://connections-wargaming.com/wp-content/uploads/2021/02/representing-artificial-intelligence-in-wargames.pdf","bluf":"Specifies a 'human in the box' method to emulate AI decision-making via constrained human role-play; details setup and trade-offs.","topics":["human-in-the-box","AI representation","mechanics","trade-offs"],"citable_claims":[{"use_type":"support","anchor_keywords":["human in the box","I/O constraints","mechanics"],"claim":"A constrained human can represent AI behavior through defined inputs/outputs and timing to surface trust and vulnerability issues."},{"use_type":"background","anchor_keywords":["trade-offs","setup","control cell"],"claim":"Outlines setup phases and trade-offs when representing AI by human emulation in games."}]}
{"id":"wheaton_making_2020","citekey":"@wheaton_making_2020","title":"Making the Case for a Bigger, Better Widget","creators":[{"family":"Wheaton","given":"Kristan J."},{"family":"Hennessey","given":"Megan"},{"family":"Trosky","given":"Abram"}],"year":2020,"venue":"in McGrady & Peachey (eds.), Representing AI in Wargames (Connections US WG2)","type":"chapter","url":"https://connections-wargaming.com/wp-content/uploads/2021/02/representing-artificial-intelligence-in-wargames.pdf","bluf":"Introduces argumentation mechanics (claims, counters, evidence) and discusses limits for speculative tech modeling.","topics":["argumentation mechanics","claims/counters/evidence","speculative tech"],"citable_claims":[{"use_type":"support","anchor_keywords":["argumentation","claims","counter-arguments","evidence"],"claim":"Structured argumentation mechanics can discipline free-text play by requiring claims, counter-claims, and supporting evidence."},{"use_type":"background","anchor_keywords":["limits","mechanic","speculative"],"claim":"Notes practical limits of argumentation mechanics when modeling speculative technologies."}]}
{"id":"hanley_games_2020","citekey":"@hanley_games_2020","title":"Games, Game Theory, and Artificial Intelligence","creators":[{"family":"Hanley","given":"John T., Jr."}],"year":2020,"venue":"in McGrady & Peachey (eds.), Representing AI in Wargames (Connections US WG2)","type":"chapter","url":"https://connections-wargaming.com/wp-content/uploads/2021/02/representing-artificial-intelligence-in-wargames.pdf","bluf":"Links game theory and AI, emphasizing gaps between normative solutions and observed human play; motivates experimental/empirical approaches.","topics":["game theory","AI","experimental gaming","rationality vs behavior"],"citable_claims":[{"use_type":"background","anchor_keywords":["normative","equilibrium","experimental"],"claim":"Normative game-theoretic solutions often diverge from actual human behavior, motivating empirical gaming."},{"use_type":"support","anchor_keywords":["AI","rational agents","decision"],"claim":"Defines AI in terms of rational agents and connects this to strategic interaction studied in games."}]}
{"id":"rensel_artificial_2020","citekey":"@rensel_artificial_2020","title":"Artificial Intelligence – A Wargame Asset","creators":[{"family":"Rensel","given":"Dennis J."}],"year":2020,"venue":"in McGrady & Peachey (eds.), Representing AI in Wargames (Connections US WG2)","type":"chapter","url":"https://connections-wargaming.com/wp-content/uploads/2021/02/representing-artificial-intelligence-in-wargames.pdf","bluf":"2030-vision piece arguing for practical integration routes: create an AI cell, script response sets, or run a pre-game workshop for AI impacts.","topics":["AI assistants","control cell","scripted responses","workshop"],"citable_claims":[{"use_type":"support","anchor_keywords":["AI cell","control","assist"],"claim":"One integration approach is to create a dedicated AI cell to emulate AI capabilities during play."},{"use_type":"support","anchor_keywords":["scripted responses","pre-game workshop"],"claim":"Alternative routes include scripted response libraries and pre-game workshops to surface AI impacts."}]}
{"id":"mcgrady_representing_2020","citekey":"@mcgrady_representing_2020","title":"Representing Artificial Intelligence in Wargames: Working Group 2 Proceedings","creators":[{"family":"McGrady","given":"E. D."},{"family":"Peachey","given":"Justin"}],"year":2020,"venue":"Connections US","type":"edited volume","url":"https://connections-wargaming.com/wp-content/uploads/2021/02/representing-artificial-intelligence-in-wargames.pdf","bluf":"Frames core representation choices: model the AI, abstract the AI, or ignore if all sides have parity; warns that AI may surprise human decision-makers.","topics":["representation","abstraction","simulation","parity","surprise"],"citable_claims":[{"use_type":"background","anchor_keywords":["model","abstract","ignore parity"],"claim":"Common approaches are to model the AI, abstract its effects via levels, or ignore if parity exists among sides."},{"use_type":"background","anchor_keywords":["surprise","decision-making"],"claim":"AI may surprise human decision-makers, challenging traditional adjudication and scenario design."}]}
{"id":"ellison_anything_2023","citekey":"@ellison_anything_2023","title":"“Anything you can do, AI can do better”? Deep Dive Panel: AI in Wargaming","creators":[{"family":"Ellison","given":"George"}],"year":2023,"venue":"Connections UK","type":"presentation","url":"https://www.professionalwargaming.co.uk/23AIDeepDive-GeorgeEllison.pdf","bluf":"Assesses where AI helps (design/execution/analysis) and where human judgment remains critical; offers a balanced view.","topics":["limits of AI","design","execution","analysis"],"citable_claims":[{"use_type":"background","anchor_keywords":["limits","where AI helps","human judgment"],"claim":"Provides a balanced view of where AI adds value in wargaming and where human decision-making remains essential."}]}
```

---

## 4) How your agent should use this pack (quick guide you can paste under the prompt)

* **Good “support” matches, by paper type:**

  * *griffin\_matrix\_2024*: when your text asserts “LLMs can act as adjudicators or players in **matrix** games” or discusses **umpire prompt patterns**. ([Professional Wargaming][1])
  * *griffin\_ai\_2023*: when introducing **LLMs** or referencing **negotiation/dialogue AIs** like **CICERO** as a bridge to text‑driven play. ([Professional Wargaming][2])
  * *freeman\_ai\_2024*: when claiming **AI personas / narrative injects / early adjudication workflows** in practice. ([Professional Wargaming][3])
  * *stolk\_reaim\_2023*: when discussing **responsible AI** or **governance** considerations in a wargame setting. ([Professional Wargaming][4])
  * *sepinsky\_modeling\_2020*: when your text proposes **human‑in‑the‑box** AI emulation under constrained I/O or compares to LLM behavior. (WG2 pp. \~53–58.)&#x20;
  * *wheaton\_making\_2020*: when suggesting **argumentation mechanics** for free‑text LLM play (claims/counters/evidence). (WG2 pp. \~44–51.)&#x20;
  * *hanley\_games\_2020*: when cautioning that **equilibrium rationality** may diverge from observed behavior; motivates **experimental** checks with/without LLMs. (WG2 pp. \~59–76.)&#x20;
  * *rensel\_artificial\_2020*: when laying out **practical control‑cell structures** (AI cell, scripted responses, pre‑game workshop). (WG2 pp. \~25–41.)&#x20;
  * *mcgrady\_representing\_2020*: when you need **general background** on representation choices (**model vs abstract vs parity**).&#x20;
  * *ellison\_anything\_2023*: when providing a **balanced** statement of AI’s benefits/limits. ([Professional Wargaming][5])

* **Anti‑overcitation guardrails:**

  * If the sentence is generic (e.g., “AI is changing wargaming”), **prefer** *mcgrady\_representing\_2020* or **skip**.
  * If the sentence is about **LLM adjudication in matrix games**, **prefer** *griffin\_matrix\_2024*, not WG2.
  * If the sentence is about **personas/NPCs**, **prefer** *freeman\_ai\_2024*.
  * If ethics/governance, **prefer** *stolk\_reaim\_2023*.
  * Never assign more than **2** suggestions per paper across the whole repo.

---

### Why these sources (provenance)

* **Matrix Gaming with LLMs** (Griffin & Zhu, 2024) — presentation PDF on Connections UK site; includes the “QuAI Sera Sera” matrix game and LLM adjudication patterns. ([Professional Wargaming][1])
* **AI & Wargaming** (Griffin, 2023) — slide deck discussing LLMs, game asset generation, and AI in negotiation (Diplomacy/CICERO). ([Professional Wargaming][2])
* **AI in Wargaming** (Freeman, 2024) — Conducttr‑focused slides on personas/injects/adjudication with LLMs. ([Professional Wargaming][3])
* **REAIM** (Stolk & de Nooijer, 2023) — ad sheet / magazine note and 2023 program listing on Connections UK site. ([Professional Wargaming][4])
* **Representing AI in Wargames (WG2, 2020)** — full working‑group report (PDF) with chapters by Rensel, Wheaton/Hennessey/Trosky, Sepinsky, Hanley, etc.; quotes and section pointers above are drawn directly from the report text.&#x20;

---

[1]: https://www.professionalwargaming.co.uk/24MatrixGamingWithLLMs.pdf?utm_source=chatgpt.com "Matrix Gaming with Large Language Models"
[2]: https://www.professionalwargaming.co.uk/23-AI-LewisGriffin.pdf?utm_source=chatgpt.com "AI & Wargaming"
[3]: https://www.professionalwargaming.co.uk/24AIinWargaming-AmeliaFreeman.pdf?utm_source=chatgpt.com "Conducttr Crisis Simulation Platform"
[4]: https://www.professionalwargaming.co.uk/REAIMAdSheet.pdf?utm_source=chatgpt.com "a wargame about Responsible Artificial Intelligence in the ..."
[5]: https://www.professionalwargaming.co.uk/23AIDeepDive-GeorgeEllison.pdf?utm_source=chatgpt.com "“Anything you can do, AI can do better”?"


```ris
TY  - CONF
TI  - Matrix Gaming with Large Language Models
AU  - Griffin, Lewis D.
AU  - Zhu, Boyu
PY  - 2024
PB  - Connections UK
CY  - Connections UK (presentation)
UR  - https://www.professionalwargaming.co.uk/24MatrixGamingWithLLMs.pdf
N1  - Presentation (slide deck). BLUF: Shows how LLMs can act as players or an adjudicator in matrix games; includes an example scenario and facilitation patterns for free-text argument/adjudication.
ID  - griffin_matrix_2024
ER  -

TY  - CONF
TI  - AI & Wargaming
AU  - Griffin, Lewis D.
PY  - 2023
PB  - Connections UK
CY  - Connections UK (presentation)
UR  - https://www.professionalwargaming.co.uk/23-AI-LewisGriffin.pdf
N1  - Presentation (slide deck). BLUF: Primer on LLMs for wargaming, including asset generation and negotiation/dialogue agents (e.g., Diplomacy/CICERO) relevant to matrix-style play.
ID  - griffin_ai_2023
ER  -

TY  - CONF
TI  - AI in Wargaming
AU  - Freeman, Amelia
PY  - 2024
PB  - Connections UK
CY  - Connections UK (presentation)
UR  - https://www.professionalwargaming.co.uk/24AIinWargaming-AmeliaFreeman.pdf
N1  - Presentation (slide deck). BLUF: Production-focused examples of LLM use for AI personas, dynamic narrative injects, and early adjudication; emphasizes SME prompting and human oversight.
ID  - freeman_ai_2024
ER  -

TY  - CONF
TI  - “Anything you can do, AI can do better”? Deep Dive Panel: AI in Wargaming
AU  - Ellison, George
PY  - 2023
PB  - Connections UK
CY  - Connections UK (panel)
UR  - https://www.professionalwargaming.co.uk/23AIDeepDive-GeorgeEllison.pdf
N1  - Panel / presentation. BLUF: Balanced assessment of where AI helps (design/execution/analysis) and where human judgment remains essential.
ID  - ellison_anything_2023
ER  -

TY  - CONF
TI  - REAIM: a wargame about Responsible Artificial Intelligence in the Military Domain
AU  - Stolk, Diederik
AU  - de Nooijer, Ivo
PY  - 2023
PB  - Connections UK
CY  - Connections UK (ad sheet / report)
UR  - https://www.professionalwargaming.co.uk/REAIMAdSheet.pdf
N1  - Ad sheet / brief report. BLUF: Facilitated, multi-team game embedding responsible-AI considerations into adversarial play.
ID  - stolk_reaim_2023
ER  -

TY  - CHAP
TI  - Modeling Artificial Intelligence in Wargames: Human in the Box
AU  - Sepinsky, Jeremy
BT  - Representing Artificial Intelligence in Wargames: Working Group 2 Proceedings
ED  - McGrady, E. D.
ED  - Peachey, Justin
PY  - 2020
PB  - Connections US
UR  - https://connections-wargaming.com/wp-content/uploads/2021/02/representing-artificial-intelligence-in-wargames.pdf
N1  - Chapter. BLUF: A 'human-in-the-box' method to emulate AI decision-making via constrained human role-play; setup and trade-offs.
ID  - sepinsky_modeling_2020
ER  -

TY  - CHAP
TI  - Making the Case for a Bigger, Better Widget
AU  - Wheaton, Kristan J.
AU  - Hennessey, Megan
AU  - Trosky, Abram
BT  - Representing Artificial Intelligence in Wargames: Working Group 2 Proceedings
ED  - McGrady, E. D.
ED  - Peachey, Justin
PY  - 2020
PB  - Connections US
UR  - https://connections-wargaming.com/wp-content/uploads/2021/02/representing-artificial-intelligence-in-wargames.pdf
N1  - Chapter. BLUF: Introduces argumentation mechanics (claims, counters, evidence) for structuring free-text play.
ID  - wheaton_making_2020
ER  -

TY  - CHAP
TI  - Games, Game Theory, and Artificial Intelligence
AU  - Hanley, John T., Jr.
BT  - Representing Artificial Intelligence in Wargames: Working Group 2 Proceedings
ED  - McGrady, E. D.
ED  - Peachey, Justin
PY  - 2020
PB  - Connections US
UR  - https://connections-wargaming.com/wp-content/uploads/2021/02/representing-artificial-intelligence-in-wargames.pdf
N1  - Chapter. BLUF: Links game theory and AI, noting divergence between normative solutions and human behavior — motivates experimental approaches.
ID  - hanley_games_2020
ER  -

TY  - CHAP
TI  - Artificial Intelligence – A Wargame Asset
AU  - Rensel, Dennis J.
BT  - Representing Artificial Intelligence in Wargames: Working Group 2 Proceedings
ED  - McGrady, E. D.
ED  - Peachey, Justin
PY  - 2020
PB  - Connections US
UR  - https://connections-wargaming.com/wp-content/uploads/2021/02/representing-artificial-intelligence-in-wargames.pdf
N1  - Chapter. BLUF: Proposes integration routes for AI in games (AI cell, scripted response sets, pre-game workshop).
ID  - rensel_artificial_2020
ER  -

TY  - BOOK
TI  - Representing Artificial Intelligence in Wargames: Working Group 2 Proceedings
AU  - McGrady, E. D.
AU  - Peachey, Justin
PY  - 2020
PB  - Connections US
UR  - https://connections-wargaming.com/wp-content/uploads/2021/02/representing-artificial-intelligence-in-wargames.pdf
N1  - Edited proceedings (Working Group 2). BLUF: Framing paper on model/abstract/ignore choices for representing AI in wargames.
ID  - mcgrady_representing_2020
ER  -
```