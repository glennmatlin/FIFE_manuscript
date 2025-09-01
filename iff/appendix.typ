#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/bloated-neurips:0.7.0": botrule, midrule, neurips2025, paragraph, toprule, url

#pagebreak()
= Appendix: Models
#let prov-col  = 7em
#let fam-col   = 10em
#let id-col    = 16em
#let small-col = 5em
#let notes-col = 8em
#let pad       = (x: 2pt, y: 1.5pt)
#let band-prop = rgb("#eee9fb")
#let band-source = rgb("#f3eee1")
#let band-weight = rgb("#e6eef2")
#figure(
  table(
    columns: (prov-col, fam-col, id-col, small-col, small-col, small-col),
    align: (x, y) => if x in (3,4,5) { right } else { left },
    inset: pad,
    stroke: none,
    toprule,
    table.header([*Provider*], [*Family*], [*Model*], [*MaxTok*], [*Temp*], [*Top-p*]),
    midrule,

    // Closed-source LMs
    table.cell(colspan: 6, fill: band-prop, inset: (x: 6pt, y: 2pt))[*Closed-source LMs*],
    [OpenAI], [O-Series], [o4-mini], [4096], [0.20], [0.90],
    [OpenAI], [O-Series], [o3], [4096], [0.20], [0.90],
    [OpenAI], [O-Series], [o3-mini], [4096], [0.20], [0.90],
    [OpenAI], [O-Series], [o1], [4096], [0.20], [0.90],
    [OpenAI], [GPT-5], [gpt-5], [4096], [1.00], [n/a],
    [OpenAI], [GPT-5], [gpt-5-mini], [4096], [1.00], [n/a],
    [OpenAI], [GPT-5], [gpt-5-nano], [4096], [1.00], [n/a],
    [OpenAI], [GPT-4.1], [gpt-4.1], [4096], [0.20], [0.90],
    [OpenAI], [GPT-4.1], [gpt-4.1-mini], [4096], [0.20], [0.90],
    [OpenAI], [GPT-4.1], [gpt-4.1-nano], [4096], [0.20], [0.90],
    [OpenAI], [GPT-4o], [gpt-4o], [4096], [0.20], [0.90],
    [OpenAI], [GPT-4o], [gpt-4o-mini], [4096], [0.20], [0.90],
    [Anthropic], [Claude Opus], [claude-opus-4-1-20250805], [4096], [n/a], [n/a],
    [Anthropic], [Claude Opus], [claude-opus-4-20250514], [4096], [0.20], [0.90],
    [Anthropic], [Claude Sonnet], [claude-sonnet-4-20250514], [4096], [0.20], [0.90],
    [Anthropic], [Claude Sonnet], [claude-3-7-sonnet-20250219], [4096], [0.20], [0.90],
    [Anthropic], [Claude Haiku], [claude-3-5-haiku-20241022], [4096], [0.20], [0.90],
    [Anthropic], [Claude Haiku], [claude-3-haiku-20240307], [4096], [0.20], [0.90],

    // Open-source LMs
    table.cell(colspan: 6, fill: band-source, inset: (x: 6pt, y: 2pt))[*Open-source LMs*],
    [Cirrascale], [OLMo 2], [OLMo-2-0325-32B-Instruct], [2048], [0.20], [0.90],
    [TogetherAI], [Marin], [marin-8b-instruct], [2048], [0.20], [0.90],
    [Cirrascale], [OLMo 2], [OLMo-2-1124-13B-Instruct], [2048], [0.20], [0.90],
    [Cirrascale], [OLMo 2], [OLMo-2-1124-7B-Instruct], [2048], [0.20], [0.90],
    [Cirrascale], [OLMo 2], [OLMo-2-0425-1B-Instruct], [2048], [0.20], [0.90],

    // Open-weight LMs
    table.cell(colspan: 6, fill: band-weight, inset: (x: 6pt, y: 2pt))[*Open-weight LMs*],
    [Together.ai], [Meta Llama 4], [Llama-Maverick-17B-128E-Instruct-FP8], [4096], [0.20], [0.90],
    [Together.ai], [Meta Llama 4], [Llama-Scout-17B-16E-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Meta Llama 3], [Llama-3.3-70B-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Meta Llama 3], [Llama-3.1-405B-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Meta Llama 3], [Llama-3.3-70B-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Deep Cogito], [cogito-v2-preview-llama-70B], [4096], [0.20], [0.90],
    [Together.ai], [Deep Cogito], [cogito-v2-preview-llama-405B], [4096], [0.20], [0.90],
    [Together.ai], [Qwen], [QwQ-32B], [4096], [0.20], [0.90],
    [Together.ai], [Qwen], [Qwen3-235B-A22B-Instruct-2507], [4096], [0.20], [0.90],
    [Together.ai], [Moonshot], [Kimi-K2-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Qwen], [Qwen2.5-72B-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [DeepSeek], [DeepSeek-R1-0528], [4096], [0.20], [0.90],
    [Together.ai], [DeepSeek], [DeepSeek-V3.1], [4096], [0.20], [0.90],
    [Together.ai], [DeepSeek], [DeepSeek-V3], [4096], [0.20], [0.90],
    [Together.ai], [DeepSeek], [DeepSeek-R1-Distill-Llama-70B], [4096], [0.20], [0.90],
    [Together.ai], [GPT-OSS], [gpt-oss-120b], [4096], [0.20], [0.90],
    [Together.ai], [GPT-OSS], [gpt-oss-20b], [4096], [0.20], [0.90],
    [Together.ai], [Meta Llama 3], [Llama-3-70b-chat-hf], [4096], [0.20], [0.90],
    [Together.ai], [DeepSeek], [DeepSeek-R1-Distill-Qwen-14B], [4096], [0.20], [0.90],
    [Together.ai], [Mistral AI], [Mistral-Small-24B-Instruct-2501], [4096], [0.20], [0.90],
    [Together.ai], [Deep Cogito], [cogito-v2-preview-llama-109B-MoE], [4096], [0.20], [0.90],
    [Together.ai], [Meta Llama 3.1], [Meta-Llama-3.1-8B-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Google Gemma], [gemma-3n-E4B-it], [4096], [0.20], [0.90],
    [Together.ai], [Deep Cogito], [cogito-v2-preview-deepseek-671b], [4096], [0.20], [0.90],
    [Together.ai], [Meta Llama 3], [Meta-Llama-3-8B-Instruct-Lite], [4096], [0.20], [0.90],
    [Together.ai], [Qwen 2.5], [Qwen2.5-7B-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Mistral AI], [Mistral-7B-Instruct-v0.3], [4096], [0.20], [0.90],
    [Together.ai], [Meta Llama 3.2], [Llama-3.2-3B-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Mistral AI], [Mistral-7B-Instruct-v0.2], [4096], [0.20], [0.90],
    [Together.ai], [Mistral AI], [Mistral-7B-Instruct-v0.1], [4096], [0.20], [0.90],
    botrule,
  ),
  caption: [Models evaluated in this study. The table lists all proprietary, open-source, and open-weight models along with their configuration parameters.],
) <appendix-models-table>

