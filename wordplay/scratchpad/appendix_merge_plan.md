# Appendix Merge and Restructure Plan

This document outlines the plan for merging `appendix_A.typ` and `appendix_C.typ` into a single, coherent appendix.

### Phase 1: Consolidation and Setup

The goal of this phase is purely mechanical: to get all the text into a single file for editing.

1.  **Read Both Appendices:** Read the full, up-to-date content of `content/appendix_A.typ` and `content/appendix_C.typ`.
2.  **Create a Unified Working File:** Overwrite `content/appendix_A.typ` with the complete text of the current Appendix C, followed by a clear separator, and then the complete text of the current Appendix A.
3.  **Clean Up Project Structure:** Delete `content/appendix_C.typ` and update `main.typ` to remove the now-obsolete include statement for Appendix C.

### Phase 2: Analysis, Restructuring, and Refinement

This phase involves the analytical work of merging and rewriting the content.

1.  **Establish Narrative Framework:** Use the structure from the former Appendix C (organized by domain) as the primary backbone for the new appendix.

2.  **Detailed Integration Plan:**
    *   **`== Social Games`:** Keep this as a standalone introductory section in the new appendix, possibly retitled to `== A Note on Wargames vs. Social Deduction Games`, to frame the subsequent domain discussions.
    *   **`== Economics and Finance` (The Core Merge):** Perform a "surgical merge." Use the text from Appendix C as the base, and then meticulously integrate the valuable, non-redundant details and specific examples from Appendix A's pedagogical subsections. The goal is a single section that is richer than C but more concise than A.
    *   **`== Human-Agent Interactions (HAI) vs Agent-Agent Interactions (A2A)`:** Place this as the *final* section of the unified appendix. It serves as a cross-cutting, forward-looking theme that concludes the detailed discussions.

3.  **Final Review:** After restructuring, perform a final editorial pass on the entire merged appendix to ensure consistent tone, smooth transitions, and eliminate any remaining minor redundancies.
