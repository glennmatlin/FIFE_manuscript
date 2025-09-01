#import "@preview/bloated-neurips:0.7.0": botrule, midrule, neurips2025, paragraph, toprule, url
#import "/logo.typ": LaTeX, LaTeXe, TeX


// #bibliography("zotero.bib")

#let draft(content) = {
  text(fill: red, style: "italic")[#content]
}

#let num_prompts = "100"
#let num_instruction_types = "88"
#let num_models_evaluated = "57"

#let affls = (
  gatech: (
    department: "College of Computing",
    institution: "Georgia Institute of Technology",
    location: "Atlanta, Georgia",
    country: "USA"),
)

#let authors = (
  (name: "Glenn Matlin",
   affl: "gatech",
   email: "glenn@gatech.edu"),
  (name: "Siddharth",
   affl: "gatech",
   email: "siddharth889@gmail.com"),
  (name: "Anirudh JM",
   affl: "gatech",
   email: "amahesh64@gatech.edu"),
  (name: "Aditya Shukla",
   affl: "gatech",
   email: "ashukla73@gatech.edu"),
  (name: "Yahya Hassan",
   affl: "gatech",
   email: "yhassan30@gatech.edu"),
  (name: "Sudheer Chava",
   affl: "gatech",
   email: "sudheer.chava@gatech.edu"),
)

#show: neurips2025.with(
  title: [Instruction following for finance (`IFF`): 
  Verifying the ability of language models  
  for complex financial instruction following],
  authors: (authors, affls),
  keywords: ("Language Models", "Instruction Following", "Benchmark", "Finance", "Financial NLP"),
  abstract: [
       Language Models (LMs) demonstrate an impressive ability to follow prompting instructions to guide their generation. However, the risk associated with hallucinations and confabulations when following complex and interdependent instructions has limited their effectiveness in high-stakes domains (i.e., finance), where precision and reliability are critical. We introduce `IFF`, a high-difficulty benchmark designed to assess the advanced instruction-following capabilities of LMs for finance. We provide #num_prompts human-authored prompts that mirror complex financial analysis tasks, utilizing information extraction, classification, question answering, and table summarization. We construct a _verification system_ where we embed #num_instruction_types as distinct, individually verifiable constraints to enable automated and fine-grained reward signals. We evaluate #num_models_evaluated models in a zero-shot setting, including the most popular proprietary models (GPT5, Claude Opus 4.1), open-weight models (Qwen3, Llama4), and open-source models (OLMo2). Our key findings reveal that while top-tier proprietary models, such as those that achieve the highest accuracy, outperform the best open-source models by a significant margin, they still do not achieve perfect compliance. Furthermore, we found that all models (including leading proprietary models) struggle with instruction following during our tasks due to their requirement for multi-step constraints, stricter adherence to constraints, and output verification. We release our benchmark dataset and code as an open-source resource for the community to promote research into Reinforcement Learning with Verified Rewards (RLVR) for LMs in the financial domain.
  ],
  bibliography: bibliography("zotero.bib"),
  bibliography-opts: (title: none, full: true),  // Only for example paper.
  appendix: [
    #include "appendix.typ"
    #include "checklist.typ"
  ],
  accepted: false,
)

= Introduction

Language models (LMs) have become general-purpose interfaces for information work, but their value hinges on the ability to *follow instructions precisely*, not just produce plausible text@radford_language_nodate @touvron_llama_2023. Instruction tuning and preference-based reinforcement learning improve obedience to user directives @wei_chain--thought_2023 @ouyang_training_2022, and a recent wave of benchmarks has shown both progress and clear gaps. Verifiable-constraint suites (e.g., IFEval) test formatting and content rules automatically @zhou_instruction-following_2023; SIFo examines multi-step, sequential directives @chen_recent_2025; DIM-Bench targets distraction and instruction ambiguity @hwang_llms_2025; and IFBench/IFTrain study generalization and training with verifiable rewards @pyatkin_generalizing_2025. Across these settings, modern LLMs still fail when instructions are long, compositional, or conditional in nature.

