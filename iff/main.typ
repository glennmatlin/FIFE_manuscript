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

    uod: (
    department: "Cluster Innovation Centre",
    institution: "University of Delhi",
    location: "New Delhi",
    country: "India"),
    
)

#let authors = (
  (name: "Glenn Matlin",
   affl: "gatech",
   email: "glenn@gatech.edu"),
  (name: "Siddharth",
   affl: ("gatech","uod"),
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
       Language Models (LMs) demonstrate an impressive ability to follow prompting instructions to guide their generation. However, the risk associated with hallucinations and confabulations when following complex and interdependent instructions has limited their effectiveness in high-stakes domains (i.e., finance), where precision and reliability are critical. We introduce `IFF`, a high-difficulty benchmark designed to assess the advanced instruction-following capabilities of LMs for finance. We provide #num_prompts human-authored prompts that mirror complex financial analysis tasks, utilizing information extraction, classification, question answering, and table summarization. We construct a _verification system_ where we embed #num_instruction_types distinct, individually verifiable constraints to enable automated and fine-grained reward signals. We evaluate #num_models_evaluated models in a zero-shot setting, including the most popular proprietary models (GPT5, Claude Opus 4.1), open-weight models (Qwen3, Llama4), and open-source models (OLMo2). Our key findings reveal that while top-tier proprietary models, such as those that achieve the highest accuracy, outperform the best open-source models by a significant margin, they still do not achieve perfect compliance. Furthermore, we found that all models (including leading proprietary models) struggle with instruction following during our tasks due to their requirement for multi-step constraints, stricter adherence to constraints, and output verification. We release our benchmark dataset and code as an open-source resource for the community to promote research into Reinforcement Learning with Verified Rewards (RLVR) for LMs in the financial domain.
  ],
  bibliography: bibliography("zotero.bib"),
  bibliography-opts: (title: none, full: true),  // Only for example paper.
  appendix: [
    #include "appendix.typ"
    #include "checklist.typ"
  ],
  accepted: false,
)

// #figure(
//   image("intro_fig.svg", width: 80%),
//   caption: [Composition types in `IFF`.]
// )

= Introduction

Language models (LMs) have become general-purpose interfaces for information work, but their value hinges on the ability to *follow instructions precisely*, not just produce plausible text @radford_language_nodate @touvron_llama_2023. Instruction tuning and preference-based reinforcement learning improve obedience to user directives @wei_chain--thought_2023 @ouyang_training_2022, and a recent wave of benchmarks has shown both progress and clear gaps. Prior work on verifying the correctness of LM-generated text formatting and content rules automatically have demonstrated failure modes in LM due to long-form instructions which require the LM to decompose interconnecting requirements and conditions (@zhou_instruction-following_2023, @pyatkin_generalizing_2025, @peng_verif_2025).

High-stakes domains such as finance raise the importance of instruction-following for LM-generated text. Real-world workflows with LMs in finance will combine domain-specific reasoning with strict, machine-checkable constraints; i.e., _"Create a table with exact headers, sort by spread descending, bold values above a threshold, normalize currency codes, and end with a disclaimer."_ In these situations, answers that are factually right but fail to follow instructions can still result in operational failures (downstream errors, compliance requirements, etc). However, no dedicated benchmark has been proposed yet for evaluating instruction-following in finance-specific contexts. Existing Financial NLP (FinNLP) benchmarks focus on task-specific accuracy (e.g., sentiment classification, QA, NER) (@shah_when_2022, @wu_golden_2024, @lu_bizfinbench_2025, @matlin_finance_2025). However, none of these FinNLP benchmarks assess a model's ability to adhere to the complex, multi-part constraints of real-world financial queries. These benchmarks can measure a model's ability to classify sentiment correctly, but none of them fail to measure the correctness of the output in the user-specified format. We designed `IFF` to measure this crucial, yet overlooked, dimension of instruction fidelity, to check whether a model adheres to the requested format, ordering, counts, or style constraints that professionals actually require.

