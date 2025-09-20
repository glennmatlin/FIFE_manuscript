# Citation Insertions Summary (WOPR)

Date: 2025-09-12

This note records all citation insertions proposed/applied, with file paths, sections, citekeys, and IDs (DOI/arXiv) for quick BibTeX updates.

Artifacts
- lamparth_proposals.jsonl (root)
- lamparth_patch.diff (root)
- reddie_proposals.jsonl (root)
- reddie_patch.diff (root)
- scratchpad/zotero_missing_reddie.bib (ready-to-import for Reddie keys)

Lamparth Set (from lamparth_papers.jsonl)
- File: content/01_introduction.typ
  - Section: Introduction
  - Citekey: @rivera_escalation_2024
  - ID: arXiv:2401.03408
  - Status in zotero.bib: present

- File: content/07_safety.typ
  - Section: Safety Considerations → Known LM Vulnerabilities
  - Citekey: @lamparth_human_2024
  - ID: arXiv:2403.03407
  - Status in zotero.bib: present

- File: content/08_recommendations.typ
  - Section: Recommendations → Robustness testing
  - Citekey: @shrivastava_inconsistency_2024
  - ID: arXiv:2410.13204
  - Status in zotero.bib: missing

- File: content/06_discussion.typ
  - Section: Discussion → Economics and Finance
  - Citekey: @hammond_multi_agent_2025
  - ID: arXiv:2502.14143
  - Status in zotero.bib: missing

Reddie Set (from reddie_papers.jsonl)
- File: content/02_background.typ
  - Section: Creative vs Analytical
  - Citekey: @booth_wargame_2024
  - ID: DOI: unknown; arXiv: none; URL: https://www.mors.org/Publications/MORS-Journal-of-Wargaming
  - Status in zotero.bib: missing

- File: content/02_background.typ
  - Section: Wargames
  - Citekey: @goldblum_integrating_2023
  - ID: DOI: none; arXiv: none; URL: https://www.lawfaremedia.org/article/integrating-art-and-science-wargaming
  - Status in zotero.bib: missing

- File: content/03_related_works.typ
  - Section: Artificial Intelligence in Wargaming
  - Citekey: @letchford_experimental_2022
  - ID: DOI: unknown; arXiv: none; URL: https://www.mors.org/Publications/MOR-Journal
  - Status in zotero.bib: missing

- File: content/03_related_works.typ
  - Section: Literature Reviews on LMs in Games
  - Citekey: @goldblum_wargames_2019
  - ID: DOI: unknown; arXiv: none; URL: https://thebulletin.org/2019/05/wargames-as-experiments-the-project-on-nuclear-gamings-signal-framework/
  - Status in zotero.bib: missing

- File: content/06_discussion.typ
  - Section: International Relations
  - Citekey: @reddie_evidence_2023
  - ID: DOI: 10.1177/00223433221094734
  - Status in zotero.bib: missing

- File: content/07_safety.typ
  - Section: Safety Considerations
  - Citekey: @hersman_under_2020
  - ID: DOI: none; arXiv: none; URL: https://csis-website-prod.s3.amazonaws.com/s3fs-public/publication/200318_UnderNucearShadow_FullReport_WEB.pdf
  - Status in zotero.bib: missing

- File: content/09_future_work.typ
  - Section: Open Research Questions
  - Citekey: @reddie_nextgeneration_2018
  - ID: DOI: 10.1126/science.aav2135
  - Status in zotero.bib: missing

- File: content/09_future_work.typ
  - Section: Open Research Questions
  - Citekey: @reddie_WargamesDataAddressing_2023
  - ID: arXiv:2302.08065
  - Status in zotero.bib: missing

Import Notes
- For the Reddie set, import scratchpad/zotero_missing_reddie.bib into Zotero; it contains minimal entries for all eight keys above (with URLs/DOIs/arXiv where known).
- For the Lamparth set, add two missing entries:
  - @shrivastava_inconsistency_2024 — arXiv:2410.13204
  - @hammond_multi_agent_2025 — arXiv:2502.14143

Convenience (minimal BibTeX for Lamparth missing keys)
```
@inproceedings{shrivastava_inconsistency_2024,
  title={Measuring Free-Form Decision-Making Inconsistency of Language Models in Military Crisis Simulations},
  author={Shrivastava, Aryan and Hullman, Jessica and Lamparth, Max},
  booktitle={NeurIPS 2024 Workshop on Socially Responsible Language Modeling Research (SoLaR)},
  year={2024},
  note={arXiv:2410.13204},
  url={https://openreview.net/forum?id=qZ2CeIaYSu}
}

@techreport{hammond_multi_agent_2025,
  title={Multi-Agent Risks from Advanced AI},
  author={Hammond, Lewis and Chan, Alan and Clifton, Jesse and Hoelscher-Obermaier, Jason and Khan, Akbir and McLean, Euan and Smith, Chandler and Barfuss, Wolfram and Foerster, Jakob and Gavenčiak, Tomáš and others},
  institution={Cooperative AI Foundation},
  year={2025},
  note={arXiv:2502.14143},
  url={https://arxiv.org/abs/2502.14143}
}
```

Checks performed
- Confirmed presence/absence in zotero.bib via key search.
- Verified file layout post-reorg; updated Lamparth patch to new files.

Next steps
- Import scratchpad/zotero_missing_reddie.bib in Zotero.
- Add the two Lamparth BibTeX entries above to zotero.bib (or import them separately).
- After BibTeX updates, apply diffs (lamparth_patch.diff, reddie_patch.diff) and compile.