Finance raises the bar further. Real workflows blend domain reasoning with strict, machine-checkable constraints,e.g. "Create a  table with exact headers, sort by spread descending, bold values above a threshold, normalize currency codes, and end with a disclaimer." In such contexts, an answer that is factually right but format-noncompliant can still be operationally useless (downstream scripts break; compliance reviews fail).Despite this critical need, no dedicated benchmark exists for evaluating instruction-following in finance. Existing financial NLP benchmarks, such as FLUE and FLAME *(citations here along with another finance benchmark not from fsil)* focus on task-specific accuracy (e.g., sentiment classification, QA, NER). They do not, however, measure a model's ability to follow the complex, multi-part constraints of real-world financial queries @pyatkin_generalizing_2025. For instance, a model that correctly identifies sentiment but fails to deliver the result in a user-specified format exhibits a failure mode that these benchmarks do not capture. We design the IFF benchmark to measure this crucial, yet overlooked, dimension of instruction fidelity,to check whether a model adheres to the requested format, ordering, counts, or style constraints that professionals actually require.

// Language Models (LMs) have seen recent success, driven primarily by their ability to follow instructions. Techniques like instruction tuning and reinforcement learning (RL) have proven effective at aligning models to user intent @wang_self-instruct_2023; @he_can_2023. However, most evaluations focus on general-domain tasks. In high-stakes fields like finance, instructions are often complex and multi-step, making instruction fidelity a critical point of failure @diao_guidebench_2025.

// Financial professionals require LLMs to perform multi-step quantitative reasoning, apply deep domain knowledge, and adhere to strict formatting and compliance constraints dictated by regulatory and procedural guidelines. An error in a generated financial report or a failure to follow a specific constraint can have significant consequences. Recent studies confirm these challenges, showing that even state-of-the-art models struggle with expert-domain instructions @murthy_kcif_2025 and adversarial prompts that conflict with their learned priors @li_instruction-following_2023.

We address this gap by introducing Instruction Following for Finance (IFF), a finance-grounded benchmark that stress-tests Language Models under realistic, verifiable constraints.The IFF benchmark consists of three core components. First, we curate a compact but diverse suite of real-world finance tasks including bond-spread tables, AML triage notes, settlement run-books etc. Second, we develop a comprehensive library of verifiable instruction types that span the full spectrum of what financial professionals encounter. These include structural and format requirements like tables with exact headers and ordered checklists, compositional directives including sorting and filtering with precise cardinality constraints, typography and markup conventions from bold formatting to LaTeX snippets, and domain-specific normalization standards that matter in finance such as currency codes rather than symbols, standardized date formats, and regulatory citation styles. Third, each benchmark item includes deterministic checkers that make scoring both fast and reproducible.

We evaluate over #num_models_evaluated leading proprietary and open-source language models in a strict zero-shot setting to assess their out-of-the-box instruction-following capabilities. Our evaluation uses regex-based verification to automatically score instruction compliance across all benchmark items.

We release all prompts, verifiers, and evaluation code as open-source tools to enable standardized comparisons and support future work on verifiable-reward training for high-stakes domains.

(TBD: After results section to update our findings) Our findings provide a sobering reality check. While frontier models like GPT-4 show impressive capabilities, they consistently struggle with the precision demanded by financial workflows. We document substantial performance gaps between proprietary and open-source models, with quantitative reasoning emerging as a persistent weakness across the board. The results suggest that reliable instruction following in high-stakes financial contexts remains an open challenge, one that will require targeted advances in model training and evaluation methodologies.

= Related work


Our research builds on the combined effort from literature that can be grouped into two strands: instruction-tuned language models and their general evaluation, and domain-specific benchmarks in financial NLP.