= Appendix: Evaluation Framework

== Architecture

// We designed the `IFF` framework with a simple modular architecture to ensure maintainability and reproducibility. The system is organized into four distinct parts:

// 1.  *Application Layer:* This is the top-most layer that provides the user interface for interacting with the framework. It includes command-line scripts such as `evaluation_bin.py` for running evaluations and `generate_responses.py` for generating model outputs.
// 2.  *Business Logic Layer:* This layer contains the core functionality of the framework. It includes the `evaluation_lib.py` module, which orchestrates the evaluation process, and the instruction modules (`finance_instructions`, `instructions_registry`) that define the logic for each verifiable constraint.
// 3.  *Utility Layer:* This layer provides common, reusable functions that support the business logic. The `instructions_util.py` module resides here, offering text processing and validation functions (e.g., word counting, sentence splitting, table detection) that are used by multiple instruction checkers.
// 4.  *Data Layer:* This layer consists of the data artifacts used and generated by the framework, including the input `JSONL` files containing the prompts and the output `JSONL` files containing model responses and evaluation results.


We designed the IFF framework to use a modular, layered architecture to support maintainability and reproducibility. The application layer exposes a user interface through command-line scripts. The primary entry points are evaluation_bin.py for running evaluations and generate_responses.py for producing model outputs. The business logic layer implements the core functionality. The evaluation_lib.py module orchestrates end-to-end evaluation, and the instruction modules define and resolve the logic for each verifiable constraint. The utility layer provides shared functions required by the business logic. The instructions_util.py module implements text processing and validation routines such as word counting, sentence splitting, and table detection that are reused by multiple checkers. The data layer holds the artifacts consumed and produced by the system, including input JSONL files with prompts and output JSONL files containing model responses and evaluation results.

