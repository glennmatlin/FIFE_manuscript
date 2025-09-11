# Editorial Memory

Purpose: Working memory for iterative revisions of the wargaming manuscript and artifacts. Centralize decisions, open questions, and conventions to keep changes consistent across sections and contributors.

How to use
- Update Decisions when something is settled. Keep short and dated.
- Add new Open Questions with options and a target due date.
- Mirror updates in `LOGBOOK.md` (append-only) for audit trail.
- Reference this file before editing `main.typ`, figures, or `zotero.bib`.

Style and tone
- Target voice: formal, neutral technical, safety-aware. Short, clear sentences.
- Avoid em dashes; prefer commas or parentheses.
- Avoid hype and performance claims without data.
- Preserve author intent; narrow claims when evidence is limited.

Terminology
- Use “wargame”/“wargames”, not “war games”.
- Use “LM” after first expansion to “language model (LM)”.
- Axes: “Analytical” and “Creative” for Player and Adjudicator.

Document structure conventions
- Typst: 2-space indentation; wrap ~100 chars.
- Entry points named `main.typ`; shared components in `template.typ` or `logo.typ`.
- Captions: include data source, N, generated date, mapping rules.

Citation and bibliography
- Primary source: `zotero.bib`.
- Use in-text markers present in Typst. Prefer existing keys; add “needs lookup” notes if missing.
- Hygiene: merge duplicates (e.g., FAIR Diplomacy), prefer DOI/official URLs.

Reproducibility invariants
- Methods: specify time window, queries, dedup keys, screening protocol, data-extraction schema.
- Replace `#num_papers` with final count.
- Figures/tables: state data source (`wargames_survey_*.csv`), N, date, and labeling criteria.
- If experiments are added: record model version, parameters, seeds, trials N.

Open questions (awaiting input)
1) Search time window and final N for `#num_papers`.
2) Provide BibTeX for “Shrivastava et al. 2024” or remove reference.
3) Include CSV-derived plots now or defer to future work.
4) Venue constraints (title length, anonymity, word limits).

Pending tasks (summary)
- High: Abstract/Intro edit; Methods with screening counts; citation pass; captions/data statements.
- Medium: Safety citations and checklist; desiderata checklists; bib hygiene.
- Low: Appendices finalization; optional charts.

Edit notes (2025-09-09)
- Replace LLM with LM per project terminology.
- Remove PRISMA references; we use process-step screening only.
- Keep wargames spelling consistent.

Decision log (append entries)
- [YYYY-MM-DD] Decision, rationale, impacted files.