// Language Models (LMs) have seen recent success, driven primarily by their ability to follow instructions. Techniques like instruction tuning and reinforcement learning (RL) have proven effective at aligning models to user intent @wang_self-instruct_2023; @he_can_2023. However, most evaluations focus on general-domain tasks. In high-stakes fields like finance, instructions are often complex and multi-step, making instruction fidelity a critical point of failure @diao_guidebench_2025.

// Financial professionals require LLMs to perform multi-step quantitative reasoning, apply deep domain knowledge, and adhere to strict formatting and compliance constraints dictated by regulatory and procedural guidelines. An error in a generated financial report or a failure to follow a specific constraint can have significant consequences. Recent studies confirm these challenges, showing that even state-of-the-art models struggle with expert-domain instructions @murthy_kcif_2025 and adversarial prompts that conflict with their learned priors @li_instruction-following_2023.

We address this gap by introducing Instruction Following for Finance (IFF), a finance-grounded benchmark that stress-tests Language Models under realistic, verifiable constraints. `IFF` consists of three core components. First, we curate a compact but diverse suite of real-world finance tasks including bond-spread tables, AML triage notes, settlement run-books etc. Second, we develop a comprehensive library of verifiable instruction types that span the full spectrum of what financial professionals encounter. These include structural and format requirements like tables with exact headers and ordered checklists, compositional directives including sorting and filtering with precise cardinality constraints, typography and markup conventions from bold formatting to LaTeX snippets, and domain-specific normalization standards that matter in finance such as currency codes rather than symbols, standardized date formats, and regulatory citation styles. Third, each benchmark item includes deterministic checkers that make scoring both fast and reproducible.

We evaluate over #num_models_evaluated leading proprietary and open-source language models in a strict zero-shot setting to assess their out-of-the-box instruction-following capabilities. Our evaluation uses regex-based verification to automatically score instruction compliance across all benchmark items.

We release all prompts, verifiers, and evaluation code as open-source tools to enable standardized comparisons and support future work on verifiable-reward training for high-stakes domains.

(TBD: After results section to update our findings) Our findings provide a sobering reality check. While frontier models like GPT-4 show impressive capabilities, they consistently struggle with the precision demanded by financial workflows. We document substantial performance gaps between proprietary and open-source models, with quantitative reasoning emerging as a persistent weakness across the board. The results suggest that reliable instruction following in high-stakes financial contexts remains an open challenge, one that will require targeted advances in model training and evaluation methodologies.

= Related work
// Our research builds on the combined effort from literature that can be grouped into two strands: instruction-tuned language models and their general evaluation, and domain-specific benchmarks in financial NLP.

== Evaluating instruction-following

Instruction tuning and preference-based fine-tuning methods such as InstructGPT @ouyang_training_2022 and efforts like Self-Instruct @wang_self-instruct_2023 and WizardLM @xu_wizardlm_2025 have improved model compliance with general user directives. Evaluations of these models have relied on broad benchmarks such as SuperGlUE or MMLU. Broad benchmarks measure task accuracy but not consistency to fine-grained constraints. More specialized frameworks like IFEval @zhou_instruction-following_2023 and its successors (@wen_benchmarking_2024, @chen_recent_2025, @hwang_llms_2025) have introduced verifiable instructions—machine-checkable constraints on length, formatting, or keyword inclusion—to automate compliance checking. However, these evaluations are largely domain-agnostic, and the constraints they test do not capture the specialized demands of financial workflows. 

== Financial NLP benchmarks

Financial applications are subject to constraints beyond those targeted by general instruction-tuned benchmarks. Tasks often require multi-step reasoning, strict output formatting schemes, and regulatory-driven constraints. Existing FinNLP benchmarks such primarily focus on core NLP tasks including sentiment analysis (FOMC @shah_trillion_2023), numerical question answering (FinQA, @chen_finqa_2021), and text summarization (SubjECTive-QA, @pardawala_subjective-qa_2024). These benchmarks measure the labeling accuracy for LMs on FinNLP tasks and support development of domain-adapted models. However, none of these benchmarks address this paper's main concern of instruction-following. These benchmarks lack any particular mechanism for verification the type of instruction constraints common found in financial workflows (e.g., producing tabular outputs with exact headers, reporting numerical results at mandated precision, or including regulatory disclaimers). The result is that current benchmarks on FinNLP cannot verify wether model outputs are not only factually correct but also compliant with the user's constraints. `IFF` addresses this critical gap by providing a way to verify and benchmark the ability of models to follow instructions and generate user-compliant text for FinNLP tasks.