== Instruction Tuning and Evaluation

Instruction tuning and preference-based fine-tuning methods such as InstructGPT @ouyang_training_2022 and efforts like Self-Instruct @wang_self-instruct_2023 and WizardLM @xu_wizardlm_2025 have improved model compliance with general user directives. Evaluations of these models have relied on broad benchmarks such as SuperGlUE or MMLU. Broad benchmarks measure task accuracy but not consistency to fine-grained constraints. More specialized frameworks like IFEval @zhou_instruction-following_2023 and its successors @chen_recent_2025; @hwang_llms_2025 have introduced verifiable instructions—machine-checkable constraints on length, formatting, or keyword inclusion—to automate compliance checking. However, these evaluations are largely domain-agnostic, and the constraints they test do not capture the specialized demands of financial workflows. 

== Financial NLP benchmarks

Financial applications are subject to constraints beyond those targeted by general instruction-tuned benchmarks. Tasks often require multi-step reasoning, strict output formatting schemes, and regulatory-driven constraints. Existing benchmarks such as FiQA, FinQA, and TAT-QA primarily focus on sentiment analysis, numerical QA, or hybrid table-text reasoning. These resources measure financial reasoning accuracy and support the development of domain-adapted models. However, they do not address instruction consistency. Particularly, they lack constraints common in financial workflows, such as producing tabular outputs with exact headers, reporting numerical results at mandated precision, or including regulatory disclaimers. As a result, existing finance benchmarks cannot determine whether model outputs are not only factually correct but also procedurally compliant


On the other hand, they do not test whether models adhere to procedural instructions. This gap is critical in practice. Financial outputs that are factually accurate but structurally non-compliant may be unusable for downstream systems or regulatory review.

= The IFF Benchmark

IFF Benchmark targets instruction following in finance rather than open-ended problem solving. We build IFF on a hybrid model that assesses both high-level task completion and low-level instruction compliance.

== Design and scope

(here insert a figure with bunch of prompt types)
Instruction Following for Finance (IFF) pairs *realistic finance prompts with verifiable output constraints*. Instead of a handful of reusable task families, we built a broad, SME-curated set of distinct prompts that mirror day-to-day work products such as ops run-books, settlement checklists, filing packs, recap tables, and short memos. The design emphasizes controllability over fluency: structured outputs dominate (especially tables and checklists) and many items enforce exact cardinality, fixed ordering, and explicit styling. We model three composition patterns that capture common analyst workflows. AND requires meeting several independent constraints at once (for example, exact row counts, a named sort key, and a specific heading). CHAIN sequences steps where the output of one step becomes the input to the next, so an early slip propagates and the whole attempt is considered incorrect. NESTED represents if/else policies: the model must select the correct branch from context and then satisfy the branch-local rules.

Outputs are operational artifacts. Tables and checklists make up roughly three-fifths of items; the rest are concise prose or code-like snippets. The design emphasizes controllability over fluency: about half of the prompts require a specific Markdown table schema, roughly two-fifths require exact cardinalities (e.g., “exactly six bullets”), and around a third enforce ordering or deduplication. Style cues—bold/italic/underline, currency code normalization, footnotes, fenced LaTeX—are integral to correctness rather than presentation. Coverage spans many finance sub-domains with a deliberate long tail of singletons, pushing models to transfer instruction-following skill across topics instead of overfitting to a few verticals. Prompts forbid inventing data; when numbers are provided, the correct behavior is to copy them faithfully or apply a simple, stated transform..Coverage is intentionally long-tailed: the benchmark spans a wide range of finance sub-domains, with many appearing only once, so instruction fidelity must transfer across topics rather than overfit to a narrow vertical. A detailed breakdown of formats and constraint types appears in the appendix. *(Do we have it in appendix A?*)