== Core Components & Data Flow

// The framework's operation is driven by the interaction between its key modules, as illustrated in the component dependency diagram.

// #diagram(
//     // cell-size: (404mm, 20mm),
//     // edge-stroke: 0.8pt,
//     // edge-corner-radius: 4pt,
//     // mark-scale: 90%,

//     edge-stroke: 1pt,
//     node-corner-radius: 5pt,
//     edge-corner-radius: 8pt,
//     mark-scale: 80%,
    
//     // Nodes
//     node((2, 0), [build_input_jsonl]),
//     node((0, 1), [evaluation_bin]),
//     node((0, 2), [generate_responses]),

//     node((1, 1), [evaluation_lib]),
//     node((1, 2), [External API]),

//     node((2, 1), [instructions_registry]),
//     node((3, 1), [finance_instructions]),
//     node((3, 2), [instructions_util]),

//     // Edges
//     edge((0, 1), (1, 1), "-|>"), 
//     edge((1, 1), (2, 1), "-|>"), 
//     edge((2, 0), (2, 1), "-|>"), 
//     edge((0, 2), (1, 2), "-|>"), 
//     edge((2, 1), (3, 1), "-|>"), 
//     edge((3, 1), (3, 2), "-|>"),
//   )

// -   *`build_input_jsonl`*: This script generates the benchmark's test cases. It accesses the `instructions_registry` to combine various instruction types and parameters into complex financial prompts, which are then saved to a `JSONL` file.
// -   *`generate_responses`*: This module takes the generated prompts and uses its integrated, multi-provider LM Gateway to query external models (e.g., GPT-4, Claude 3). It handles API communication, error handling, and caching, saving the model-generated text into a responses `JSONL` file.
// -   *`evaluation_bin`*: This is the main evaluation runner. It uses `evaluation_lib` to load the prompts and their corresponding responses.
// -   *`evaluation_lib`*: The core evaluation engine. For each prompt, it retrieves the required instruction-checking logic from the `instructions_registry`. It then executes the "Strict" or "Loose" evaluation algorithm against the model's response.
// -   *`instructions_registry`*: A central mapping that holds all available instruction-checking classes. This registry pattern allows for easy discovery and instantiation of the correct validation logic based on an instruction's unique ID.
// -   *`finance_instructions`*: This module contains the implementation for each specific financial instruction (e.g., `FinBoldIntroItalicRisk`, `FinCreditSpreadCarryTable`). Each checker inherits from a base class and implements the specific logic required to validate its constraint.
// -   *`instructions_util`*: Provides foundational text-processing functions (e.g., `count_words`, `has_table`) used by the individual instruction checkers in `finance_instructions`.

Benchmark construction begins with build_input_jsonl, which assembles test cases using instructions_registry to combine instruction types and parameters into financial prompts. The prompts are serialized to an input JSONL file. The generate_responses module reads this file and submits the prompts to external models through a multi-provider gateway. The evaluation phase is initiated by evaluation_bin, which uses evaluation_lib to load prompts and their corresponding responses. For each prompt, evaluation_lib requests the appropriate checker from instructions_registry and applies the selected evaluation mode to the model output. The instructions_registry maintains the mapping from instruction identifiers to checker classes and returns the correct implementation at runtime. The finance_instructions module contains the concrete checkers, each inheriting from a common base and implementing the domain-specific rules required to validate its constraint. The instructions_util module supplies the supporting text-processing functions that are reused across checkers. The overall data flow is linear and reproducible: prompt generation produces the input JSONL, response generation produces the responses JSONL, and evaluation produces result files that record pass/fail outcomes and statistics.

== Design Patterns

// The architecture leverages several key software design patterns to enhance its flexibility and maintainability:

