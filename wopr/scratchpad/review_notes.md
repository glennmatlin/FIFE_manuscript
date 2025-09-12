# Reviewer and Author Notes (Migrated)

This file preserves inline drafting notes that were removed from `wopr/main.typ` to keep the manuscript clean. Notes are grouped with lightweight IDs and a pointer to the relevant section. Keep this file out of the compiled PDF.

- RLW-01 — Related Work guidance (Other surveys)
  - Location: Related Work → other lit reviews, after synthesis paragraph.
  - Note: Include a brief comparison to prior surveys; gently articulate deficiencies (e.g., lack of experiments, overly broad scope, dated coverage) to motivate this paper’s focus.

- RLW-02 — Methodology ordering for review
  - Location: Transition into Results.
  - Note: Present a short methodology overview early for reviewers (screening, inclusion/exclusion), with details in appendices.

- RLW-03 — Input vs. output spaces
  - Location: Results preface (conceptual framing).
  - Note: Mention semantic differences between input/output spaces in language‑centric systems and why this affects evaluation and reproducibility.

- RLW-04 — “Serious games” terminology caution
  - Location: Quadrants → “Why Q4 matters for analysis”.
  - Note: Be defensive about “serious games” usage; emphasize decision‑making contexts (defense/policy/organizational) to avoid confusion with educational/tutoring games.

- Q4-WS-01 — Phrase polishing
  - Location: Quadrants → “Why Q4 matters for analysis”.
  - Note: Workshop wording for the Q4 motivation paragraph during final polish.

- Q4-IM-01 — Automation benefits TODO
  - Location: Quadrants → after PEFT/ICL discussion.
  - Note: Consider adding a sentence on the marginal benefits of automating human effort (cost/time trade‑offs, reproducibility).

- CIT-01 — Placeholder citations
  - Location: Appendix A → Social Games; Related Work and Background.
  - Note: Replace numeric placeholders with Typst citekeys once `refs.bib` is added; wire bibliography via `#bibliography("refs.bib", style: "association-for-computational-linguistics-blinky.csl")`.

- SCOPE-01 — Failure‑mode vocabulary
  - Location: Appendix B (removed definition).
  - Note: We intentionally removed “failure mode” vocabulary to align with the paper’s scope; re‑add only if needed for appendix‑only reporting.

