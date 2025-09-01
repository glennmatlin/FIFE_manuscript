#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/bloated-neurips:0.7.0": botrule, midrule, neurips2025, paragraph, toprule, url

= Appendix: Models

// === Appendix table (metadata only; same row order as results)
#let prov-col  = 7.0em
#let fam-col   = 9.0em
#let id-col    = 20.0em
#let small-col = 5.0em
#let notes-col = 20.0em
#let pad       = (x: 3.0pt, y: 1.4pt)
#set text(size: 9pt)

#table(
  columns: (prov-col, fam-col, id-col, small-col, small-col, small-col, notes-col),
  align: (x, y) => if x in (3,4,5) { right } else { left },
  inset: pad,
  stroke: none,
  toprule,
  table.header([*Provider*], [*Family*], [*Model ID*], [*MaxTok*], [*Temp*], [*Top‑p*], [*Notes*]),
  midrule,
  [Together.ai], [Deep Cogito], [deepcogito/cogito-v2-preview-llama-70B], [4096], [0.20], [0.90], [nan],
  [Anthropic], [Claude Sonnet], [anthropic/claude-3-7-sonnet-20250219], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Deep Cogito], [deepcogito/cogito-v2-preview-llama-405B], [4096], [0.20], [0.90], [nan],
  [OpenAI], [GPT-4o], [openai/gpt-4o], [4096], [0.20], [0.90], [nan],
  [Anthropic], [Claude Opus], [anthropic/claude-opus-4-1-20250805], [4096], [], [], [The model does not accept both top_p and temp only one needs to be sent.],
  [Anthropic], [Claude Opus], [anthropic/claude-opus-4-20250514], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Moonshot], [moonshotai/Kimi-K2-Instruct], [4096], [0.20], [0.90], [nan],
  [OpenAI], [OpenAI O-Series], [openai/o3], [4096], [0.20], [0.90], [nan],
  [OpenAI], [GPT-4.1], [openai/gpt-4.1], [4096], [0.20], [0.90], [nan],
  [Together.ai], [DeepSeek], [deepseek-ai/DeepSeek-R1-0528-tput], [], [], [], [nan],
  [OpenAI], [OpenAI O-Series], [openai/o4-mini], [4096], [0.20], [0.90], [nan],
  [Together.ai], [DeepSeek], [deepseek-ai/DeepSeek-V3.1], [4096], [0.20], [0.90], [nan],
  [OpenAI], [OpenAI O-Series], [openai/o1], [4096], [0.20], [0.90], [nan],
  [Together.ai], [DeepSeek], [deepseek-ai/DeepSeek-V3], [4096], [0.20], [0.90], [nan],
  [OpenAI], [OpenAI O-Series], [openai/o3-mini], [4096], [0.20], [0.90], [nan],
  [Together.ai], [DeepSeek], [deepseek-ai/DeepSeek-R1-Distill-Llama-70B], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Arcee AI], [arcee-ai/virtuoso-large], [4096], [0.20], [0.90], [nan],
  [OpenAI], [GPT-4o], [openai/gpt-4o-mini], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Z.ai GLM], [zai-org/GLM-4.5-Air-FP8], [4096], [0.20], [0.90], [nan],
  [Anthropic], [Claude Haiku], [anthropic/claude-3-5-haiku-20241022], [4096], [0.20], [0.90], [nan],
  [OpenAI], [GPT-5], [openai/gpt-5-mini], [4096], [1.00], [], [nan],
  [Together.ai], [OpenAI GPT-OSS], [openai/gpt-oss-120b], [4096], [0.20], [0.90], [Not a mistake],
  [Together.ai], [OpenAI GPT-OSS], [openai/gpt-oss-20b], [4096], [0.20], [0.90], [Not a mistake],
  [Anthropic], [Claude Haiku], [anthropic/claude-3-haiku-20240307], [4096], [0.20], [0.90], [nan],
  [Together.ai], [DeepSeek], [deepseek-ai/DeepSeek-R1-Distill-Qwen-14B], [4096], [0.20], [0.90], [nan],
  [OpenAI], [GPT-4.1], [openai/gpt-4.1-nano], [4096], [0.20], [0.90], [nan],
  [OpenAI], [GPT-5], [openai/gpt-5], [4096], [1.00], [], [returned empty string as responses for a lot of prompts],
  [OpenAI], [GPT-4.1], [openai/gpt-4.1-mini], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Deep Cogito], [deepcogito/cogito-v2-preview-llama-109B-MoE], [4096], [0.20], [0.90], [nan],
  [Anthropic], [Claude Sonnet], [anthropic/claude-sonnet-4-20250514], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Deep Cogito], [deepcogito/cogito-v2-preview-deepseek-671b], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Marin Community], [marin-community/marin-8b-instruct], [2048], [0.20], [0.90], [Max token limit is 4096],
  [OpenAI], [GPT-5], [openai/gpt-5-nano], [4096], [1.00], [], [nan],
  [OpenAI], [OpenAI O-Series], [openai/o3-pro], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Meta Llama 4], [meta-llama/Llama-4-Maverick-17B-128E-Instruct-FP8], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Meta Llama 3.3], [meta-llama/Llama-3.3-70B-Instruct-Turbo-Free], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Meta Llama 4], [meta-llama/Llama-4-Scout-17B-16E-Instruct], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Meta Llama 3.3], [meta-llama/Llama-3.3-70B-Instruct-Turbo], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Meta Llama 3.1], [meta-llama/Meta-Llama-3.1-405B-Instruct-Turbo], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Qwen], [Qwen/QwQ-32B], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Qwen3], [Qwen/Qwen3-235B-A22B-Instruct-2507-tput], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Qwen 2.5], [Qwen/Qwen2.5-72B-Instruct-Turbo], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Meta Llama 3], [meta-llama/Llama-3-70b-chat-hf], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Mistral AI], [mistralai/Mistral-Small-24B-Instruct-2501], [4096], [0.20], [0.90], [nan],
  [AI2], [OLMo 2], [allenai/OLMo-2-0325-32B-Instruct], [2048], [0.20], [0.90], [Max conttext is 4096, so taking 2048 to keep results same.],
  [Together.ai], [Meta Llama 3.1], [meta-llama/Meta-Llama-3.1-8B-Instruct-Turbo], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Google Gemma], [google/gemma-3n-E4B-it], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Meta Llama 3], [meta-llama/Meta-Llama-3-8B-Instruct-Lite], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Qwen 2.5], [Qwen/Qwen2.5-7B-Instruct-Turbo], [4096], [0.20], [0.90], [nan],
  [AI2], [OLMo 2], [allenai/OLMo-2-1124-13B-Instruct], [2048], [0.20], [0.90], [Max conttext is 4096, so taking 2048 to keep results same.],
  [AI2], [OLMo 2], [allenai/OLMo-2-1124-7B-Instruct], [2048], [0.20], [0.90], [Max conttext is 4096, so taking 2048 to keep results same.],
  [Together.ai], [Mistral AI], [mistralai/Mistral-7B-Instruct-v0.3], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Meta Llama 3.2], [meta-llama/Llama-3.2-3B-Instruct-Turbo], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Mistral AI], [mistralai/Mistral-7B-Instruct-v0.2], [4096], [0.20], [0.90], [nan],
  [Together.ai], [Mistral AI], [mistralai/Mistral-7B-Instruct-v0.1], [4096], [0.20], [0.90], [nan],
  [AI2], [OLMo 2], [allenai/OLMo-2-0425-1B-Instruct], [2048], [0.20], [0.90], [Max conttext is 4096, so taking 2048 to keep results same.],
  botrule,
)

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

= Comprehensive Documentation of Prompt Design, Instructions, and Model Outputs

This appendix provides detailed information on the prompts, instructions, and resulting outputs used in our experiments

== System Prompt

The LLMs are primed using the following prompt to follow the instructions

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