// -   *Registry Pattern:* The `instructions_registry` acts as a central point of contact for all instruction checkers, decoupling the evaluation engine from the concrete implementation of the checkers.
// -   *Strategy Pattern:* The use of "Strict" and "Loose" evaluation modes is a classic example of the Strategy pattern. The main evaluation library can switch between these different evaluation algorithms at runtime without changing its core logic.
// -   *Factory Pattern:* The framework uses a factory approach to dynamically create instances of instruction-checker classes from the registry based on the IDs specified in a given prompt.

The registry pattern appears in instructions_registry, which centralizes the association between instruction identifiers and checker implementations so that the evaluation engine does not depend on concrete classes. The strategy pattern governs evaluation behavior, allowing Strict and Loose modes to be selected at runtime without changing the engine’s control flow. The factory pattern is used when instantiating checkers from identifiers in a prompt; evaluation_lib requests a class from the registry, constructs the checker with any provided parameters, and executes validation. This combination allows new instructions to be added by registering a checker class, without modifying orchestration code or other components.


= Appendix: Evaluation Dataset <sec:dataset-examples>
// Comprehensive Documentation of Prompt Design, Instructions, and Model Outputs

This appendix provides detailed information on the prompts and instructions used in our experiments, along with samples of model outputs.

== System Prompt

The LLMs are primed using the following system prompt to aid in aligning with our instruction following and improve performance.

```

System prompt

You write for institutional finance. Use ASCII punctuation only: straight quotes ("), apostrophes ('), hyphen (-), percent (%), commas, periods, colons, semicolons, parentheses.

OUTPUT CONTRACT
- Follow the user's instructions exactly, including any Markdown (bold, italic), headings (#/##/###), fenced code blocks using triple backticks, tables in plain Markdown, and checkboxes like "[ ] ".
- Return only the requested content. No preambles, no meta-explanations, no extra commentary.

DEFAULTS
- Do not invent data. Preserve given tokens exactly (numbers, dates, casing, punctuation, separators).
- Do not introduce any formatting (headings, lists, tables, code blocks, HTML, links, images, footnotes, blockquotes) unless explicitly asked.
- Do not reorder items unless the instruction explicitly asks for a different order.
- Whitespace hygiene: no leading/trailing spaces on any line. No extra blank lines beyond what is explicitly requested. Do not add a trailing newline unless requested.

COUNTS • SCOPE • VOCAB
- When a count is given (lines, rows, bullets, checkboxes, occurrences), satisfy it exactly.
- Apply scope exactly where specified (e.g., "inside Section B only" vs "across the entire output") and nowhere else.
- When an allowed vocabulary is given, use only those tokens, case-sensitively, with no substitutions or synonyms.

DELIMITERS
- When delimiters/sentinels are specified (e.g., [FORM] ... [/FORM]), print them exactly, in the exact positions requested, and nowhere else.

SEPARATORS
- When the instruction specifies separators (e.g., "; " or ", "), reproduce them exactly (including spacing). Do not normalize or trim.

VERBATIM COPYING
- When asked to copy text from a base/source, copy it verbatim including punctuation and spacing. Do not paraphrase.

CONFLICTS
- If global and section-specific rules conflict, the section-specific rule governs within its section.
- If two rules conflict in the same scope, prefer the stricter interpretation (fewer items, fewer occurrences, fewer formats).

MARKDOWN PRIMITIVES (only when explicitly requested)
- TABLE: Render as a GitHub-style Markdown table:
  1) one header row with the exact column names,
  2) one separator row of hyphens and pipes (no alignment colons),
  3) the exact number of data rows requested.
  Do not add/remove columns, pad with extra spaces, or reorder rows/columns.
- BULLETED LIST: Use "- " for each bullet, one item per line, in the order requested.
- ORDERED LIST: Use "1.", "2.", ... one item per line, in the order requested. Do not auto-renumber unless asked.
- ITALICS: Use *...* only (no _, no mixing).
- BOLD: Use **...** only (no __).
- FONT COLOR: Use <font> tags to color. For eg. <font color="red">2025</font>.
- CHECKBOXES: Use "[ ] " for unchecked or "[x] " for checked exactly as requested (case-sensitive "x").
- CODE BLOCKS: Use fenced code blocks with triple backticks. If a language is specified, put it immediately after the opening backticks (e.g., '''json). Emit exactly the number of code blocks requested.
  • JSON code block: contain exactly one valid JSON object unless otherwise specified; no comments or trailing commas.
- HEADINGS: Use "#", "##", "###", etc. only if explicitly requested, with the wording provided.

BLANK-LINE RULE
- Unless a specific blank-line pattern is requested (e.g., "one blank line between Block 1 and Block 2"), produce no blank lines. When a pattern is requested, follow it exactly and avoid any additional blank lines.

```