// The IFF benchmark contains over *#num_prompts financial instruction-following tasks*. We frame these tasks as prompts that a financial analyst might pose to an AI assistant. We design the prompts to be complex, requiring multiple steps, domain knowledge, and strict adherence to constraints @he_can_2023. 

// We intentionally use a hybrid design. Given the known challenges of relying on LM-based judges for open-ended tasks @liu_reife_2024, we include a verifiable instruction component in IFF. This component provides a layer of objective, automated checks that complements and validates the results from the LM-judged holistic tasks. We divide the benchmark into two main components:

// *Holistic Financial Tasks:* This component includes tasks that mirror real-world financial analysis workflows. We categorize them as follows:
//   - *Analytical QA:* Prompts that require retrieving figures from provided text (e.g., a quarterly report excerpt), performing calculations, and providing an explanatory narrative. (e.g., _"Using the provided quarterly report excerpt, calculate the year-over-year revenue growth and explain the factors contributing to this change."_)
//   - *Policy/Scenario Evaluation:* Prompts that require reasoning about the consequences of a financial event or policy change. (e.g., _"If the Federal Reserve raises interest rates by 0.5%, list three likely impacts on bank profitability and provide reasoning."_)
//   - *Data Extraction & Transformation:* Prompts that test the model's ability to parse financial documents, extract specific information, and structure it in a requested format. (e.g., _"From the given financial statement, extract all expense line items, total them, and output the result in JSON format."_)
//   - *Advice/Recommendation:* Prompts that require the model to adopt a role (e.g., a financial advisor) and provide justified recommendations based on given context.

// + *Verifiable Instructions.* We embed over *#num_instruction_types distinct, verifiable instruction types* within the holistic tasks. These are inspired by the IFEval framework @zhou_instruction-following_2023 but adapted for finance. This allows for automated, fine-grained checking of compliance. Examples include:
//   - *Formatting.* We require the use of bold, italics, bullet points, or specific heading structures. (e.g., _"List three risk factors, with the word 'Risk' in *bold* for each."_)
//   - *Quantitative Constraints.* We specify requirements for numerical precision, calculations, or specific counts. (e.g., _"Report the VaR with two decimal precision,"_ or _"List exactly three impacts."_)
//   - *Content Constraints.* We mandate the inclusion of specific keywords, phrases, or citations. (e.g., _"Summarize the report and ensure you mention the 'forward-looking statements' section."_)
//   - *Stylistic Constraints.* We require adherence to a specific tone or length. (e.g., _"Answer in one sentence,"_ or _"Write in the tone of a formal financial report."_)

// == Evaluation procedure
// We design our evaluation protocol to be rigorous and multi-faceted.

// - *Zero-Shot Evaluation.* We evaluate all models in a strict zero-shot setting. We provide the instruction prompt with necessary context but give no examples or task-specific fine-tuning. This tests their out-of-the-box generalization capabilities.

// - *Hybrid Scoring:* We employ a multi-pronged scoring strategy:
//   - *Reference Comparison:* For tasks with a single correct answer (e.g., numerical calculations, factual extractions), we compare the model's output against a ground-truth solution.
//   - *LM-based Judging.* For more open-ended responses, we use GPT-4 as an automated judge. We select GPT-4 as our judge because meta-evaluation studies like @liu_reife_2024 show that top-tier proprietary models are currently the most accurate automated evaluators. We acknowledge the potential for biases in LM-based evaluation. To mitigate potential positional biases, we conduct each pairwise comparison twice, swapping the order of the two responses, and average the results.
//   - *Automated Compliance Checking.* To check for instruction compliance, we employ a dual-mode evaluation protocol to distinguish between perfect adherence and "almost correct" responses.
//     + *Strict Mode.* This mode enforces an exact match against all instruction requirements. We parse the model's response exactly as provided, with no tolerance for formatting variations or minor deviations.
//     + *Loose Mode.* Recognizing that models may produce semantically correct but stylistically imperfect output, this mode is more forgiving. Before checking compliance, our engine generates several variants of the model's response by systematically removing common LLM-induced artifacts (e.g., conversational preambles, markdown formatting, extra whitespace). We consider an instruction passed if *any* variant meets the constraint.
  
