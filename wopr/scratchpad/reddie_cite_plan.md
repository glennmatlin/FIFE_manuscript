# Prompt
You are a careful research assistant working in a Typst project. Your job is to
propose at most **1–2 high-value citation insertions PER PAPER** (no more) across
the entire repository, using context from a companion file `papers.jsonl`.

### Inputs
- Paper context: `papers.jsonl` (JSON Lines; one object per paper with keys like
  paper_id, bluf, keywords, best_fit_citations[*].trigger_phrases, bibtex_key, url).
- Source files: all `./**/*.typ` (Typst).
- Bibliography: search for an existing `.bib` (e.g., `refs.bib`); Typst citations are
  written as `[@citation_key]`.

### Hard constraints
1) **No flooding.** For each paper, suggest **≤ 2** total insertions across the entire repo.
2) **Justified matches only.** Insert a citation only when the nearby sentence or
   paragraph makes a claim that the paper directly supports (methods, concepts, or findings).
3) **Prefer method & related-work sections.** If present, target “Methodology,”
   “Experimental Design,” “Evaluation/Measurement,” or “Related Work.”
4) **Don’t touch code blocks or quotations** (triple-backticked blocks or `quote` blocks).
5) **Don’t duplicate** a citation to the same paper in the same paragraph.
6) If the `bibtex_key` isn’t present in the project’s `.bib`, attach a proposed BibTeX
   (from `papers.jsonl` if available) in your output so the user can add it.

### Matching & selection policy
- Build a lightweight index of each `.typ` file (headings → paragraphs).
- For each paper:
  - Compute a semantic match between the paper’s `bluf`/`keywords`/`best_fit_citations`
    and each paragraph; also scan for literal/regex `trigger_phrases`.
  - Rank candidate paragraphs by (semantic_score + trigger_hits + section_priority).
  - Keep the **top 1–2 distinct** locations only, favoring different sections if possible.

### How to propose edits
Output two artifacts:
1) `proposals.jsonl` — one JSON object per proposed insertion:
   {
     "paper_id": "...",
     "file": "path/to/file.typ",
     "paragraph_heading": "Nearest heading in the doc",
     "line_start": <int>,  // 1-based line index of paragraph start (best estimate)
     "insert_after_sentence_idx": <int>, // 0-based sentence index within paragraph
     "insertion": " [@BIBTEX_KEY]",
     "rationale": "Short why-this-is-a-good-fit justification.",
     "evidence": "Which phrase/claim in the paragraph you are anchoring to."
   }

2) `patch.diff` — a unified diff showing the exact `[@BIBTEX_KEY]` insertion points
   (append at end of the matched sentence, before punctuation if the style guide prefers,
   otherwise immediately after with a preceding space).

### Key details for Typst
- Inline cite: `[@key]`  (multiple: `[@key1; @key2]`).
- Leave whitespace as-is; don’t reflow long paragraphs.
- If a bibliography block exists (e.g., `#bibliography("refs.bib")`), do not modify it.

### Validation before you finish
- For each proposed `@key`, scan the `.bib` to confirm the entry exists.
  - If missing, add `"inject_bibtex"` to that proposal (a single minimal BibTeX
    from `papers.jsonl`), but **do not** edit files yourself.
- Ensure **no paper** exceeds two proposals total.
- Prefer proposals for **higher-priority** papers (see `priority` in `papers.jsonl`).

Return both files (`proposals.jsonl`, `patch.diff`) and a short summary: the count of
proposals, which files were touched, and any keys that need BibTeX injection.


# Plan: Add 1–2 High-Value Citations per Paper in Typst

## Objective
Use `papers.jsonl` to find **targeted** places across `*.typ` files where each paper
meaningfully supports a claim. Propose ≤2 insertions per paper, never spam.

## Steps
1) **Discover project state**
   - Collect all `./**/*.typ` files (exclude build artifacts).
   - Locate a bibliography file (e.g., `refs.bib`); if missing, note it in the summary.

2) **Index**
   - For each `.typ` file: split into paragraphs under their nearest heading.
   - Skip code/quote blocks.
   - Record paragraph start line indices.

3) **Load paper context**
   - Read `papers.jsonl`. Respect the `priority` field for tie-breaking.
   - For each paper, build a search profile from:
     - `keywords` + each `best_fit_citations[*].trigger_phrases`
     - `bluf` short text

4) **Match candidates**
   - For every paragraph, compute:
     - literal hits for trigger phrases (case-insensitive; stemmed),
     - semantic similarity (sentence-BERT or your embedding model) between
       paragraph and `bluf`+`keywords`.
   - Score = 1.0*semantic + 0.5*phrase_hits + 0.3*section_bonus
     - `section_bonus`: Method/Eval/Related Work = +0.3; Intro/Background = +0.15.

5) **Select minimal set**
   - For each paper: pick the **top 1–2 distinct paragraphs** (prefer different files/sections).
   - Ensure **no duplicate** citation to the same paper within a single paragraph.

6) **Resolve citation keys**
   - Try to confirm `bibtex_key` exists in `.bib` (string match on `@...{KEY,`).
   - If missing, copy that paper’s minimal BibTeX (if stored) or construct from
     the `url/title/authors/year` in `papers.jsonl` and attach it to the proposal
     as `"inject_bibtex"` (do **not** mutate files yourself).

7) **Compose proposals**
   - Insert `[@KEY]` at the end of the best-matching **sentence** within the paragraph
     (or before punctuation—follow your project style).
   - Produce:
     - `proposals.jsonl` (one line/object per insertion; include rationale + evidence)
     - `patch.diff` (unified diff of the exact insertions)

8) **Quality checks**
   - **Hard cap:** max 2 proposals per paper across the repo.
   - Prefer covering **all priority-1 papers** at least once before adding a second.
   - Verify no edits inside code/quote blocks.
   - Output a summary listing: total proposals, files touched, any missing BibTeX.

## Example proposal object
```json
{
  "paper_id": "booth_reddie_2024_trilemma",
  "file": "sections/method.typ",
  "paragraph_heading": "2.1 Experimental Design",
  "line_start": 118,
  "insert_after_sentence_idx": 1,
  "insertion": " [@BoothReddie2024Trilemma]",
  "rationale": "We are justifying structure to trade off realism and analysis—core claim of Trilemma.",
  "evidence": "Sentence mentions 'balancing realism with repeatable inference'."
}