= Methodology

We present our methodology, "Instruction Following for Finance" (`IFF`). To the best of our knowledge, `IFF` is the first instruction-following benchmark designed specifically for finance. Our methodology was created to enable researchers to evaluate this fundamental capability of models, and provide an environment for Reinforcement Learning with Verified Rewards (RLVR).
We create 100 human-authored LM tasks meant to replicate real-world financial scenarios and construct each example with verifiable output constraints. Instead of creating narrow task categories and providing thousands of weak examples, we built a broad, SME-curated set of 100 difficult tasks (each with a prompt and instruction) intended to cover a wide range of use-cases for FinNLP core tasks. We design instructions broadly on four composition types: *SINGLE* with just a single instruction,*AND* when we join two or more instructions; *CHAINED*, when we give a set of instructions to be followed sequentially; and *NESTED*, when we use pre-conditional instructions (e.g., If this is present then do this, else do this) (@wen_benchmarking_2024). Please see Appendix C for detailed examples of prompts, instructions, and sample outputs. ((TODO: LINK APPENDIX IF POSSSIBLE?))

#figure(
  image("table_composition.svg", width: 80%),
  caption: [Composition types in `IFF`.]
)

== Evaluation procedure

We select models that are not multimodal to focus on their instruction-following capability. Multimodal instruction following is an aspect of frontier research that requires a separate study.

We study the following LM families with IFF: Proprietary closed-model systems such as the GPT- 4,5 & o-series, Anthropic Claude & Sonnet series, along with open-weight and open-source models such as the Meta Llama series, DeepSeek V3, ERNIE, Cogito preview model, Qwen series,GPT-oss, Gemma 3, and Ai2 Olmo models respectively.
All experiments involved large language models was conducted using cloud APIs. We utilized Commercial API to access closed source models listed above.
We include all the hyper-parameters used to test the model in Appendix ?.

As part of our evaluation strategy, similar to IFEval and IFBench @zhou_instruction-following_2023 @pyatkin_generalizing_2025 ,we compute both "strict" and "loose" accuracy. Additionally, we clean model outputs by normalizing text and removing certain modifiers for "loose" metric evaluation. The final benchmark instructions can be broadly categorized into five areas:* exact cardinality, table schema, ordering/deduplication, style cues, and word limit.*

// == Framework (Glenn can we rid of this part or any other subseciton in this section, this is going too long)
// We support our evaluation protocol with a robust and extensible framework that we designed for comprehensive research. To facilitate the evaluation of a wide array of language models, we use the `litellm` library to act as our gateway for LM providers, which lets us compare models from various sources. For every API call, we automatically record all metrics, including token usage (prompt, completion, and total), API latency in milliseconds, and the financial cost of the call. We save this metadata alongside the evaluation results for post-generation analysis. The framework is centered around the central instruction registry which is where definitions of instruction types and verification methods are stored. Researchers can add new and even more complex instructions by implementing a simple checker class. 

= Results
We evaluate a broad range of models, covering various sizes and architectures. Our evaluation includes closed-source, open-source, and open-weight models. In Table 1 below, we present the performance metrics for each model using both strict and loose verification for instruction correctness.b. "Strict" denotes perfect adherence to all instructions, while "Loose" allows for minor formatting variations.

== Overall Performance