//     Using these two modes, we report two primary metrics:
//     + *Prompt-Level Accuracy.* A binary score where a prompt passes only if the model satisfies *all* of its embedded instructions.
//     + *Instruction-Level Accuracy.* The percentage of individual instructions the model successfully follows across the entire benchmark, providing a granular view of model capabilities.

== Evaluation procedure
Our evaluation protocol is designed to be rigorous and multi-faceted.

- *Zero-Shot Evaluation:* All models are evaluated in a strict zero-shot setting. They receive the instruction prompt with necessary context but are given no examples or task-specific fine-tuning. This tests their out-of-the-box generalization capabilities.

- *Hybrid Scoring:* We employ a multi-pronged scoring strategy:
  - *Reference Comparison:* For tasks with a single correct answer (e.g., numerical calculations, factual extractions), we compare the model's output against a ground-truth solution.
  - *LM-based Judging:* For more open-ended responses, we use GPT-4 as an automated judge. We select GPT-4 as our judge following findings from meta-evaluation studies like @liu_reife_2024 which show that top-tier proprietary models currently serve as the most accurate automated evaluators. However, we acknowledge the potential for biases in LM-based evaluation. To mitigate potential positional biases, for each pairwise comparison, we conduct the evaluation twice, swapping the order of the two responses, and average the results.
  - *Automated Compliance Checking:* // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // To check for instruction compliance, we employ a dual-mode evaluation protocol designed to distinguish between perfect adherence and "almost correct" responses.
    + *Strict Mode:* This mode enforces an exact match against all instruction requirements. The model's response is parsed exactly as provided, with no tolerance for formatting variations or minor deviations.
    + *Loose Mode:* Recognizing that models may produce semantically correct but stylistically imperfect output, this mode is more forgiving. Before checking compliance, the engine generates several variants of the model's response by systematically removing common LM-induced artifacts (e.g., conversational preambles, markdown formatting, extra whitespace). An instruction is passed if *any* variant meets the constraint.
  
    Using these two modes, we report two primary metrics:
    + *Prompt-Level Accuracy:* A binary score where a prompt passes only if *all* of its embedded instructions are satisfied.
    + *Instruction-Level Accuracy:* The percentage of individual instructions successfully followed across the entire benchmark, providing a granular view of model capabilities.

/*
- *Multi-Sample Strategy:* To account for the stochastic nature of LMs, we experiment with a multi-sampling approach. For a subset of complex reasoning tasks, we generate 3 independent outputs from each model (at a non-zero temperature). We then analyze the results to measure both consistency and "best-case" performance (Pass\@3), analogous to the self-consistency method, to see if multiple attempts can mitigate reasoning errors.
*/

=== Framework
We support our evaluation protocol with a robust and extensible framework that we designed for comprehensive research. To facilitate the evaluation of a wide array of language models, we use the `litellm` library to act as our gateway for LM providers, which lets us compare models from various sources. For every API call, we automatically record all metrics, including token usage (prompt, completion, and total), API latency in milliseconds, and the financial cost of the call. We save this metadata alongside the evaluation results for post-generation analysis. The framework is centered around the central instruction registry which is where definitions of instruction types and verification methods are stored. Researchers can add new and even more complex instructions by implementing a simple checker class. 

= Results
We evaluate a broad range of models, covering various sizes and architectures. Our evaluation includes closed-source, open-source, and open-weight models. In Table 1 below, we present the performance metrics for each model using both strict and loose verification for instruction correctness.

// === Results table (NeurIPS-style, compact)
#let name-col = 32.0em
#let num-col  = 6.0em
#let pad      = (x: 4.5pt, y: 1.6pt)
#set text(size: 9pt)
#let band-prop = rgb("#eee9fb")
#let band-source = rgb("#f3eee1")
#let band-weight   = rgb("#e6eef2")

