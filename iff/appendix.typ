#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/bloated-neurips:0.7.0": botrule, midrule, neurips2025, paragraph, toprule, url

= Appendix: Models
#let prov-col  = 7em
#let fam-col   = 10em
#let id-col    = 16em
#let small-col = 5em
#let notes-col = 8em
#let pad       = (x: 2.5pt, y: 1.6pt)
#set text(size: 9pt)

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
    [OpenAI], [GPT-5], [gpt-5], [4096], [1.00], [],
    [OpenAI], [GPT-5], [gpt-5-mini], [4096], [1.00], [],
    [OpenAI], [GPT-5], [gpt-5-nano], [4096], [1.00], [],
    [OpenAI], [GPT-4.1], [gpt-4.1], [4096], [0.20], [0.90],
    [OpenAI], [GPT-4.1], [gpt-4.1-mini], [4096], [0.20], [0.90],
    [OpenAI], [GPT-4.1], [gpt-4.1-nano], [4096], [0.20], [0.90],
    [OpenAI], [GPT-4o], [gpt-4o], [4096], [0.20], [0.90],
    [OpenAI], [GPT-4o], [gpt-4o-mini], [4096], [0.20], [0.90],
    [Anthropic], [Claude Opus], [claude-opus-4-1-20250805], [4096], [], [],
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
    [Together.ai], [Meta Llama 4], [Llama-4-Maverick-17B-128E-Instruct-FP8], [4096], [0.20], [0.90],
    [Together.ai], [Meta Llama 4], [Llama-4-Scout-17B-16E-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Meta Llama 3], [Llama-3.3-70B-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Meta Llama 3], [Meta-Llama-3.1-405B-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Meta Llama 3], [Llama-3.3-70B-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Deep Cogito], [cogito-v2-preview-llama-70B], [4096], [0.20], [0.90],
    [Together.ai], [Deep Cogito], [cogito-v2-preview-llama-405B], [4096], [0.20], [0.90],
    [Together.ai], [Qwen], [QwQ-32B], [4096], [0.20], [0.90],
    [Together.ai], [Qwen], [Qwen3-235B-A22B-Instruct-2507-tput], [4096], [0.20], [0.90],
    [Together.ai], [Moonshot], [Kimi-K2-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [Qwen], [Qwen2.5-72B-Instruct], [4096], [0.20], [0.90],
    [Together.ai], [DeepSeek], [DeepSeek-R1-0528-tput], [], [], [],
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
  caption: [Models Evaluated in this Study],
) <appendix-models-table>

= Appendix: Evaluation Framework

== Architecture

We designed the `IFF` framework with a simple modular architecture to ensure maintainability and reproducibility. The system is organized into four distinct parts:

1.  *Application Layer:* This is the top-most layer that provides the user interface for interacting with the framework. It includes command-line scripts such as `evaluation_bin.py` for running evaluations and `generate_responses.py` for generating model outputs.
2.  *Business Logic Layer:* This layer contains the core functionality of the framework. It includes the `evaluation_lib.py` module, which orchestrates the evaluation process, and the instruction modules (`finance_instructions`, `instructions_registry`) that define the logic for each verifiable constraint.
3.  *Utility Layer:* This layer provides common, reusable functions that support the business logic. The `instructions_util.py` module resides here, offering text processing and validation functions (e.g., word counting, sentence splitting, table detection) that are used by multiple instruction checkers.
4.  *Data Layer:* This layer consists of the data artifacts used and generated by the framework, including the input `JSONL` files containing the prompts and the output `JSONL` files containing model responses and evaluation results.

== Core Components & Data Flow

The framework's operation is driven by the interaction between its key modules, as illustrated in the component dependency diagram.

#diagram(
    // cell-size: (404mm, 20mm),
    // edge-stroke: 0.8pt,
    // edge-corner-radius: 4pt,
    // mark-scale: 90%,

    edge-stroke: 1pt,
    node-corner-radius: 5pt,
    edge-corner-radius: 8pt,
    mark-scale: 80%,
    
    // Nodes
    node((2, 0), [build_input_jsonl]),
    node((0, 1), [evaluation_bin]),
    node((0, 2), [generate_responses]),

    node((1, 1), [evaluation_lib]),
    node((1, 2), [External API]),

    node((2, 1), [instructions_registry]),
    node((3, 1), [finance_instructions]),
    node((3, 2), [instructions_util]),

    // Edges
    edge((0, 1), (1, 1), "-|>"), 
    edge((1, 1), (2, 1), "-|>"), 
    edge((2, 0), (2, 1), "-|>"), 
    edge((0, 2), (1, 2), "-|>"), 
    edge((2, 1), (3, 1), "-|>"), 
    edge((3, 1), (3, 2), "-|>"),
  )

-   *`build_input_jsonl`*: This script generates the benchmark's test cases. It accesses the `instructions_registry` to combine various instruction types and parameters into complex financial prompts, which are then saved to a `JSONL` file.
-   *`generate_responses`*: This module takes the generated prompts and uses its integrated, multi-provider LM Gateway to query external models (e.g., GPT-4, Claude 3). It handles API communication, error handling, and caching, saving the model-generated text into a responses `JSONL` file.
-   *`evaluation_bin`*: This is the main evaluation runner. It uses `evaluation_lib` to load the prompts and their corresponding responses.
-   *`evaluation_lib`*: The core evaluation engine. For each prompt, it retrieves the required instruction-checking logic from the `instructions_registry`. It then executes the "Strict" or "Loose" evaluation algorithm against the model's response.
-   *`instructions_registry`*: A central mapping that holds all available instruction-checking classes. This registry pattern allows for easy discovery and instantiation of the correct validation logic based on an instruction's unique ID.
-   *`finance_instructions`*: This module contains the implementation for each specific financial instruction (e.g., `FinBoldIntroItalicRisk`, `FinCreditSpreadCarryTable`). Each checker inherits from a base class and implements the specific logic required to validate its constraint.
-   *`instructions_util`*: Provides foundational text-processing functions (e.g., `count_words`, `has_table`) used by the individual instruction checkers in `finance_instructions`.

== Design Patterns

The architecture leverages several key software design patterns to enhance its flexibility and maintainability:

-   *Registry Pattern:* The `instructions_registry` acts as a central point of contact for all instruction checkers, decoupling the evaluation engine from the concrete implementation of the checkers.
-   *Strategy Pattern:* The use of "Strict" and "Loose" evaluation modes is a classic example of the Strategy pattern. The main evaluation library can switch between these different evaluation algorithms at runtime without changing its core logic.
-   *Factory Pattern:* The framework uses a factory approach to dynamically create instances of instruction-checker classes from the registry based on the IDs specified in a given prompt.

= Appendix: Evaluation Dataset
// Comprehensive Documentation of Prompt Design, Instructions, and Model Outputs

This appendix provides detailed information on the prompts and instructions used in our experiments, along with samples of model outputs.

== System Prompt

The LMs are primed using the following system/agent prompt to aid in aligning with our instruction-following and improve baseline performance.

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

=== Strict Mode

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
