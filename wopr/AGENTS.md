# Repository Guidelines

## Project Structure & Module Organization
- `iff/`: Typst source for the Instruction-Following paper (`main.typ`, figures, tables, template, bibliography).
- `wopr/`: Typst source and assets for the WOPR document (`main.typ`, fonts, CSL, images).
- `citations/`: Reference papers and exported artifacts (LaTeX projects, PDFs, HTML, notes).
- Root: `README.md`, repo configs, and this guide (`AGENTS.md`).

## Build, Test, and Development Commands
- Build IFF paper: `typst compile iff/main.typ` → `iff/main.pdf`.
- Build WOPR doc: `typst compile wopr/main.typ` → `wopr/main.pdf`.
- Watch and rebuild: `typst watch iff/main.typ` or `typst watch wopr/main.typ`.
- Clean PDFs: `rm -f iff/main.pdf wopr/main.pdf`.
- Prereq: Install a recent Typst CLI and ensure `typst` is on `PATH` (`typst --version`).

## Coding Style & Naming Conventions
- Typst: 2 spaces indentation; wrap lines near 100 chars; prefer semantic variables/functions over inline styling.
- Entrypoints remain `main.typ`; shared components live in `template.typ`, `logo.typ`, or folder-local includes.
- Asset names: lowercase with hyphens (e.g., `intro-fig.svg`, `table-benchmark.svg`).
- Fonts: keep in their respective folder; do not rename vendor filenames.

## Testing Guidelines
- Build check: both `iff/main.typ` and `wopr/main.typ` must compile without warnings.
- Visual diff: when changing layouts/figures, include quick before/after screenshots (or brief notes) in the PR.
- References: after edits to `.bib` or `csl`, verify citations render correctly and links resolve in the generated PDFs.

## Commit & Pull Request Guidelines
- Commits: small, scoped, imperative mood (e.g., `typst: refactor table composition`, `fig: update creativity quadrants`).
- Separate binary asset changes from `.typ` edits.
- PRs: include a summary, affected files/sections, exact build commands and results (paste `typst compile …` output), and screenshots for visual changes.
- Link related issues; request review from document owners for the relevant subfolder (`iff/` or `wopr/`).

## Security & Configuration Tips
- Prefer compressed SVG/PNG; avoid committing unnecessary fonts. Consider Git LFS for large new assets.
- Ensure licensing for added fonts/images; include attribution if required.
- For layout/render changes, note the Typst version used in the PR (`typst --version`).