== Sample Prompts

Representative examples of prompts are provided to illustrate the variety and structure of inputs used.


=== Single Output Prompts

```

Prompt
Rates quants want a 150-word explainer of how the SOFR–TONA basis feeds into cross-currency-swap valuation. TL;DR: the basis spread is added to one leg so both discount curves align before fair-value logic is applied. Close with the adjustment formula. 
Instruction: Begin with exact italicised TL;DR sentence above and end with a fenced LaTeX formula block showing the basis-spread adjustment. 

```

=== Chained Output Prompts

```

Prompt
The bank is scheduling a release of the core payments switch identified as release twenty twenty five point zero nine. The change window runs from Saturday twelve September two thousand twenty five at twenty two hundred hours until Sunday thirteen September two thousand twenty five at zero four hundred hours local time. The update affects instant bank transfers, automated clearing house files, and card authorisation routing. The contingency plan is to return to the prior production version within thirty minutes if specific failure indicators appear. Prepare a cutover runbook that coordinates technology, operations, and communications. Instruction: Begin with a one sentence goal statement, then set out the runbook in order: (1) provide a timeline table with columns time, activity, owner, and success signal from pre change to post change; (2) write three checklists titled pre cutover, cutover, and post cutover using Markdown checkboxes for items such as freezes, backups, message drains, smoke tests, and reconciliation; (3) add a short section titled rollback triggers that lists the exact indicators that require a return to the prior version; (4) conclude with a communications tree naming who is notified at start, at checkpoints, and at completion. Output in Markdown only.

```

== Sample Responses

This section presents representative outputs of Llama 4 Maverick, including both correct and incorrect responses, to illustrate model performance for both strict and loose mode.


The model produces outputs that fully adhere to the prompt, meeting all specified instructions and correctly following the intended structure and formatting.

`
#### Prompt

Write about 250 words on Meta’s Q3 setup using only the facts below. Include upside levers (Reels RPM, tighter opex) and downside watch items (foreign exchange drag, ads macro). Do not invent data.
 Facts: revenue $36.8 billion; EBIT margin 39%.
Begin with one sentence in bold stating your overall call. Add the heading "Upside Watch" followed by exactly three bullets, then the heading "Downside Watch" followed by exactly three bullets; each bullet must begin with one of these tokens : Increase, Tighten, Improve, Monitor, Reduce, Shift, Manage. If your opening bold sentence contains the word "probably".Insert a single bold line that reads "Confidence: Low." immediately before the final line. Finish with one italic line "Downside risk: FX drag; ads macro.".

#### Response (PASSED)

**Meta is probably well-positioned for Q3 given its historical performance and current trends.**
 Upside Watch
- Improve Reels RPM as the format continues to gain traction.
- Tighten opex by optimizing operational efficiencies.
- Increase ad load without compromising user experience.
 Downside Watch
- Monitor foreign exchange fluctuations that could negatively impact revenue.
- Manage ads macro environment that may affect advertiser spending.
- Reduce dependence on a single revenue stream to mitigate potential risks.
**Confidence: Low.**
*Downside risk: FX drag; ads macro.*`

The example below illustrates a case in which the model does not fully adhere to the prompt, producing outputs that deviate from the specified instructions and formatting requirements. In this instance, the model fails to follow multiple instructions provided in the prompt.

`
#### Prompt

Summarize the three deficiencies identified by the model-risk audit in mortgage prepayment model version 5.2. The deficiencies are: an outdated seasoning curve, a missing macroeconomic linkage for refinancing incentive, and an inadequate back-testing window. Present them clearly and concisely, without adding or inventing any further issues.
List the three deficiencies as bullets and end with the remediation deadline <span style="color:red">2025-10-31</span> in bold red text.

#### Response (FAILED)

- The mortgage prepayment model version 5.2 has an outdated seasoning curve.
- The model lacks a macroeconomic linkage for refinancing incentive.
- The back-testing window used is inadequate.
Remediation deadline: <font color="red">**2025-10-31**</font>
`
== Instruction Registry

