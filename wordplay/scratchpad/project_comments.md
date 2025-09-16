
# Project Comments

This file contains a list of all the TODO, NOTE, and RIEDL style comments found in the project's `.typ` files.

---

### `/home/gmatlin/Codespace/fhwagads/wopr/content/01_introduction.typ`

*   **L20:** `((TODO: the following text was taken out of the abstract and could possibly be incorporated into the introduction/background areas or other parts of the paper. The content is here: '''This new generation of _Artificial Intelligence (AI) in wargames_ relies more on *creative* problem-solving and reasoning over *analytical* rigor and precision. However, there have been significant hurdles for AI researchers when publishing in this field due to the domain-specific and knowledge-intensive requirements of professional wargaming. We present a scoping literature review of #num_papers recent works on AI in wargames and present a novel ontology for researchers to engage with AI wargaming. We provide a discussion for researchers on how to use our ontology to appropriately categorize their own game environment and discover new literature ...(TODO)... This paper provides a consolidated look at this emerging area ...(TODO)... and provides clear direction for other researchers to pursue. Our goal is to encourage responsible experimentation with LMs in wargaming and adjacent, language‑centric simulations. ... LMs are particularly useful for wargames with open-ended dynamic problems and when entirely novel actions and solutions can be proposed.'''))`
*   **L26:** `((RIEDL: Consider "AI wargames" vs. "AI in wargames". I am thinking the latter is more appropriate, so lets ensure we use this consistently throughout))`
*   **L29:** `((RIEDL: that... ))`
*   **L30:** `((RIEDL: any others?))`
*   **L30:** `((RIEDL: footnote maybe about D&D here? or ending of entertainment strictly i.e. D&D))`
*   **L52:** `((RIEDL: What do we do in this paper? We present an ontology, and why. We present research questions. What else.))`

---

### `/home/gmatlin/Codespace/fhwagads/wopr/content/02_background.typ`

*   **L11:** `((TODO: possible to add a bullet here to limit definition to serious games by implying we draw data for real world use or learning etc))`
*   **L62:** `((RIEDL: can we cite some of Jonathan Balloch's novelty work?
GLENN TODO: use jonathan's citations 
))`
*   **L88:** `((TODO:CITE RAND!))`
*   **L89:** `((TODO: Glenn needs to write here about the defintion of AI used, how it informed out survey scope, and then update the appendix survey definition etc. we should also link the appendix here as well!))`

---

### `/home/gmatlin/Codespace/fhwagads/wopr/content/03_related_works.typ`

*   **L3:** `((TODO: explaining that related work means other literature reviews.))`
*   **L4:** `(( TODO CITE: LLM as a Mastermind: A Survey of Strategic Reasoning with Large Language Models; A Survey on Large Language Model-Based Game Agents; Large Language Models and Games: A Survey and Roadmap; LLM as a Mastermind: A Survey of Strategic Reasoning with Large Language Models;  Playing games with Large language models: Randomness and strategy; SPIN-Bench: How well do LLMs plan strategically and reason socially?; A Survey on Game Playing Agents and Large Models: Methods, Applications, and Challenges; A Survey on Large Language Model-Based Social Agents in Game-Theoretic Scenarios; Can Large Language Models Serve as Rational Players in Game Theory? A Systematic Analysis))`

---

### `/home/gmatlin/Codespace/fhwagads/wopr/content/04_methodology.typ`

*   **L3:** `((TODO: CITE the papers i read on survey reviews here!'))`
*   **L5:** `((TODO: properly link this to the right appendix section using typst functionality))`

---

### `/home/gmatlin/Codespace/fhwagads/wopr/content/05_results.typ`

*   **L4:** `((Choose one:
- is incomplete because it does not consider the fact that the adjudicator can also have varying degrees of constrained or creative decision-making
- conflates the player and the adjudicator.))`
*   **L9:** `((Justifying the need to consider players and adjudicators independently. It's actually a bit challenging, because increased linguistic flexibility on the player side seems to require increased linguistic flexibility, so I need to find counter examples.))`
*   **L15:** `((NOTE: or another example))`
*   **L24:** `((NOTE: could use the term extra-diagetically))`
*   **L24:** `((NOTE: Writing this, I wonder if it's the mapping that is creative as opposed to the actual surface form of the ajudicator's output response.))`
*   **L27:** `((NOTE: I don't really understand what is going on in this paragraph.))`
*   **L33:** `((RIEDL: I would like to see a lot of examples of games in the quadrant sections. I'm skipping reading Q1-Q4 for now.))`
*   **L35:** `(( TODO: We need to add the (1) Time analysis: annual volume and venue mix, (2) Paper stats: LM families, roles, formats, artifacts released, (3) Figures: open‑endedness quadrants and representative placements. ))`
*   **L90:** `((RIEDL: I'm not sure why this has to be a separate section from 4.4))`
*   **L132:** `((RIEDL: I'm not sure why this has to be a separate section from 4.4. If things get complex to read, then 4.5 and 4.6 could be 4.4.1 and 4.4.2.))`

---

### `/home/gmatlin/Codespace/fhwagads/wopr/content/06_discussion.typ`

*   **L68:** `((TODO: Dark winter and other wargames))`

---

### `/home/gmatlin/Codespace/fhwagads/wopr/content/07_safety.typ`

*   **L25:** `((RIEDL: I wonder if there is another concern that has to do with sensitivity to system prompt. This is a form of biasing of outputs. I'll see if I can come up with an example or articulate this better. It's similar to how xAI biases Grok with their system prompt "be skeptical of trust mainstream media"))`
*   **L32:** `((RIEDL: I'm unclear of what "interpretation of wargames" means or is getting at. I do think it is bringing out some more vulnerabilities. One seems to be stereotypes, which is maybe a variant on implicit biases, but applied to roles (the TV version of a soldier as opposed to what a soldier is really like). Another seems to be that post-training can run contrary to the goals of the wargame. The example I think that is being used here is training to be helpful, which is not always appropriate if the LLM needs to be the red-team. Same with harmless and honest. Perhaps the thing to do is to lean into the HHH assumptions of post-training and talk about how implicit assumptions about HHH can mean wargames are not always good representations about how courses of action will unfold in the real world.))`

---

### `/home/gmatlin/Codespace/fhwagads/wopr/content/09_future_work.typ`

*   **L9:** `((Riedl: planning; ability to explore alternatives; world models))`
