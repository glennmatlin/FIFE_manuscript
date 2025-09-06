# Repository Guidelines

## Project Structure & Module Organization
- `iff/`: Typst source for the Instruction-Following paper (`main.typ`, figures, tables, `template.typ`, bibliography).
- `wopr/`: Typst source and assets for the WOPR document (`main.typ`, fonts, CSL, images).
- `citations/`: Reference papers and exported artifacts (LaTeX projects, PDFs, HTML, notes).
- Root: `README.md`, repo configs, and this guide.

## Build, Test, and Development Commands
- Build IFF: `typst compile iff/main.typ` → outputs `iff/main.pdf`.
- Build WOPR: `typst compile wopr/main.typ` → outputs `wopr/main.pdf`.
- Watch and rebuild: `typst watch iff/main.typ` or `typst watch wopr/main.typ`.
- Clean PDFs: `rm -f iff/main.pdf wopr/main.pdf`.
- Prereq: install a recent `typst` and ensure it’s in `PATH` (`typst --version`).

## Coding Style & Naming Conventions
- Typst: 2-space indentation; wrap lines around ~100 chars; prefer semantic variables/functions over inline styling.
- Entry points: keep document roots named `main.typ`; share components via `template.typ` or `logo.typ`.
- Assets: lowercase, hyphenated filenames (e.g., `intro-fig.svg`, `table-benchmark.svg`).
- Fonts: keep in their respective folders; do not rename vendor filenames.

## Testing Guidelines
- Build check: `iff/main.typ` and `wopr/main.typ` must compile without warnings.
- Visual changes: include before/after screenshots (or succinct notes) in PRs for layout/figure tweaks.
- References: after editing `.bib` or `csl`, verify citation rendering and links in the generated PDFs.

## Commit & Pull Request Guidelines
- Commits: imperative, small, and scoped (e.g., `typst: refactor table composition`, `fig: update creativity quadrants`).
- Separate binary asset updates from `.typ` edits.
- PRs: include a summary, affected files/sections, build instructions and results (paste `typst compile …` output), and screenshots for visual changes; link related issues and request review from owners of `iff/` or `wopr/` as appropriate.

## Security & Configuration Tips
- Prefer compressed SVG/PNG; avoid committing unnecessary fonts; consider Git LFS for large new assets.
- Ensure redistribution rights for added fonts/images; include attribution when required.
- Reproducibility: note the Typst version used in PRs that change layout or rendering.