This section provides a comprehensive registry of all instructions used.



// 1. count:word_count_range
// 2. fin:equities_bold_intro_italic_risk
// 3. fin:credit_table_spread_vs_carry
// 4. fin:fx_calc_codeblock_limit
// 5. fin:compliance_rule10b5_numbered
// 6. fin:ops_settlement_checklist
// 7. fin:ir_six_bullets_verb_buyback
// 8. fin:treasury_liquidity_risk_section
// 9. fin:deriv_black76_latex_sigma
// 10. fin:risk_var_numbered_boldusd
// 11. fin:pe_subheaders_dashes
// 12. fin:quant_pseudocode_comments
// 13. fin:crypto_recap_percent_italic
// 14. fin:abs_table_then_comments
// 15. fin:reit_underline_wordlimit
// 16. fin:structured_protect_terms
// 17. fin:ecb_timestamp_boldrates
// 18. fin:ratings_three_numbered
// 19. fin:pension_table_footnote
// 20. fin:margin_im_alert
// 21. fin:etf_timed_checklist
// 22. fin:fintech_swot_licence_italic
// 23. fin:cet1_formula_block_end
// 24. fin:ma_synergies_arrows
// 25. fin:esg_scopes_bold
// 26. fin:tax_carried_interest
// 27. fin:ifrs17_callout_two
// 28. fin:retail_liquidity_underline
// 29. fin:embond_yield_boldprice
// 30. fin:rrp_drivers_subs_bold
// 31. fin:climate_grid_critical
// 32. fin:syndicate_table_boldcover
// 33. fin:aml_numbered_high
// 34. fin:xccy_basis_tldr_latex
// 35. fin:clearpar_groups_signoff
// 36. fin:modelrisk_deadline
// 37. fin:carbon_divergences_two
// 38. fin:clo_table_italic_shortest
// 39. fin:vc_proscons_underline_terms
// 40. fin:ndf_numbered_bold_vals
// 41. fin:lch_margin_timestamp_code
// 42. fin:marketing_irr_threehashtags
// 43. fin:project_keyparties_boldusd
// 44. fin:finops_table_grandtotal_warn
// 45. fin:payments_iso20022_qa_underline
// 46. fin:munis_tey_footnote_bold
// 47. fin:index_rebal_subject_bullets
// 48. fin:correlations_table_red
// 49. fin:scf_redflags_callout_limit
// 50. fin:sdr_csv_italic_note
// 51. fin:eqderivs_gamma_table_bold
// 52. fin:muni_budget_gap_snapshot
// 53. fin:esg_csrd_checklist
// 54. fin:settlement_runbook_notes
// 55. fin:ma_board_slide_apextech
// 56. fin:rmbs_poolcard_stratification
// 57. fin:fxhedge_calendar_novamed
// 58. fin:airline_fuel_exposuremap
// 59. fin:aml_case_northbridge
// 60. fin:treasury_monthend_runsheet
// 61. fin:rm_securitization_factsheet
// 62. fin:pe_quarterly_letter_skeleton
// 63. fin:claims_reserve_rollforward
// 64. fin:merchant_chargeback_pack
// 65. fin:jetfuel_hedgeplan_outline
// 66. fin:bank_gap_snapshot
// 67. fin:lockup_monitoring_plan
// 68. fin:branchclosure_oakview_plan
// 69. fin:merchant_onboarding_arcadia
// 70. fin:realestate_valuation_runbook
// 71. fin:greenbond_allocation_riverton
// 72. fin:procurement_cards_auditpack
// 73. fin:research_blueharbor_compliance
// 74. fin:payments_cutover_runbook
// 75. fin:venturedebt_covenant_monitor
// 76. fin:payments_switch_cutover_runbook
// 77. fin:restricted_list_adds_table
// 78. fin:fund_profile_fees_contact
// 79. fin:treasury_accounts_rationalization
// 80. fin:sec_filing_pack_zephyr
// 81. fin:esg_extract_orion_2024
// 82. fin:credit_limit_changes_summary
// 83. fin:saas_amendment_change_json
// 84. fin:pci_scope_extract_2025
// 85. fin:ap_payment_run_2025_10_15
// 86. fin:tax_1099_candidates_2025
// 87. fin:saas_quanta_commercial_controls
// 88. fin:revops_deals_hygiene_q4_2025
// 89. fin:ir_roadshow_blueharbor_oct2025