#figure(
  table(
    columns: (name-col, num-col, num-col),
    align: (x, y) => if x == 0 { left } else { right },
    inset: pad,
    stroke: none,
    toprule,
    table.header([*Model*], [*Strict*], [*Loose*]),
    midrule,
    table.cell(colspan: 3, fill: band-prop, inset: (x: 6pt, y: 2pt))[*Closed-source LMs*],
    [claude-sonnet-claude-3-7-sonnet-20250219], [65.9], [70.5],
    [gpt-4o], [63.6], [69.3],
    [claude-opus-4-1-20250805], [62.5], [69.3],
    [claude-opus-4-20250514], [60.2], [65.9],
    [openai-o-series-o3], [60.2], [62.5],
    [gpt-4.1], [59.1], [61.4],
    [openai-o-series-o4-mini], [59.1], [60.2],
    [openai-o-series-o1], [58.0], [58.0],
    [openai-o-series-o3-mini], [56.8], [56.8],
    [gpt-4o-mini], [54.5], [58.0],
    [claude-haiku-claude-3-5-haiku-20241022], [53.4], [61.4],
    [gpt-5-mini], [53.4], [53.4],
    [claude-haiku-claude-3-haiku-20240307], [51.1], [54.5],
    [gpt-4.1-nano], [47.7], [52.3],
    [gpt-5], [47.7], [50.0],
    [gpt-4.1-mini], [46.6], [51.1],
    [claude-sonnet-4-20250514], [45.5], [52.3],
    [gpt-5-nano], [15.9], [15.9],

    table.cell(colspan: 3, fill: band-source, inset: (x: 6pt, y: 2pt))[*Open-source LMs*],
    [olmo-2-0325-32b-instruct], [45.5], [48.9],
    [marin-community-marin-8b-instruct], [37.5], [38.6],
    [olmo-2-1124-13b-instruct], [31.8], [39.8],
    [olmo-2-1124-7b-instruct], [29.5], [36.4],
    [olmo-2-0425-1b-instruct], [14.8], [18.2],

    table.cell(colspan: 3, fill: band-weight, inset: (x: 6pt, y: 2pt))[*Open-weight LMs*],
    [meta-llama-4-llama-4-maverick-17b-128e-instruct-fp8], [*76.1*], [*79.5*],
    [meta-llama-3.3-llama-3.3-70b-instruct-free], [71.6], [72.7],
    [meta-llama-4-llama-4-scout-17b-16e-instruct], [70.5], [75.5],
    [meta-llama-3.3-llama-3.3-70b-instruct], [70.5], [71.6],
    [meta-llama-3.1-405b-instruct], [67.0], [72.7],
    [deep-cogito-cogito-v2-preview-llama-70b], [69.3], [73.9],
    [deep-cogito-cogito-v2-preview-llama-405b], [64.8], [67.0],
    [qwen-qwq-32b], [63.6], [64.8],
    [qwen3-235b-a22b-instruct-2507-tput], [61.4], [67.0],
    [moonshot-kimi-k2-instruct], [60.2], [63.6],
    [qwen-2.5-qwen2.5-72b-instruct], [59.1], [63.6],
    [deepseek-r1-0528-tput], [59.1], [60.2],
    [deepseek-v3.1], [58.0], [59.1],
    [deepseek-v3], [56.8], [60.2],
    [deepseek-r1-distill-llama-70b], [55.7], [60.2],
    [openai-gpt-oss-gpt-oss-120b], [53.4], [53.4],
    [openai-gpt-oss-gpt-oss-20b], [53.4], [53.4],
    [meta-llama-3-llama-3-70b-chat-hf], [53.4], [63.6],
    [deepseek-r1-distill-qwen-14b], [50.0], [53.4],
    [mistral-ai-mistral-small-24b-instruct-2501], [47.7], [51.1],
    [deep-cogito-cogito-v2-preview-llama-109b-moe], [45.5], [62.5],
    [meta-llama-3.1-8b-instruct], [44.3], [48.9],
    [google-gemma-gemma-3n-e4b-it], [42.0], [45.5],
    [deep-cogito-cogito-v2-preview-deepseek-671b], [40.9], [54.5],
    [meta-llama-3-8b-instruct-lite], [39.8], [47.7],
    [qwen-2.5-qwen2.5-7b-instruct], [35.2], [37.5],
    [mistral-ai-mistral-7b-instruct-v0.3], [28.4], [34.1],
    [meta-llama-3.2-llama-3.2-3b-instruct], [28.4], [29.5],
    [mistral-ai-mistral-7b-instruct-v0.2], [27.3], [34.1],
    [mistral-ai-mistral-7b-instruct-v0.1], [19.3], [21.6],
    botrule,
  ),
  caption: [Model performance on the IFF Benchmark],
) <results-table>


