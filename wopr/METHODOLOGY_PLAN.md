# Methodology Plan for Revising the Wargaming Manuscript

This document records the full methodology we will follow to revise, clean, expand, and improve the paper and its associated artifacts. It mirrors the structure shared in the assistant’s output and is preserved here for iterative reference.

## Concise Summary
The manuscript is a scoping review and practice-oriented guide on using language models (LMs) as players and adjudicators in open-ended, language-based wargames. It proposes a two-axis framing (Analytical vs Creative for players and adjudicators), surveys recent systems and studies, and drafts desiderata for safe, transparent, and reproducible use. Strengths include a solid framing, safety orientation, and data-extraction schema. Weaknesses include placeholders in the abstract and sections, inconsistent tone, missing screening counts, incomplete figure captions, and unsupported claims needing citations. Priority: finalize Methods (queries, window, counts), harmonize tone, tighten Related Work/Discussion with citations, and strengthen reproducibility guidance.

## Section-by-Section Plan

1. Title
- Current: accurate but long; normalize “wargames”.
- Fix: concise alternative titles provided.

2. Abstract
- Issues: placeholders, missing N and time window.
- Fix: add screening counts and explicit contributions; remove notes.
- Example rewrites included.

3. Introduction
- Issues: unsupported claims; inconsistent tone.
- Fix: anchor with Hogan & Brennen (2024), Meta FAIR (2022); define “open-ended” and contributions.

4. Related Work
- Issues: thin synthesis; escalation and adjudication links missing.
- Fix: add Rivera et al. (2024), Lamparth et al. (2024), adjudication sources; HAI vs A2A contrast.

5. Methodology (SLR)
- Issues: missing dates, queries, counts, screening details.
- Fix: finalize Kitchenham SLR steps; map to `wargames_survey_*.csv`; replace `#num_papers`.

6. Results
- Issues: figure/table captions lack N/source; Q4 analysis not grounded in examples.
- Fix: add caption metadata; link CSV rows to quadrant examples.

7. Discussion
- Issues: claims on A2A scarcity and persuasion lack citations.
- Fix: cite Diplomacy negotiation and red-teaming; mark sycophancy/CoT as needs lookup if not provided.

8. Methodology Section (manuscript)
- Fix: standardize subsections (Search Strategy, Dedup, Screening, Extraction, Limitations).

9. Safety Considerations
- Fix: tie escalation statements to Rivera et al. (2024); add red-team checklist citation.

10. Desiderata
- Fix: include minimal artifact bundle and evaluation rubric examples.

11. Conclusions
- Fix: synthesize key findings; state limitations and next steps.

12. Impact Statement
- Fix: scoped impact; reiterate oversight.

13. Appendices
- Fix: finalize queries/dates/screening steps in Appendix B; align terms in Appendix A.

14. Figures and Tables
- Fix: add source, N, date, mapping rules to captions; standardize layout.

15. Code and Reproducibility Notes
- Fix: record Typst version and build commands; artifact list; seeds and parameters if experiments are added.

## Tone & Style Harmonization
- Formal, neutral technical tone; avoid em dashes and rhetorical effects; avoid over-claims.
- Examples for conversions provided in working notes.

## Citation Insertions (from existing `zotero.bib`)
- Hogan & Brennen 2024: Open-ended LM wargames system “Snow Globe” — supports LM roles. BibTeX key: `hogan_open-ended_2024`.
- Meta FAIR 2022: Diplomacy negotiation agent — supports negotiation and language-based strategic play. Keys: `meta_fundamental_ai_research_diplomacy_team_fair_human-level_2022` (merge duplicates).
- Rivera et al. 2024: Escalation risks in LM simulations — supports safety section.
- Lamparth et al. 2024: Human vs LM behavior in crisis wargame — supports comparative claims.
- Adjudication literature: use existing entry “Adjudication: the diabolus in machina of wargaming”.

Missing entries
- “Shrivastava et al. 2024” not found in `zotero.bib` — needs lookup or removal.
- Sycophancy and CoT unfaithfulness sources — needs lookup if required.

## Reproducibility Checklists
- SLR: time window; queries; sources; dedup keys; screening protocol; extraction schema; CSV path; screening counts.
- Experiments (if added): model/version; parameters; seeds; trials; hardware or API; evaluation rubric; logging; sharing policy.

## Figures/Tables Instructions
- Captions must include source path, N, date, mapping rules; for model summaries, list models and versions.
- Example caption pattern provided in working notes.

## Bibliography Hygiene
- Merge FAIR Diplomacy duplicates; prefer DOI; standardize arXiv fields.
- Maintain “needs lookup” markers for missing items.

## Risks & Ethics
- Clarify non-operational use; document limits; provenance and oversight.

## Task List (with effort)
- High: Abstract/Intro edit (med); Methods+screening counts (med); citations pass (med); captions/data statements (small).
- Medium: Safety+checklist (small); desiderata checklists (small); bib hygiene (small).
- Low: Appendices finalization (small); optional plots (med).

Edit notes (2025-09-09)
- Replace LLM with LM per project terminology.
- Remove PRISMA references; we use process-step screening only.

## Change Log Format
- [YYYY-MM-DD] Section: summary; rationale; files touched.

## Test Checklist
- `typst compile wopr/main.typ` builds without warnings; `typst --version` recorded.
- No missing citations; `#num_papers` replaced; captions updated.
