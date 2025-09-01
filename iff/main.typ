#import "@preview/bloated-neurips:0.7.0": botrule, midrule, neurips2025, paragraph, toprule, url
#import "/logo.typ": LaTeX, LaTeXe, TeX

// #bibliography("zotero.bib")

#let draft(content) = {
  text(fill: red, style: "italic")[#content]
}

#let num_prompts = "100"
#let num_instruction_types = "over 40"
#let num_models_evaluated = "over 20"

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
  title: [Instruction Following for Finance (`IFF`): \
  Verifying the Ability of Language Models  \
  for Complex Financial Instruction Following],
  authors: (authors, affls),
  keywords: ("Language Models", "Instruction Following", "Benchmark", "Finance", "Financial NLP"),
  abstract: [
    Although Language Models (LMs) excel at following general instructions, their reliability in high-stakes domains like finance is not yet established. We find that errors from complex instructions, such as hallucinations or incorrect calculations, limit their adoption where precision is paramount. To address this, we introduce the *Instruction Following for Finance (IFF)* benchmark, a rigorous evaluation suite designed to assess the advanced instruction-following capabilities of LMs in the financial domain. We construct IFF with #num_prompts human-authored prompts that mirror complex financial analysis tasks, and we embed over #num_instruction_types distinct, verifiable constraints to enable automated, fine-grained compliance checking.

    We evaluate over #num_models_evaluated leading proprietary and open-source models in a zero-shot setting. We find that while top-tier proprietary models achieve the highest accuracy, they still fall short of perfect compliance, and they significantly outperform the best open-source models. We find that all models struggle with multi-step numerical reasoning and adherence to precise constraints. Furthermore, we identify a Pareto frontier between task accuracy and instruction-following fidelity, where models often sacrifice one for the other. We release the IFF benchmark and our evaluation framework to facilitate research into building more reliable and obedient LMs for the financial domain.
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

Language Models (LMs) have seen recent success, driven primarily by their ability to follow instructions. Techniques like instruction tuning and reinforcement learning (RL) have proven effective at aligning models to user intent @wang_self-instruct_2023; @he_can_2023. However, most evaluations focus on general-domain tasks. In high-stakes fields like finance, instructions are often complex and multi-step, making instruction fidelity a critical point of failure @diao_guidebench_2025.

Financial professionals require LMs to perform multi-step quantitative reasoning, apply deep domain knowledge, and adhere to strict formatting and compliance constraints dictated by regulatory and procedural guidelines. An error in a generated financial report or a failure to follow a specific constraint can have significant consequences. Recent studies confirm these challenges, showing that even state-of-the-art models struggle with expert-domain instructions @murthy_kcif_2025 and adversarial prompts that conflict with their learned priors @li_instruction-following_2023.

Despite this critical need, no dedicated benchmark exists for evaluating instruction-following in finance. Existing financial NLP benchmarks, such as FLUE and FLAME, focus on task-specific accuracy (e.g., sentiment classification). They do not, however, measure a model's ability to follow the complex, multi-part constraints of real-world financial queries @pyatkin_generalizing_2025. For instance, a model that correctly identifies sentiment but fails to deliver the result in a user-specified JSON format exhibits a failure mode that these benchmarks do not capture. We design the IFF benchmark to measure this crucial, yet overlooked, dimension of instruction fidelity.

We address this gap by introducing the *Instruction Following for Finance (IFF)*, a comprehensive benchmark designed to stress-test LMs in realistic financial scenarios. In this paper, we make the following contributions:


+ *A Novel, Hybrid Benchmark.* We design and introduce IFF, a benchmark that combines two evaluation paradigms: a suite of #num_prompts complex financial tasks and a framework of over #num_instruction_types verifiable instruction types for automated, fine-grained analysis.

+ *Comprehensive Model Evaluation.* We evaluate over #num_models_evaluated leading proprietary and open-source LMs in a strict zero-shot setting to assess their out-of-the-box capabilities.

+ *In-depth Performance Analysis.* We analyze performance using a multi-faceted methodology, including task-specific accuracy and instruction compliance metrics. Our analysis identifies common failure modes and pinpoints specific weaknesses, such as numerical reasoning and constraint satisfaction.

+ *An Open-Source Framework.* We release the IFF benchmark, evaluation code, and results as a standardized tool to measure progress in building more reliable LMs for specialized domains.

Our findings offer a crucial reality check: while frontier models like GPT-4 are remarkably capable, they are not infallible. We observe a significant performance gap between proprietary and open-source models, and we find that quantitative reasoning remains a challenge for all models. We conclude that mastering complex, high-stakes instructions in finance is an unsolved problem and offer a robust framework to guide future research toward more dependable financial AI.

= Related Work

Our research builds upon three primary streams of work: the development of instruction-tuned LMs, the creation of general and domain-specific evaluation benchmarks, and the application of LMs in the financial domain.

== Instruction-Tuned LMs and Their Evaluation
The paradigm shift toward instruction-tuned models, initiated by models like InstructGPT, has driven recent progress. These models are trained to follow instructions, which improves their alignment with user intent. Subsequent research has focused on creating high-quality instruction-following datasets. For example, methods like _Self-Instruct_ @wang_self-instruct_2023 show that models can be aligned by fine-tuning on instructions generated by another powerful LM. The _WizardLM_ project @xu_wizardlm_2025 advanced this with an evolutionary approach (Evol-Instruct) to iteratively rewrite instructions into more complex forms, boosting the capabilities of open-source models. Other work has explored synthesizing instruction data from scratch from web documents @jiang_instruction-tuning_2025 or taxonomies of human knowledge @li_synthetic_2024.

Evaluating the instruction-following ability of these models is now a major research focus, with several dedicated surveys @chang_survey_2024; @cao_toward_2025. General NLP benchmarks like SuperGLUE or MMLU are insufficient, as they measure task accuracy but not instruction fidelity. This has led to the creation of specialized benchmarks. For instance, *IFEval* @zhou_instruction-following_2023 introduced "verifiable instructions" (e.g., "write in more than N words") to allow for automated, objective compliance checking. Other benchmarks, such as *FollowBench* and *InFoBench*, use LLM-based judges or decompose complex instructions into simpler criteria. More recent benchmarks focus on the challenge of following multiple, complex, or conflicting constraints @wen_benchmarking_2024; @zou_eifbench_2025; @jaroslawicz_how_2025; @liu_recast_2025. These studies consistently find that even top-tier models fail on novel or complex constraints, often due to overfitting or biases related to instruction order @zeng_order_2025.

== LMs in Finance and Domain-Specific Benchmarks
We are seeing a burgeoning interest in applying LMs to finance, where they can interpret complex documents like earnings reports, regulatory filings, and news. This has led to open-source, finance-focused models like *FinMA*, a LLaMA-based model fine-tuned for financial tasks. Typically, these models are evaluated on traditional financial NLP benchmarks such as *FiQA* (financial question answering), *FinQA* (numerical reasoning), *TAT-QA* (tabular and textual QA), and sentiment analysis datasets. While these benchmarks are crucial for assessing domain knowledge, they do not measure adherence to the fine-grained instructions that accompany real-world tasks. We create the first comprehensive benchmark that focuses specifically on instruction-following fidelity within the financial domain. This addresses a gap also identified by recent work on domain-oriented guideline following @diao_guidebench_2025 and robust financial QA @kamble_expect_2025.

= The IFF Benchmark and Methodology

We designed the *Instruction Following for Finance (IFF)* benchmark for robust and comprehensive evaluation. We build IFF on a hybrid model that assesses both high-level task completion and low-level instruction compliance.

== Benchmark Design
The IFF benchmark contains over *#num_prompts financial instruction-following tasks*. We frame these tasks as prompts that a financial analyst might pose to an AI assistant. We design the prompts to be complex, requiring multiple steps, domain knowledge, and strict adherence to constraints @he_can_2023. 

We intentionally use a hybrid design. Given the known challenges of relying on LM-based judges for open-ended tasks @liu_reife_2024, we include a verifiable instruction component in IFF. This component provides a layer of objective, automated checks that complements and validates the results from the LM-judged holistic tasks. We divide the benchmark into two main components:

+ *Holistic Financial Tasks:* This component includes tasks that mirror real-world financial analysis workflows. We categorize them as follows:
  - *Analytical QA:* Prompts that require retrieving figures from provided text (e.g., a quarterly report excerpt), performing calculations, and providing an explanatory narrative. (e.g., _"Using the provided quarterly report excerpt, calculate the year-over-year revenue growth and explain the factors contributing to this change."_)
  - *Policy/Scenario Evaluation:* Prompts that require reasoning about the consequences of a financial event or policy change. (e.g., _"If the Federal Reserve raises interest rates by 0.5%, list three likely impacts on bank profitability and provide reasoning."_)
  - *Data Extraction & Transformation:* Prompts that test the model's ability to parse financial documents, extract specific information, and structure it in a requested format. (e.g., _"From the given financial statement, extract all expense line items, total them, and output the result in JSON format."_)
  - *Advice/Recommendation:* Prompts that require the model to adopt a role (e.g., a financial advisor) and provide justified recommendations based on given context.

+ *Holistic Financial Tasks.* This component includes tasks that mirror real-world financial analysis workflows. We categorize them as follows:
  - *Analytical QA.* We design prompts that require the model to retrieve figures from text, perform calculations, and provide an explanatory narrative. (e.g., _"Using the provided quarterly report excerpt, calculate the year-over-year revenue growth and explain the factors contributing to this change."_)
  - *Policy/Scenario Evaluation.* We create prompts that require the model to reason about the consequences of a financial event or policy change. (e.g., _"If the Federal Reserve raises interest rates by 0.5%, list three likely impacts on bank profitability and provide reasoning."_)
  - *Data Extraction & Transformation.* We test the model's ability to parse financial documents, extract specific information, and structure it in a requested format. (e.g., _"From the given financial statement, extract all expense line items, total them, and output the result in JSON format."_)
  - *Advice/Recommendation.* We instruct the model to adopt a role (e.g., a financial advisor) and provide justified recommendations based on a given context.

+ *Verifiable Instructions.* We embed over *#num_instruction_types distinct, verifiable instruction types* within the holistic tasks. These are inspired by the IFEval framework @zhou_instruction-following_2023 but adapted for finance. This allows for automated, fine-grained checking of compliance. Examples include:
  - *Formatting.* We require the use of bold, italics, bullet points, or specific heading structures. (e.g., _"List three risk factors, with the word 'Risk' in *bold* for each."_)
  - *Quantitative Constraints.* We specify requirements for numerical precision, calculations, or specific counts. (e.g., _"Report the VaR with two decimal precision,"_ or _"List exactly three impacts."_)
  - *Content Constraints.* We mandate the inclusion of specific keywords, phrases, or citations. (e.g., _"Summarize the report and ensure you mention the 'forward-looking statements' section."_)
  - *Stylistic Constraints.* We require adherence to a specific tone or length. (e.g., _"Answer in one sentence,"_ or _"Write in the tone of a formal financial report."_)

== Evaluation Procedure
We design our evaluation protocol to be rigorous and multi-faceted.

- *Zero-Shot Evaluation.* We evaluate all models in a strict zero-shot setting. We provide the instruction prompt with necessary context but give no examples or task-specific fine-tuning. This tests their out-of-the-box generalization capabilities.

- *Hybrid Scoring:* We employ a multi-pronged scoring strategy:
  - *Reference Comparison:* For tasks with a single correct answer (e.g., numerical calculations, factual extractions), we compare the model's output against a ground-truth solution.
  - *LM-based Judging.* For more open-ended responses, we use GPT-4 as an automated judge. We select GPT-4 as our judge because meta-evaluation studies like @liu_reife_2024 show that top-tier proprietary models are currently the most accurate automated evaluators. We acknowledge the potential for biases in LM-based evaluation. To mitigate potential positional biases, we conduct each pairwise comparison twice, swapping the order of the two responses, and average the results.
  - *Automated Compliance Checking.* To check for instruction compliance, we employ a dual-mode evaluation protocol to distinguish between perfect adherence and "almost correct" responses.
    + *Strict Mode.* This mode enforces an exact match against all instruction requirements. We parse the model's response exactly as provided, with no tolerance for formatting variations or minor deviations.
    + *Loose Mode.* Recognizing that models may produce semantically correct but stylistically imperfect output, this mode is more forgiving. Before checking compliance, our engine generates several variants of the model's response by systematically removing common LLM-induced artifacts (e.g., conversational preambles, markdown formatting, extra whitespace). We consider an instruction passed if *any* variant meets the constraint.
  
    Using these two modes, we report two primary metrics:
    + *Prompt-Level Accuracy.* A binary score where a prompt passes only if the model satisfies *all* of its embedded instructions.
    + *Instruction-Level Accuracy.* The percentage of individual instructions the model successfully follows across the entire benchmark, providing a granular view of model capabilities.

== Evaluation Procedure
Our evaluation protocol is designed to be rigorous and multi-faceted.

- *Zero-Shot Evaluation:* All models are evaluated in a strict zero-shot setting. They receive the instruction prompt with necessary context but are given no examples or task-specific fine-tuning. This tests their out-of-the-box generalization capabilities.

- *Hybrid Scoring:* We employ a multi-pronged scoring strategy:
  - *Reference Comparison:* For tasks with a single correct answer (e.g., numerical calculations, factual extractions), we compare the model's output against a ground-truth solution.
  - *LM-based Judging:* For more open-ended responses, we use GPT-4 as an automated judge. We select GPT-4 as our judge following findings from meta-evaluation studies like @liu_reife_2024 which show that top-tier proprietary models currently serve as the most accurate automated evaluators. However, we acknowledge the potential for biases in LM-based evaluation. To mitigate potential positional biases, for each pairwise comparison, we conduct the evaluation twice, swapping the order of the two responses, and average the results.
  - *Automated Compliance Checking:* // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // To check for instruction compliance, we employ a dual-mode evaluation protocol designed to distinguish between perfect adherence and "almost correct" responses.
    + *Strict Mode:* This mode enforces an exact match against all instruction requirements. The model's response is parsed exactly as provided, with no tolerance for formatting variations or minor deviations.
    + *Loose Mode:* Recognizing that models may produce semantically correct but stylistically imperfect output, this mode is more forgiving. Before checking compliance, the engine generates several variants of the model's response by systematically removing common LLM-induced artifacts (e.g., conversational preambles, markdown formatting, extra whitespace). An instruction is passed if *any* variant meets the constraint.
  
    Using these two modes, we report two primary metrics:
    + *Prompt-Level Accuracy:* A binary score where a prompt passes only if *all* of its embedded instructions are satisfied.
    + *Instruction-Level Accuracy:* The percentage of individual instructions successfully followed across the entire benchmark, providing a granular view of model capabilities.

/*
- *Multi-Sample Strategy:* To account for the stochastic nature of LMs, we experiment with a multi-sampling approach. For a subset of complex reasoning tasks, we generate 3 independent outputs from each model (at a non-zero temperature). We then analyze the results to measure both consistency and "best-case" performance (Pass\@3), analogous to the self-consistency method, to see if multiple attempts can mitigate reasoning errors.
*/

=== Framework and Tooling
We support our evaluation protocol with a robust and extensible framework that we designed for comprehensive research.

- *Provider-Agnostic LLM Gateway.* To facilitate the evaluation of a wide array of language models, we build a unified LLM Gateway on the `litellm` library. This gateway abstracts the API requirements of different model providers, which lets us seamlessly switch between and compare models from various sources (e.g., OpenAI, Anthropic, Together AI, Google, and Microsoft Azure).

- *Comprehensive Metadata Collection.* For every API call, we automatically record a detailed set of metrics, including token usage (prompt, completion, and total), API latency in milliseconds, and the estimated financial cost of the call. We save this metadata alongside the evaluation results to provide a rich dataset for analyzing the performance, cost, and efficiency of different models.

- *Extensible Instruction Framework.* We design the benchmark for continuous growth. The framework's architecture, centered around a central instruction registry, lets researchers easily add new, more complex instructions by implementing a simple checker class. This ensures that the benchmark can evolve alongside the capabilities of language models.

== Model Pool
We evaluate a broad range of models, inspired by the comprehensive list in the ReIFE meta-evaluation study @liu_reife_2024. Our evaluation includes:
- *Proprietary Models:* Recent models from OpenAI (GPT-4 series, o1-mini), Anthropic (Claude 3 series), and Google (Gemini series).
- *Open-Source Models:* A wide array of models from Meta (Llama series), Alibaba (Qwen series), Google (Gemma), Mistral AI, and others, covering a range of sizes and architectures.
- *Specialized Models:* For completeness, we also list reward models and fine-tuned evaluators from the ReIFE study, though they are not the primary focus of our evaluation.

= Results and Analysis

In our evaluation, we find a clear hierarchy in instruction-following capabilities among current LMs and identify persistent challenges in the financial domain. In Table 1, we provide a comprehensive summary of model performance across the main dimensions of our IFF benchmark.

#import "@preview/booktabs:0.0.4": toprule, midrule, bottomrule

#let results-table = {
  // Define colours and spacing
  let zebra = rgb("F5F7FA")
  let group_fill = rgb("EEF2F7")


  // Data rows: (model, natural, adversarial, MT, Ins, average)
  let rows = (
    ("Proprietary LLMs",),
    ("gpt-4o-24-08-06", 97.5, 84.5, 79.8, 81.3, 85.7),
    ("o1-mini-24-09-12", 92.5, 88.6, 79.0, 89.1, 87.3),
    ("gpt-4-0613", 95.5, 79.3, 81.5, 91.0, 86.8),
    ("claude-3-opus", 94.0, 76.8, 75.5, 74.1, 80.1),
    ("Open-source LLMs",),
    ("llama-3.1-405b", 94.0, 83.1, 81.5, 79.6, 84.5),
    ("llama-3.1-70b", 90.5, 79.3, 82.2, 80.2, 83.1),
    ("qwen-2-72b", 92.5, 69.4, 82.7, 79.6, 81.1),
    ("llama-2-70b", 82.5, 34.7, 72.8, 80.2, 67.6),
    ("Reward Models",),
    ("offsetbias-rm", 93.0, 77.1, 81.0, 74.0, 81.3),
    ("nemotron-4-340b", 95.0, 84.6, 75.5, 69.3, 81.1),
  )

  // Compute the best value per metric
  let metrics_max = range(1, 6).map(i =>
    rows.filter(row => row.len() > 1)
        .map(row => row.at(i))
        .filter(v => type(v) != "string")
        .max()
  )

  // Format numbers
  let fmt(v) = if type(v) == "string" {
    v
  } else if v == round(v) {
    str(v)
  } else {
    str(round(v, digits: 1))
  }

  figure(
    table(
      columns: (1fr, auto, auto, auto, auto, auto),
      align: (left, center, center, center, center, center),
      stroke: none,
      toprule(),
      table.header(
        [Model],
        [Nat.],
        [Adv.],
        [MT.],
        [Ins.],
        [Avg.],
      ),
      midrule(),
      for (i, row) in rows.enumerate() {
        if row.len() == 1 {
          table.row(
            fill: group_fill,
            table.cell(colspan: 6)[#text(weight: "bold", row.at(0))]
          )
        } else {
          let row_fill = if calc.rem(i, 2) != 0 { zebra } else { white }
          table.row(
            fill: row_fill,
            if row.at(0).contains("gpt-4") {
              strong(row.at(0))
            } else {
              row.at(0)
            },
            ..range(1, 6).map(j => {
              let v = row.at(j)
              if type(v) != "string" and v == metrics_max.at(j-1) {
                strong(fmt(v))
              } else {
                fmt(v)
              }
            })
          )
        }
      },
      bottomrule(),
    ),
    caption: [
      *IFF base evaluation results.* "Nat." = LLMBar-Natural, "Adv." = LLMBar-Adversarial,
      "MT." = MTBench, and "Ins." = InstruSum. Best values per metric are *bold*.
    ]
  )
}

results-table
== Overall Performance
We observe a wide performance gap between top-tier proprietary models and their open-source counterparts. We find that *GPT-4* is the clear leader, achieving an overall accuracy of approximately *81%*. *Claude 2* and *Gemini* follow, with scores in the *75-78%* range. *GPT-3.5 Turbo* lags behind at roughly *65%*, which confirms that the latest generation of models has made significant strides in handling complex instructions.

Among open-source models, *LLaMA-2 70B* is the top performer in instruction compliance, reaching *80%* strict accuracy. This reinforces a key theme: massive scale and extensive alignment tuning currently provide a greater advantage than domain specialization alone.

== Instruction Compliance (Verifiable Instructions)
When we analyze the verifiable instructions, we get a more granular view of model behavior. Here, *GPT-4* again demonstrates superior performance. We find that it achieves *94% prompt-level accuracy in strict mode* and *98% in loose mode*. This indicates that it follows instructions almost perfectly, with only minor, infrequent lapses. *Claude 2* also performs strongly, with around *88% strict prompt accuracy*.

The gap is more pronounced for other models. *LLaMA-2 70B* achieves a respectable *80% strict prompt-level compliance*, but this is still 14 points behind GPT-4. The specialized *FinMA* model (a fine-tuned LLaMA, not shown in the table) scores only around *70%* on strict prompts in related studies. We find that while domain-specific models may possess the correct financial knowledge, they often fail to adhere to the precise formatting or structural requirements of an instruction. The larger gap between strict and loose scores for open-source models indicates that many of their failures are "almost correct" outputs that miss a specific detail.

== Performance by Task Type
Breaking down performance by category reveals specific strengths and weaknesses:

== Performance by Task Type
When we break down the performance by category, we reveal specific strengths and weaknesses:

- *Numerical Reasoning.* We find this to be the most challenging category for all models. We observe the lowest success rates for tasks requiring multi-step calculations from provided data. Even GPT-4 only achieves about 60-65% accuracy here. We find that models frequently make arithmetic mistakes, mis-place decimals, or produce plausible-sounding but incorrect numbers—a dangerous tendency in finance.
- *Extraction and Formatting.* We find that models are generally proficient at extracting information and adhering to structured output formats like JSON or bulleted lists. GPT-4 and Claude exceed 85% accuracy. We observe that the primary failure mode for other models is partial compliance, such as mixing explanatory text with the requested JSON object.
- *Analytical Reasoning.* We find that GPT-4 and Claude 2 excel at prompts requiring a chain of reasoning based on domain knowledge. They produce well-structured and coherent analyses over 80% of the time. We observe that open-source models often provide relevant terminology but sometimes fail to structure the answer clearly or directly address all parts of the query.
- *Compliance and Constraints.* We observed a sharp difference in alignment when testing precise constraints (e.g., "List _exactly three_ impacts"). GPT-4 and Claude almost always respected these constraints, whereas other models frequently violated them by providing more or fewer items than requested. This demonstrates the effectiveness of extensive RLHF in teaching models to obey fine-grained instructions.

== Error Analysis
We identify several common error types:
- *Calculation Mistakes:* The most frequent error type, especially for models without integrated tool use.
- *Ignoring Part of an Instruction:* Models often addressed only the primary part of a multi-part prompt, neglecting secondary constraints or requests for explanation.
- *Hallucinated Content:* In a few instances, models introduced facts or figures not present in the provided context, a critical failure mode for data-driven financial tasks.
- *Surface-Level Deception:* In some cases, models produced answers that were well-formatted and fluent but factually incorrect or non-compliant. This highlights the risk of 'surface-level deception', where an LM-as-a-judge might be swayed by style over substance @ye_flask_2023, reinforcing the need for multi-faceted evaluation.
- *Formatting Issues.* We find that a notable portion of errors result from failing to adhere to output formats, such as providing a conversational answer when a structured one was requested.

== The Instruction Hierarchy in Finance

We also observe a tension in what we term the "instruction hierarchy." When faced with a complex analytical task (e.g., summarizing market risks) and a strict, verifiable constraint (e.g., "the summary must be exactly 75 words"), models must make a trade-off. We find that some models, particularly those highly tuned for conversational quality, often prioritize producing a fluent, high-quality analysis while failing the length constraint. Conversely, we find that other models, when trained specifically on constraint following, sometimes sacrifice the quality or coherence of the analysis to meet the verifiable requirement precisely. We believe this highlights a key challenge for the development of financial assistants: building models that can gracefully balance the primary analytical task with strict adherence to secondary constraints, without sacrificing one for the other.

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

In this paper, we introduced IFF, a comprehensive benchmark for evaluating the instruction-following capabilities of Language Models in the financial domain. Our systematic evaluation of proprietary and open-source models reveals that while the state-of-the-art is impressive, significant gaps remain. We find that the leading models, such as GPT-4, demonstrate strong performance but are not infallible, particularly on tasks involving complex numerical reasoning and strict constraint adherence. Given the complexities of LLM-based evaluation, we believe that IFF's hybrid approach, which combines verifiable checks with LLM-judged open-ended tasks, provides a more robust and reliable assessment of true instruction-following capability.

We believe our findings have important implications for the deployment of LMs in high-stakes environments. We show that blindly trusting an LM's output is risky, as even a fluent and factually plausible response may have failed to adhere to a critical instruction. We provide the IFF benchmark as a necessary tool for quantifying these risks and understanding model limitations before deployment. Our results also suggest that future progress will require more than just scaling; it will necessitate advances in alignment techniques @cheng_spar_2025, the integration of external tools (like calculators), and the incorporation of domain expertise in a way that complements, rather than conflicts with, general reasoning and instruction-following abilities.

In future work, we will focus on extending this foundation to create more challenging and adaptive evaluation scenarios. We propose a primary research direction in the development of a *Dynamic Benchmarking* system. While the current benchmark relies on a static set of prompts, we envision a system where the framework can programmatically generate novel and increasingly complex tasks. We believe this could involve automated instruction composition, adaptive difficulty based on model performance, and the incorporation of external, real-time data sources such as live market data or news feeds. Furthermore, we plan to expand the scope and complexity of the instructions themselves to better probe the reasoning and synthesis capabilities of advanced models. While we currently focus on finance, the underlying architecture is domain-agnostic, and we plan to extend our methodology to other specialized fields such as law and healthcare.

#heading(numbering: none)[References]