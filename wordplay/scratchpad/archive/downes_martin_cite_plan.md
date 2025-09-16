Purpose. You are helping me place targeted citations—no citation dumping. For each paper in the attached JSONL knowledge base, find at most 2 strong, context-specific opportunities across my Typst (`*.typ`) manuscript(s) to cite the work. Prefer claims, design choices, methods, definitions, or cautions that the paper uniquely supports. Skip a paper if you cannot find a genuinely good fit.

Corpus. Recursively scan the project folders for `*.typ` files. Parse Typst markup to extract plain text (ignore layout commands/macros). Build an index of sections, headings, and paragraphs.

Citation syntax. Use Typst’s default inline citation style `@<citation_key>`. If my files use an alternative (e.g., `#cite(<key>)`), mirror the existing local style.

Knowledge base. Load the JSONL provided below. Each record includes:
`citation_key, title, year, authors, venue, doi_or_arxiv, url, bluf, ai_wargame_relevance, triggers, use_when, regex_cues, priority`.

Method (do this for each paper, in descending `priority`):
1. Surface matches. Search the indexed manuscript for the paper’s `regex_cues` and `triggers` (case-insensitive). Also search synonyms (e.g., adjudication → umpiring, control; deception → maskirovka, misinformation; in-stride → continuous adjudication).
2. Score candidates. A good match will either (a) make or rely on a specific methodological point (e.g., in-stride adjudication, swarm/parallel iterations, preference reversal in AARs), (b) make a design choice for open-ended, language-based or AI-assisted games, or (c) state a risk/caution (group dynamics, senior stakeholder interference) the paper directly addresses.
3. De-duplicate. If a location already cites the same work or an equivalent canonical source, skip it unless the match is clearly stronger.
4. Select max two opportunities per paper (zero is OK). Prefer high-leverage paragraphs (definitions, methodological prescriptions, research design, evaluation/validity, AARs) over generic narrative.
5. Propose insertion. For each selected opportunity, output a suggestion block with:
   - `file` (relative path),
   - `section` (if available),
   - `excerpt` (1–3 sentences of local context),
   - `suggestion` (e.g., “append `@downes_martin_adjudication_2013` after ‘…adjudication decisions…’”),
   - `why_this_fits` (≤40 words referencing the paper’s `bluf`/`ai_wargame_relevance`),
   - `type` (method, design, caution, definition, background),
   - `confidence` (0–1).

Output format. Return a single JSON array of suggestion objects. Ensure no paper produces more than two suggestions overall.

Quality gates.
- Avoid vague “background” cites unless the paragraph actually introduces the topic covered by the paper.
- Favor claims that would benefit from external authority or methods readers might adopt.
- When in doubt, don’t add a citation. Precision over quantity.


---
What to cite first (Top picks for AI & LLMs in open-ended language-based wargames)

Wargaming to Support Force Development (2025) — explicitly calls for “the full arsenal of AI techniques (not just LLMs!) to model human behaviors” in manual/simulation-supported games and ties this to repeated gaming + Monte Carlo/optimization. Great anchor for why and how to weave AI/LLMs into open-ended games while keeping humans central.

Executed Deception Wargaming Using Deterrence Wargaming as a Model (2025) — design patterns for executed deception (players deceiving players), with analysis scaffolding (DCAP) and inductive adjudication—perfect for LLM-mediated deception experiments or guardrails.

In-Stride Adjudication Working Group Report (2018) + Swarm Gaming approach — argues for many small, repeated, parallel sub-games with rotating roles; maps cleanly to LLM-assisted micro-iterations and rapid exploration in language-driven seminar games.

Adjudication: The Diabolus in Machina of Wargaming (2013) — foundational: adjudicators are dominant players in novel problems; collect and analyze adjudicator decisions. Essential when LLMs assist or sit “behind the screen.”

Preference Reversal Effects and Wargaming (2020) — shows how final plenaries and AARs can inadvertently or deliberately reverse game insights; offers fixes. Use when designing evaluation protocols for language-based games and LLM-generated evidence.

Your Boss, Players, and Sponsor: The Three Witches of Wargaming (2014) — governance & interference risks from seniors/players/sponsors; relevant to model oversight and to justify process discipline with AI tools.

Distributed Wargaming Working Group Final Report (2021) — principles & lessons for online/hybrid wargames; applicable to LLM-mediated remote play and tooling.

At the Intersection of Simulation and Wargaming: Standards and Concepts for Next-Gen Wargaming (2023) — bridges wargaming with M&S standards; helpful when integrating LLM components with simulation back-ends.

---

Force Development (2025) explicitly recommends “research and experimentation into using the full arsenal of AI techniques (not just LLMs!) to model human behaviors … in both manual wargames and simulation,” and urges repeated gaming linked to Monte Carlo/optimization—ideal rationale for LLM-assisted, open-ended games.

Deception (2025) distinguishes modeled vs executed deception, proposes DCAP-based analysis, and frames design questions sponsors must answer—useful for LLM-mediated deception experiments and safeguards.

In-Stride Adjudication (2018) documents swarm gaming—“replace seminar game with many parallel repeated smaller sub-games; rotate players through roles, including adjudication”—a natural fit for LLM-assisted micro-iterations.

Adjudication (2013) argues adjudicators are dominant players in novel problems and must be treated as such in data collection/analysis—critical when LLMs assist adjudication.

Preference Reversal (2020) shows how final plenaries/AARs can reverse or hide insights and how to counter it—exactly where LLM-generated notes/summaries need protocol discipline.

Three Witches (2014): governance for boss/players/sponsor interference—useful to define model + human role boundaries.

Distributed WG (2021): frameworks for remote/hybrid procedures and tooling—applicable to LLM-mediated distributed play.

Intersection with Simulation (2023): provides standards/interop entry points when connecting LLMs to simulations.

(Background AI lineage)

Managing Uncertainty… (1992) — Elsevier DOI; plan evaluation under uncertainty & time pressure.

Two AI Languages for Simulation (1990) — ACM record + DOI.

VR for Cross-Cultural Communication (1992) — SPIE DOI; mediation of understanding in training.