Our findings reveal that open-weight models dominate the IFF Benchmark, with several checkpoints surpassing the strongest closed-source systems. The standout is Llama-4 Maverick 17B, which achieves the highest overall performance, and is closely followed by other large Llama-3 and Cogito releases. These results highlight that competitive instruction-following ability is no longer limited to proprietary models, with open-weight alternatives leading the field.Closed-source models remain strong but no longer set the benchmark frontier.Fully open-source models, despite steady progress, continue to lag behind both closed-source and open-weight systems. A further surprise is the relatively weak performance of several reasoning-oriented models. Despite being explicitly marketed for step-by-step or multi-turn reasoning, their instruction-following reliability is not markedly stronger under strict evaluation, and in many cases falls below that of general-purpose open-weight models.We find that models often fail to adhere to the precise formatting or structural requirements of an instruction. The larger gap between strict and loose scores for open-source models indicates that many of their failures are "almost correct" outputs that miss a specific detail.

#figure(
  kind: "table",
  supplement: none, // prevents duplication in caption
  image("table_benchmark.svg", width: 100%),
  caption: [Table 1: Model performance on the IFF Benchmark],
) <results-table>

// We observe a wide performance gap between top-tier proprietary models and their open-source counterparts. We find that ??????? is the clear leader, achieving an overall accuracy of approximately ???. Both ????? and ????? follow, with scores in the ????? range. ????lags behind at roughly ????, which confirms that the latest generation of models has made significant strides in handling complex instructions. Among open-source models, ???? is the top performer in instruction compliance, reaching ???? strict accuracy. When we analyze across each instruction type, we get a more granular view of model behavior. Here, ??? again demonstrates superior performance. We find that it achieves ??? prompt-level accuracy in strict mode and ??? in loose mode. This indicates that it follows instructions almost perfectly, with only minor, infrequent lapses. ??? also performs strongly, with around ??? strict prompt accuracy. The gap is more pronounced for other models. ??? achieves a respectable ??? strict prompt-level compliance, but this is still ??? points behind ???. We find that models often fail to adhere to the precise formatting or structural requirements of an instruction. The larger gap between strict and loose scores for open-source models indicates that many of their failures are "almost correct" outputs that miss a specific detail.

== Limitations

A key limitation of this study is that our evaluation relies on a single response sample for each task from every model. The significant API costs associated with generating multiple responses per prompt were prohibitive, given our team's extremely limited funding. Evaluation strategies using multiple inference samples would improve reliability and mitigate the potential impact of stochasticity for the model outputs. Our future work will explore the impact of multi-sample evaluation on our findings.

= Conclusion

In this paper, we introduced IFF, a comprehensive benchmark for evaluating the instruction-following capabilities of Language Models in the financial domain. Our systematic evaluation adherence to constraintsLM``LM``of proprietary and open-source models reveals that while the state-of-the-art is impressive, significant gaps remain. We find that the leading models, such as GPT-4, demonstrate strong performance but are not infallible, particularly on tasks involving complex numerical reasoning and strict constraint adherence. Given the complexities of LLM-based evaluation, we believe that IFF's hybrid approach, which combines verifiable checks with LLM-judged open-ended tasks, provides a more robust and reliable assessment of true instruction-following capability.

We believe our findings have important implications for the deployment of LMs in high-stakes environments. We show that blindly trusting an LM's output is risky, as even a fluent and factually plausible response may have failed to adhere to a critical instruction. We provide the `IFF` as a necessary tool for quantifying these risks and understanding model limitations before deployment. Our results also suggest that future progress will require more than just scaling; it will necessitate advances in alignment techniques @cheng_spar_2025, the integration of external tools (like calculators), and the incorporation of domain expertise in a way that complements, rather than conflicts with, general reasoning and instruction-following abilities.

In future work, we will focus on extending this foundation to create more challenging and adaptive evaluation scenarios. We propose a primary research direction in the development of a *Dynamic Benchmarking* system. While the current benchmark relies on a static set of prompts, we envision a system where the framework can programmatically generate novel and increasingly complex tasks. We believe this could involve automated instruction composition, adaptive difficulty based on model performance, and the incorporation of external, real-time data sources such as live market data or news feeds. Furthermore, we plan to expand the scope and complexity of the instructions themselves to better probe the reasoning and synthesis capabilities of advanced models. While we currently focus on finance, the underlying architecture is domain-agnostic, and we plan to extend our methodology to other specialized fields such as law and healthcare.

#heading(numbering: none)[References]