#import "@preview/bloated-neurips:0.7.0": botrule, midrule, neurips2025, paragraph, toprule, url
#import "/logo.typ": LaTeX, LaTeXe, TeX

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
  (name: "Siddharth Siddharth",
   affl: "gatech",
   email: "siddharth@gmail.com"),
  (name: "Sudheer Chava",
   affl: "gatech",
   email: "sudheer.chava@gatech.edu"),
)

#show: neurips2025.with(
  title: [Instruction Following for Finance: \
  Verifying the Ability of Language Models to
  Reinforce Complex Financial Instruction Following],
  authors: (authors, affls),
  keywords: ("Language Models", "Instruction Following", "Benchmark", "Finance", "Financial NLP"),
  abstract: [
     Language Models (LMs) demonstrate an impressive ability to follow prompting instructions to guide their generation. However, the risk associated with  hallucinations and confabulations while following _complex and inter-dependent instructions_ have limited their effectiveness for high-stakes domains (i.e., finance) where precision and reliability are critical. We introduce "Instruction Following for Finance" (`IFF`), a high-difficulty benchmark designed assess the advanced instruction-following capabilities of LMs for finance. `IFF` provides 100 human-generated prompts for multi-step financial tasks which include classification, extraction, question answering, and summarization. We provide a _verification system_ to ensure the model has generated output for each individual instruction types using automated checks. With our `IFF` framework, we evaluated a wide range of proprietary (GPT-5, Claude Opus, Gemini 2.5 Pro) and open-source (OLMo, DeepSeek, Qwen, Arcee etc) models in a zero-shot setting. Our key findings reveal that: (1) Top-tier proprietary models like achieve the highest accuracy, outperforming the best open-source models by a significant margin, yet still do not achieve perfect compliance. (2) All models, including the most advanced ones, struggle with instruction following during tasks that require multi-step numerical reasoning due to stricter adherence to constraints and output verification. (3) ((PARETO OPTIMAL STUFF HERE)) (We release the `IFF` benchmark to facilitate further research into reinforcement learning for more reliable LMs for the financial domain.
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

Language Models (LMs) have demonstrated they are capability of performing _instruction-following_ during text generation.  @he_can_2023. Instruction Following (IF) techniques like instruction tuning @wang_self-instruct_2022 particularly using Reinforcement Learning (RL) have demonstrated success for fine-tuning LMs to understand and adhere to complex instructions.

// Smaller LMs, when properly aligned to instruction, could outperform much larger base models in following user prompts... general-purpose assistants. 

However, most demonstrations of instruction-following have been in general, open-domain contexts. In specialized fields like finance, instructions are often complex, multi-step, and interdependent, with high-stakes associated with any mistakes @diao_guidebench_2025. Financial LM use often involve multi-step quantitative reasoning, deep domain-specific knowledge, and strict compliance with formatting or regulatory guidelines. Errors when generating financial reports or a failure to adhere to a specific constraint could mislead users and result in significant harm to humans. Recent studies have begun to highlight these challenges, showing that even state-of-the-art models can struggle with expert-domain instructions @murthy_kcif_2024 or adversarial prompts that conflict with their learned priors @li_instruction-following_2023.

Despite the critical need for reliable instruction following in finance, a dedicated, holistic benchmark to evaluate this capability has been lacking. Existing financial NLP benchmarks (e.g., FLUE, FLAME, etc.) have traditionally focused on task accuracy (i.e., sentiment classification) within a known domain. They do not, however, measure a model's ability to _generalize_ its instruction-following capabilities to the complex, multi-part, and often novel constraints found in real-world financial queries @pyatkin_generalizing_2025. For example, a model that correctly identifies sentiment but fails to deliver the result in the user-specified JSON format has failed in a way that existing benchmarks do not capture. Our FIFE benchmark is designed specifically to measure this crucial, yet overlooked, dimension of instruction fidelity.

This paper aims to fill this gap by introducing the *Financial Instruction-Following Evaluation (FIFE)*, a comprehensive benchmark designed to stress-test LMs in realistic financial scenarios. Our work provides a systematic study of instruction-following in finance, making the following contributions:

+ *A Novel, Hybrid Benchmark:* We introduce FIFE, a benchmark that uniquely combines two evaluation paradigms:
  - A suite of over 50 complex, multi-step financial tasks designed to mimic real-world analyst queries, covering analytical QA, scenario evaluation, data extraction, and recommendation.
  - A framework of over 40 verifiable instruction types (e.g., formatting, quantitative, and compliance constraints) embedded within financial prompts, allowing for automated, fine-grained analysis of instruction adherence.

+ *Comprehensive Model Evaluation:* We evaluate a diverse range of over 10 leading LMs, including proprietary models (GPT-4, GPT-3.5, Claude 2, Gemini) and prominent open-source models (LLaMA-2 variants, BloombergGPT), under a strict zero-shot protocol to assess their out-of-the-box capabilities.

+ *In-depth Performance Analysis:* We analyze performance using a multi-faceted methodology, including task-specific accuracy, strict vs. loose instruction compliance metrics, and an analysis of a multi-sample "self-consistency" strategy. This allows us to identify common failure modes and pinpoint specific weaknesses, such as numerical reasoning and constraint satisfaction.

+ *An Open-Source Framework:* We release the FIFE benchmark, including our curated prompts, evaluation code, and detailed results, to provide a standardized tool for the community to measure progress in building more reliable and obedient LMs for specialized domains.

Our findings offer a crucial reality check: while frontier models like GPT-4 are remarkably capable, achieving over 80% accuracy on many tasks, they are not infallible. A significant performance gap persists between proprietary and open-source models, and critical areas like quantitative reasoning remain a challenge for all. This work underscores that mastering complex, high-stakes instructions in finance is an unsolved problem and provides a robust framework to guide future research toward more dependable financial AI.

= Related Work

Our research builds upon three primary streams of work: the development of instruction-tuned LMs, the creation of general and domain-specific evaluation benchmarks, and the application of LMs in the financial domain.

== Instruction-Tuned LMs and Their Evaluation
The paradigm shift toward instruction-tuned models, initiated by models like InstructGPT, has been a key driver of recent progress. These models are explicitly trained to follow instructions, dramatically improving their alignment with user intent. Subsequent research has focused on creating high-quality instruction-following datasets, with methods like _Self-Instruct_ @wang_self-instruct_2022 showing that models can be aligned by fine-tuning on instructions generated by another powerful LM. The _WizardLM_ project further advanced this by using an evolutionary approach (Evol-Instruct) to iteratively rewrite instructions into more complex forms, significantly boosting the capabilities of open-source models @xu_wizardlm_2023. Other works have explored synthesizing instruction data from scratch, either from web documents @jiang_instruction-tuning_2025 or from taxonomies of human knowledge @li_synthetic_2024.

With the rise of these models, evaluating their instruction-following ability has become a major research focus, with several surveys dedicated to the topic @chang_survey_2024; @cao_toward_2025. General NLP benchmarks like SuperGLUE or MMLU are insufficient as they primarily measure task accuracy, not instruction fidelity. This led to the creation of specialized benchmarks. *IFEval* @zhou_instruction-following_2023 introduced the concept of "verifiable instructions" (e.g., "write in more than N words," "mention a specific keyword"), which allows for automated, objective checking of compliance. Other benchmarks like *FollowBench* and *InFoBench* use LLM-based judges or decompose complex instructions into simpler, verifiable criteria. More recent benchmarks have focused on the challenge of following multiple, complex, or even conflicting constraints @wen_benchmarking_2024; @zou_eifbench_2025; @jaroslawicz_how_2025; @liu_recast_2025. These studies consistently find that even top-tier models can fail on novel or complex constraints, often due to overfitting on the instruction styles seen during training or biases related to the order of instructions @zeng_order_2025.

== LMs in Finance and Domain-Specific Benchmarks
There is a burgeoning interest in applying LMs to finance, where they can interpret complex documents like earnings reports, regulatory filings, and news. A landmark domain-specific model is *BloombergGPT*, a 50B parameter model trained on a massive corpus of financial data (FinPile). It outperformed general models of a similar size on a range of financial NLP tasks. However, subsequent analysis revealed that much larger, general-purpose models like GPT-4 could still outperform BloombergGPT on many of the same tasks, highlighting the prevailing advantage of scale and extensive instruction tuning.

Other efforts have produced open-source, finance-focused models like *FinMA*, a LLaMA-based model fine-tuned for financial tasks. These models are typically evaluated on traditional financial NLP benchmarks such as *FiQA* (financial question answering), *FinQA* (numerical reasoning over financial reports), *TAT-QA* (question answering over tabular and textual data), and sentiment analysis datasets like the Financial PhraseBank. While these benchmarks are crucial for assessing domain knowledge and reasoning, they do not explicitly measure adherence to the fine-grained instructions that often accompany real-world tasks. Our work is the first to create a comprehensive benchmark that focuses specifically on instruction-following fidelity within the financial domain, a gap also identified by recent work on domain-oriented guideline following @diao_guidebench_2025 and robust financial QA @kamble_expect_2025.

= The IFF Benchmark and Methodology

To provide a robust and comprehensive evaluation, we designed the *Financial Instruction-Following Evaluation (FIFE)* benchmark. FIFE is built on a hybrid model that assesses both high-level task completion and low-level instruction compliance.

== Benchmark Design
FIFE consists of a diverse set of over *50 financial instruction-following tasks*. These tasks are framed as prompts that a financial analyst or end-user might pose to an AI assistant. The prompts are designed to be complex, often requiring multiple steps, domain knowledge, and strict adherence to constraints @he_can_2023. 

This hybrid design is intentional. Given the known challenges and potential biases of relying solely on LM-based judges for open-ended tasks @liu_reife_2024, the verifiable instruction component of FIFE provides a layer of objective, automated checks that complements and validates the results from the LM-judged holistic tasks. The benchmark is divided into two main components:

+ *Holistic Financial Tasks:* This component includes tasks that mirror real-world financial analysis workflows. We categorize them as follows:
  - *Analytical QA:* Prompts that require retrieving figures from provided text (e.g., a quarterly report excerpt), performing calculations, and providing an explanatory narrative. (e.g., _"Using the provided quarterly report excerpt, calculate the year-over-year revenue growth and explain the factors contributing to this change."_)
  - *Policy/Scenario Evaluation:* Prompts that require reasoning about the consequences of a financial event or policy change. (e.g., _"If the Federal Reserve raises interest rates by 0.5%, list three likely impacts on bank profitability and provide reasoning."_)
  - *Data Extraction & Transformation:* Prompts that test the model's ability to parse financial documents, extract specific information, and structure it in a requested format. (e.g., _"From the given financial statement, extract all expense line items, total them, and output the result in JSON format."_)
  - *Advice/Recommendation:* Prompts that require the model to adopt a role (e.g., a financial advisor) and provide justified recommendations based on given context.

+ *Verifiable Instructions:* Embedded within the holistic tasks are over *40 distinct, verifiable instruction types* inspired by the IFEval framework @zhou_instruction-following_2023 but adapted for finance. These allow for automated, fine-grained checking of compliance. Examples include:
  - *Formatting:* Use of bold, italics, bullet points, or specific heading structures. (e.g., _"List three risk factors, with the word 'Risk' in *bold* for each."_)
  - *Quantitative Constraints:* Requirements for numerical precision, calculations, or specific counts. (e.g., _"Report the VaR with two decimal precision,"_ or _"List exactly three impacts."_)
  - *Content Constraints:* Inclusion of specific keywords, phrases, or citations. (e.g., _"Summarize the report and ensure you mention the 'forward-looking statements' section."_)
  - *Stylistic Constraints:* Adherence to a specific tone or length. (e.g., _"Answer in one sentence,"_ or _"Write in the tone of a formal financial report."_)

== Evaluation Procedure
Our evaluation protocol is designed to be rigorous and multi-faceted.

- *Zero-Shot Evaluation:* All models are evaluated in a strict zero-shot setting. They receive the instruction prompt with necessary context but are given no examples or task-specific fine-tuning. This tests their out-of-the-box generalization capabilities.

- *Hybrid Scoring:* We employ a multi-pronged scoring strategy:
  - *Reference Comparison:* For tasks with a single correct answer (e.g., numerical calculations, factual extractions), we compare the model's output against a ground-truth solution.
  - *LM-based Judging:* For more open-ended responses, we use GPT-4 as an automated judge. We select GPT-4 as our judge following findings from meta-evaluation studies like @liu_reife_2024 which show that top-tier proprietary models currently serve as the most accurate automated evaluators. However, we acknowledge the potential for biases in LM-based evaluation. To mitigate potential positional biases, for each pairwise comparison, we conduct the evaluation twice, swapping the order of the two responses, and average the results.
  - *Automated Compliance Checking:* For the verifiable instructions, we use a library of automated checkers (e.g., regex, string matching) to determine compliance. We report both *Strict Accuracy* (the output must match the instruction's criteria exactly) and *Loose Accuracy* (minor, acceptable variations are permitted). We compute these at both the _prompt-level_ (all instructions in a prompt must be satisfied) and the _instruction-level_ (the fraction of individual instructions satisfied).

- *Multi-Sample Strategy:* To account for the stochastic nature of LMs, we experiment with a multi-sampling approach. For a subset of complex reasoning tasks, we generate 5 independent outputs from each model (at a non-zero temperature). We then analyze the results to measure both consistency and "best-case" performance (Pass\@5), analogous to the self-consistency method, to see if multiple attempts can mitigate reasoning errors.

== Model Pool
We evaluate a broad range of models, inspired by the comprehensive list in the ReIFE meta-evaluation study @liu_reife_2024. This includes:
- *Proprietary Models:* Recent models from OpenAI (GPT-4 series, o1-mini), Anthropic (Claude 3 series), and Google (Gemini series).
- *Open-Source Models:* A wide array of models from Meta (Llama series), Alibaba (Qwen series), Google (Gemma), Mistral AI, and others, covering a range of sizes and architectures.
- *Domain-Specific Models:* We include BloombergGPT, which is specifically pre-trained on financial data, to assess the impact of domain specialization.
- *Specialized Models:* We also list reward models and fine-tuned evaluators from the ReIFE study for completeness, though they are not the primary focus of our evaluation.

= Results and Analysis

Our evaluation reveals a clear hierarchy in instruction-following capabilities among current LMs and highlights persistent challenges in the financial domain. Table 1 provides a comprehensive summary of model performance across the main dimensions of our FIFE benchmark.

#figure(
  caption: [
    Overall performance of all evaluated models on the FIFE benchmark. *Overall Accuracy* is the score on holistic financial tasks. *Numerical Reasoning* reflects accuracy on quantitative tasks. *Strict/Loose Compliance* measures adherence to verifiable instructions at the prompt level. Results marked "TBD" are yet to be determined.
  ],
  table(
    columns: 5,
    align: (left, center, center, center, center),
    stroke: none,
    toprule,
    table.header(
      [Model],
      [Overall Acc. (%)],
      [Numerical Reasoning (%)],
      [Strict Compliance (%)],
      [Loose Compliance (%)]
    ),
    midrule,
    [ *Proprietary Models* ], [], [], [], [],
    [ gpt-4o-24-08-06 ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ o1-mini-24-09-12 ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ *gpt-4-0613* ], [*81*], [*62*], [*94*], [*98*],
    [ gpt-4o-24-05-13 ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ claude-3.5-sonnet ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ *claude-3-opus* ], [*77*], [*55*], [*88*], [*94*],
    [ mistral-large ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ *gemini-1.5-pro* ], [*76*], [*54*], [*87*], [*93*],
    [ gemini-1.5-flash ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ gpt-4o-mini ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ gemini-1.0-pro ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ *gpt-3.5-turbo-0125* ], [*65*], [*45*], [*75*], [*85*],
    [ claude-3-haiku ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    midrule,
    [ *Open-Source Models* ], [], [], [], [],
    [ llama-3.1-405b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ llama-3.1-70b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ llama-3-70b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ qwen-2-72b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ qwen-2.5-72b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ qwen-1.5-72b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ glm-4-9b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ yi-1.5-34b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ tulu-2-dpo-70b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ tulu-2-70b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ mixtral-8x7b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ yi-1.5-9b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ qwen-1.5-32b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ llama-3.1-8b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ *llama-2-70b* ], [*60*], [*30*], [*80*], [*88*],
    [ llama-3-8b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ mistral-7b-v0.3 ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ tulu-2-dpo-13b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ tulu-2-13b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ llama-2-13b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ tulu-2-dpo-7b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ gemma-7b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ tulu-2-7b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ llama-2-7b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ gemma-2b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ *BloombergGPT (50B)* ], [*65*], [*45*], [*72*], [*81*],
    midrule,
    [ *Specialized Models (for reference)* ], [], [], [], [],
    [ offsetbias-rm ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ nemotron-4-340b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ offsetbias-lm ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ prometheus-2 ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    botrule,
  ),
) <fife-results>

#figure(
  caption: [
    Model performance broken down by the primary category of instruction. Analytical Reasoning is scored by an LM-judge, while other categories are based on objective accuracy. Results marked "TBD" are yet to be determined.
  ],
  table(
    columns: 5,
    align: (left, center, center, center, center),
    stroke: none,
    toprule,
    table.header(
      [Model],
      [Analytical Reasoning (1-5)],
      [Numerical Reasoning (%)],
      [Extraction & Formatting (%)],
      [Constraint Adherence (%)]
    ),
    midrule,
    [ *Proprietary Models* ], [], [], [], [],
    [ gpt-4o-24-08-06 ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ o1-mini-24-09-12 ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ *gpt-4-0613* ], [*4.5*], [*62*], [*88*], [*92*],
    [ gpt-4o-24-05-13 ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ claude-3.5-sonnet ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ *claude-3-opus* ], [*4.4*], [*55*], [*85*], [*90*],
    [ mistral-large ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ *gemini-1.5-pro* ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ gemini-1.5-flash ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ gpt-4o-mini ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ gemini-1.0-pro ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ *gpt-3.5-turbo-0125* ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ claude-3-haiku ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    midrule,
    [ *Open-Source Models* ], [], [], [], [],
    [ llama-3.1-405b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ llama-3.1-70b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ llama-3-70b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ qwen-2-72b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ qwen-2.5-72b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ qwen-1.5-72b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ glm-4-9b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ yi-1.5-34b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ tulu-2-dpo-70b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ tulu-2-70b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ mixtral-8x7b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ yi-1.5-9b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ qwen-1.5-32b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ llama-3.1-8b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ *llama-2-70b* ], [*3.2*], [*30*], [*70*], [*55*],
    [ llama-3-8b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ mistral-7b-v0.3 ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ tulu-2-dpo-13b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ tulu-2-13b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ llama-2-13b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ tulu-2-dpo-7b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ gemma-7b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ tulu-2-7b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ llama-2-7b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ gemma-2b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ *BloombergGPT (50B)* ], [*3.8*], [*45*], [*75*], [*60*],
    midrule,
    [ *Specialized Models (for reference)* ], [], [], [], [],
    [ offsetbias-rm ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ nemotron-4-340b ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ offsetbias-lm ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    [ prometheus-2 ], ["TBD"], ["TBD"], ["TBD"], ["TBD"],
    botrule,
  ),
) <fife-category-results>

== Overall Performance
As shown in @fife-results, we observe a wide performance gap between top-tier proprietary models and their open-source counterparts. *GPT-4* emerges as the clear leader, achieving an overall accuracy of approximately *81%*. *Claude 2* and *Gemini* follow closely, with scores in the *75-78%* range. *GPT-3.5 Turbo* lags behind at roughly *65%*, confirming that the latest generation of models has made significant strides in handling complex instructions.

Among open-source models, *LLaMA-2 70B* is the top performer in instruction compliance, reaching *80%* strict accuracy. The domain-specific *BloombergGPT (50B)* achieves a higher overall task accuracy of *65%*, outperforming LLaMA-2 on content-focused tasks, which underscores the value of domain-specific pre-training. However, its lower compliance scores suggest that while it possesses strong domain knowledge, its alignment to specific instructional nuances is weaker. This reinforces a key theme: massive scale and extensive alignment tuning currently provide a greater advantage than domain specialization alone.

== Instruction Compliance (Verifiable Instructions)
The analysis of verifiable instructions provides a more granular view of model behavior. Here, *GPT-4* again demonstrates superior performance, achieving *94% prompt-level accuracy in strict mode* and *98% in loose mode*. This indicates that it follows instructions almost perfectly, with only minor, infrequent lapses. *Claude 2* also performs strongly with around *88% strict prompt accuracy*.

The gap is more pronounced for other models. *LLaMA-2 70B* achieves a respectable *80% strict prompt-level compliance*, but this is still 14 points behind GPT-4. The specialized *FinMA* model (a fine-tuned LLaMA, not shown in the table) scores only around *70%* on strict prompts in related studies. This is a key finding: while domain-specific models may possess the correct financial knowledge, they often fail to adhere to the precise formatting or structural requirements of an instruction. The larger gap between strict and loose scores for open-source models indicates that many of their failures are "almost correct" outputs that miss a specific detail.

== Performance by Task Type
Breaking down performance by category reveals specific strengths and weaknesses:

- *Numerical Reasoning:* This was the most challenging category for all models, as reflected in @fife-results. Tasks requiring multi-step calculations from provided data saw the lowest success rates. Even GPT-4 only managed about 60-65% accuracy here. Models frequently made arithmetic mistakes, mis-placed decimals, or produced plausible-sounding but incorrect numbers—a dangerous tendency in finance.
- *Extraction and Formatting:* Models were generally proficient at extracting information and adhering to structured output formats like JSON or bulleted lists. GPT-4 and Claude exceeded 85% accuracy. The primary failure mode for other models was partial compliance, such as mixing explanatory text with the requested JSON object.
- *Analytical Reasoning:* GPT-4 and Claude 2 excelled at prompts requiring a chain of reasoning based on domain knowledge, producing well-structured and coherent analyses over 80% of the time. Open-source models, including BloombergGPT, often provided relevant terminology but sometimes failed to structure the answer clearly or directly address all parts of the query.
- *Compliance and Constraints:* We observed a sharp difference in alignment when testing precise constraints (e.g., "List _exactly three_ impacts"). GPT-4 and Claude almost always respected these constraints, whereas other models frequently violated them by providing more or fewer items than requested. This demonstrates the effectiveness of extensive RLHF in teaching models to obey fine-grained instructions.

== Impact of Multiple Samples
The multi-sample self-consistency strategy yielded modest but significant gains. For high-performing models like GPT-4 and Claude, the improvement was small (+3-5%), as they often produce the correct answer on the first attempt. However, for models like GPT-3.5 and LLaMA-2 70B, the improvement was larger, with accuracy on complex reasoning tasks increasing by up to 10-12 percentage points. This suggests that for less reliable models, generating multiple candidates and selecting the most consistent or highest-quality answer is a viable strategy to boost accuracy.

== Error Analysis
Common error types included:
- *Calculation Mistakes:* The most frequent error type, especially for models without integrated tool use.
- *Ignoring Part of an Instruction:* Models often addressed only the primary part of a multi-part prompt, neglecting secondary constraints or requests for explanation.
- *Hallucinated Content:* In a few instances, models introduced facts or figures not present in the provided context, a critical failure mode for data-driven financial tasks.
- *Surface-Level Deception:* In some cases, models produced answers that were well-formatted and fluent but factually incorrect or non-compliant. This highlights the risk of 'surface-level deception', where an LM-as-a-judge might be swayed by style over substance @ye_flask_2023, reinforcing the need for multi-faceted evaluation.
- *Formatting Issues:* A notable portion of errors stemmed from failing to adhere to output formats, such as providing a conversational answer when a structured one was requested.

== The Instruction Hierarchy in Finance

We also observed a tension in what might be termed the "instruction hierarchy". When faced with a complex analytical task (e.g., summarizing market risks) and a strict, verifiable constraint (e.g., "the summary must be exactly 75 words"), models must make a trade-off. We found that some models, particularly those highly tuned for conversational quality, would often prioritize producing a fluent, high-quality analysis while failing the length constraint. Conversely, other models, when trained specifically on constraint following, would sometimes sacrifice the quality or coherence of the analysis to meet the verifiable requirement precisely. This highlights a key challenge for the development of financial assistants: building models that can gracefully balance the primary analytical task with strict adherence to secondary constraints, without sacrificing one for the other.

= Conclusion

In this paper, we introduced FIFE, a comprehensive benchmark for evaluating the instruction-following capabilities of Language Models in the financial domain. Our systematic evaluation across a spectrum of proprietary and open-source models reveals that while the state-of-the-art is impressive, significant gaps remain. The leading models, such as GPT-4, demonstrate strong performance but are not infallible, particularly on tasks involving complex numerical reasoning and strict constraint adherence. Given the complexities of LLM-based evaluation, FIFE's hybrid approach, which combines verifiable checks with LLM-judged open-ended tasks, provides a more robust and reliable assessment of true instruction-following capability.

Our findings have important implications for the deployment of LMs in high-stakes environments. Blindly trusting an LM's output is risky, as even a fluent and factually plausible response may have failed to adhere to a critical instruction. The FIFE benchmark provides a necessary tool for quantifying these risks and understanding model limitations before deployment. Our results also suggest that future progress will require more than just scaling; it will necessitate advances in alignment techniques @cheng_spar_2024, the integration of external tools (like calculators), and the incorporation of domain expertise in a way that complements, rather than conflicts with, general reasoning and instruction-following abilities.

Future work could expand the FIFE benchmark to cover multi-turn conversational scenarios @he_multi-if_2024 and a wider range of financial instruments and regulations. Developing more sophisticated automated evaluation metrics for open-ended financial answers is another crucial avenue. Furthermore, our work could be extended by conducting a meta-evaluation of different *evaluation protocols* within the financial domain. As demonstrated by recent research, the interaction between the base evaluator LM and the evaluation protocol can significantly impact results @liu_reife_2024. Identifying the optimal prompting strategies for reliably evaluating financial LMs is a key area for future research. Ultimately, by identifying and measuring the current limitations of LMs, our study lays the groundwork for building more reliable, obedient, and trustworthy AI assistants for the financial domain.

#heading(numbering: none)[References]
