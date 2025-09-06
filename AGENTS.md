# Repository Guidelines

## Project Structure & Module Organization
- `iff/`: Typst source for the Instruction-Following paper (`main.typ`, figures, tables, template, bibliography).
- `wopr/`: Typst source and assets for the WOPR document (`main.typ`, fonts, CSL, images).
- `citations/`: Reference papers and exported artifacts (LaTeX projects, PDFs, HTML, text notes).
- Root: `README.md`, repo configs, and this guide.

## Build, Test, and Development Commands
- Build IFF paper: `typst compile iff/main.typ` (outputs `iff/main.pdf`).
- Build WOPR doc: `typst compile wopr/main.typ` (outputs `wopr/main.pdf`).
- Watch and rebuild: `typst watch iff/main.typ` or `typst watch wopr/main.typ`.
- Clean generated PDFs: `rm -f iff/main.pdf wopr/main.pdf`.

Ensure a recent `typst` CLI is installed and accessible in `PATH`.

## Coding Style & Naming Conventions
- Typst style: 2 spaces for indentation; wrap lines ~100 chars; prefer semantic variables and functions over inline styling.
- File names: use lowercase with hyphens for assets (e.g., `intro_fig.svg`, `table-benchmark.svg`).
- Keep document entry points named `main.typ`; shared components live in `template.typ` or `logo.typ`.
- Fonts: keep font files in their respective folder; do not rename vendor filenames.

## Testing Guidelines
- Build check: both `iff/main.typ` and `wopr/main.typ` must compile without warnings.
- Visual diff: when changing layouts/figures, include before/after screenshots (or brief notes) in the PR.
- References: after edits to `.bib` or `csl`, verify citations render correctly and links resolve in the generated PDF.

## Commit & Pull Request Guidelines
- Commits: imperative mood, scoped and small (e.g., `typst: refactor table composition`, `fig: update creativity quadrants`).
- Group binary asset changes in separate commits from `.typ` edits.
- PRs: include a summary, affected files/sections, build instructions and results (`typst compile …` output), and screenshots for visual changes.
- Link related issues/tasks; request review from document owners for the relevant subfolder (`iff/` or `wopr/`).

## Security & Configuration Tips
- Large binaries: prefer compressed SVG/PNG; avoid committing unnecessary fonts. Consider Git LFS for new large assets.
- Licensing: ensure added fonts/images have redistribution rights; include attribution when required.
- Reproducibility: note Typst version used (e.g., `typst --version`) in PRs that change layout or rendering.