1. fin:equities_bold_intro_italic_risk
2. fin:credit_table_spread_vs_carry
3. fin:fx_calc_codeblock_limit
4. fin:compliance_rule10b5_numbered
5. fin:ops_settlement_checklist
6. fin:ir_six_bullets_verb_buyback
7. fin:treasury_liquidity_risk_section
8. fin:deriv_black76_latex_sigma
9. fin:risk_var_numbered_boldusd
10. fin:pe_subheaders_dashes
11. fin:quant_pseudocode_comments
12. fin:crypto_recap_percent_italic
13. fin:abs_table_then_comments
14. fin:reit_underline_wordlimit
15. fin:structured_protect_terms
16. fin:ecb_timestamp_boldrates
17. fin:ratings_three_numbered
18. fin:pension_table_footnote
19. fin:margin_im_alert
20. fin:etf_timed_checklist
21. fin:fintech_swot_licence_italic
22. fin:cet1_formula_block_end
23. fin:ma_synergies_arrows
24. fin:esg_scopes_bold
25. fin:tax_carried_interest
26. fin:ifrs17_callout_two
27. fin:retail_liquidity_underline
28. fin:embond_yield_boldprice
29. fin:rrp_drivers_subs_bold
30. fin:climate_grid_critical
31. fin:syndicate_table_boldcover
32. fin:aml_numbered_high
33. fin:xccy_basis_tldr_latex
34. fin:clearpar_groups_signoff
35. fin:modelrisk_deadline
36. fin:carbon_divergences_two
37. fin:clo_table_italic_shortest
38. fin:vc_proscons_underline_terms
39. fin:ndf_numbered_bold_vals
40. fin:lch_margin_timestamp_code
41. fin:marketing_irr_threehashtags
42. fin:project_keyparties_boldusd
43. fin:finops_table_grandtotal_warn
44. fin:payments_iso20022_qa_underline
45. fin:munis_tey_footnote_bold
46. fin:index_rebal_subject_bullets
47. fin:correlations_table_red
48. fin:scf_redflags_callout_limit
49. fin:sdr_csv_italic_note
50. fin:eqderivs_gamma_table_bold
51. fin:muni_budget_gap_snapshot
52. fin:esg_csrd_checklist
53. fin:settlement_runbook_notes
54. fin:ma_board_slide_apextech
55. fin:rmbs_poolcard_stratification
56. fin:fxhedge_calendar_novamed
57. fin:airline_fuel_exposuremap
58. fin:aml_case_northbridge
59. fin:treasury_monthend_runsheet
60. fin:rm_securitization_factsheet
61. fin:pe_quarterly_letter_skeleton
62. fin:claims_reserve_rollforward
63. fin:merchant_chargeback_pack
64. fin:jetfuel_hedgeplan_outline
65. fin:bank_gap_snapshot
66. fin:lockup_monitoring_plan
67. fin:branchclosure_oakview_plan
68. fin:merchant_onboarding_arcadia
69. fin:realestate_valuation_runbook
70. fin:greenbond_allocation_riverton
71. fin:procurement_cards_auditpack
72. fin:research_blueharbor_compliance
73. fin:payments_cutover_runbook
74. fin:venturedebt_covenant_monitor
75. fin:payments_switch_cutover_runbook
76. fin:restricted_list_adds_table
77. fin:fund_profile_fees_contact
78. fin:treasury_accounts_rationalization
79. fin:sec_filing_pack_zephyr
80. fin:esg_extract_orion_2024
81. fin:credit_limit_changes_summary
82. fin:saas_amendment_change_json
83. fin:pci_scope_extract_2025
84. fin:ap_payment_run_2025_10_15
85. fin:tax_1099_candidates_2025
86. fin:saas_quanta_commercial_controls
87. fin:revops_deals_hygiene_q4_2025
88. fin:ir_roadshow_blueharbor_oct2025