== Overall Performance
We observe a wide performance gap between top-tier proprietary models and their open-source counterparts. We find that ??????? is the clear leader, achieving an overall accuracy of approximately ???. Both ????? and ????? follow, with scores in the ????? range. ????lags behind at roughly ????, which confirms that the latest generation of models has made significant strides in handling complex instructions. Among open-source models, ???? is the top performer in instruction compliance, reaching ???? strict accuracy. When we analyze across each instruction type, we get a more granular view of model behavior. Here, ??? again demonstrates superior performance. We find that it achieves ??? prompt-level accuracy in strict mode and ??? in loose mode. This indicates that it follows instructions almost perfectly, with only minor, infrequent lapses. ??? also performs strongly, with around ??? strict prompt accuracy. The gap is more pronounced for other models. ??? achieves a respectable ??? strict prompt-level compliance, but this is still ??? points behind ???. We find that models often fail to adhere to the precise formatting or structural requirements of an instruction. The larger gap between strict and loose scores for open-source models indicates that many of their failures are "almost correct" outputs that miss a specific detail.

== Limitations

A key limitation of this study is that our evaluation relies on a single response sample for each task from every model. While multi-sample strategies like self-consistency can improve reliability and mitigate the impact of stochasticity in model outputs, the significant API costs associated with generating multiple responses per prompt were prohibitive given our project's limited funding. Future work with greater resources should explore the impact of multi-sample evaluation on our findings.
- *Extraction and Formatting:* Models were generally proficient at extracting information and adhering to structured output formats like JSON or bulleted lists. GPT-4 and Claude exceeded 85% accuracy. The primary failure mode for other models was partial compliance, such as mixing explanatory text with the requested JSON object.
- *Analytical Reasoning:* GPT-4 and Claude 2 excelled at prompts requiring a chain of reasoning based on domain knowledge, producing well-structured and coherent analyses over 80% of the time. Open-source models often provided relevant terminology but sometimes failed to structure the answer clearly or directly address all parts of the query.
- *Compliance and Constraints:* We observed a sharp difference in alignment when testing precise constraints (e.g., "List _exactly three_ impacts"). GPT-4 and Claude almost always respected these constraints, whereas other models frequently violated them by providing more or fewer items than requested. This demonstrates the effectiveness of extensive RLHF in teaching models to obey fine-grained instructions.

/*
== Impact of Multiple Samples
The multi-sample self-consistency strategy yielded modest but significant gains. For high-performing models like GPT-4 and Claude, the improvement was small (+3-5%), as they often produce the correct answer on the first attempt. However, for models like GPT-3.5 and LLaMA-2 70B, the improvement was larger, with accuracy on complex reasoning tasks increasing by up to 10-12 percentage points. This suggests that for less reliable models, generating multiple candidates and selecting the most consistent or highest-quality answer is a viable strategy to boost accuracy.
*/

== Error Analysis
Common error types included:
- *Calculation Mistakes:* The most frequent error type, especially for models without integrated tool use.
- *Ignoring Part of an Instruction:* Models often addressed only the primary part of a multi-part prompt, neglecting secondary constraints or requests for explanation.
- *Hallucinated Content:* In a few instances, models introduced facts or figures not present in the provided context, a critical failure mode for data-driven financial tasks.
- *Surface-Level Deception:* In some cases, models produced answers that were well-formatted and fluent but factually incorrect or non-compliant. This highlights the risk of 'surface-level deception', where an LM-as-a-judge might be swayed by style over substance @ye_flask_2023, reinforcing the need for multi-faceted evaluation.
- *Formatting Issues:* A notable portion of errors stemmed from failing to adhere to output formats, such as providing a conversational answer when a structured one was requested.

== The Instruction Hierarchy in Finance

We also observed a tension in what might be termed the "instruction hierarchy". When faced with a complex analytical task (e.g., summarizing market risks) and a strict, verifiable constraint (e.g., "the summary must be exactly 75 words"), models must make a trade-off. We found that some models, particularly those highly tuned for conversational quality, would often prioritize producing a fluent, high-quality analysis while failing the length constraint. Conversely, other models, when trained specifically on constraint following, would sometimes sacrifice the quality or coherence of the analysis to meet the verifiable requirement precisely. This highlights a key challenge for the development of financial assistants: building models that can gracefully balance the primary analytical task with strict adherence to secondary constraints, without sacrificing one for the other.

== Limitations

A key limitation of this study is that our evaluation relies on a single response sample for each task from every model. While multi-sample strategies like self-consistency can improve reliability and mitigate the impact of stochasticity in model outputs, the significant API costs associated with generating multiple responses per prompt were prohibitive given our project's limited funding. Future work with greater resources should explore the impact of multi-sample evaluation on our findings.

= Conclusion

In this paper, we introduced IFF, a comprehensive benchmark for evaluating the instruction-following capabilities of Language Models in the financial domain. Our systematic evaluation adherence to constraintsLM``LM``of proprietary and open-source models reveals that while the state-of-the-art is impressive, significant gaps remain. We find that the leading models, such as GPT-4, demonstrate strong performance but are not infallible, particularly on tasks involving complex numerical reasoning and strict constraint adherence. Given the complexities of LLM-based evaluation, we believe that IFF's hybrid approach, which combines verifiable checks with LLM-judged open-ended tasks, provides a more robust and reliable assessment of true instruction-following capability.

We believe our findings have important implications for the deployment of LMs in high-stakes environments. We show that blindly trusting an LM's output is risky, as even a fluent and factually plausible response may have failed to adhere to a critical instruction. We provide the IFF benchmark as a necessary tool for quantifying these risks and understanding model limitations before deployment. Our results also suggest that future progress will require more than just scaling; it will necessitate advances in alignment techniques @cheng_spar_2025, the integration of external tools (like calculators), and the incorporation of domain expertise in a way that complements, rather than conflicts with, general reasoning and instruction-following abilities.

In future work, we will focus on extending this foundation to create more challenging and adaptive evaluation scenarios. We propose a primary research direction in the development of a *Dynamic Benchmarking* system. While the current benchmark relies on a static set of prompts, we envision a system where the framework can programmatically generate novel and increasingly complex tasks. We believe this could involve automated instruction composition, adaptive difficulty based on model performance, and the incorporation of external, real-time data sources such as live market data or news feeds. Furthermore, we plan to expand the scope and complexity of the instructions themselves to better probe the reasoning and synthesis capabilities of advanced models. While we currently focus on finance, the underlying architecture is domain-agnostic, and we plan to extend our methodology to other specialized fields such as law and healthcare.

#heading(numbering: none)[References]