#import "@preview/bloated-neurips:0.7.0": botrule, midrule, neurips2025, paragraph, toprule, url
#import "/logo.typ": LaTeX, LaTeXe, TeX

// #bibliography("zotero.bib")

#let draft(content) = {
  text(fill: red, style: "italic")[#content]
}

#let num_prompts = "88"
#let num_instruction_types = ""
#let num_models_evaluated = "53"

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
       Language Models (LMs) demonstrate an impressive ability to follow instructions, but the risk of hallucination when executing complex, interdependent commands has limited their effectiveness in domains like finance where precision is critical. We introduce `IFF`, a high-difficulty benchmark designed to assess the instruction-following capabilities of LMs for finance. `IFF` provides #num_prompts human-authored prompts that mirror financial analysis tasks and uses a verification system with chainable, verifiable constraints to provide fine-grained reward signals. We evaluate #num_models_evaluated models in a zero-shot setting, including leading proprietary, open-weight, and open-source systems. Our key findings reveal that even top-tier proprietary models, while outperforming open-source counterparts, do not achieve perfect compliance and struggle with the benchmark's complex requirements. We release our dataset and code as an open-source resource to promote research into Reinforcement Learning with Verified Rewards (RLVR) for the financial domain.
  ],
  bibliography: bibliography("zotero.bib"),
  bibliography-opts: (title: none, full: true),  // Only for example paper.
  appendix: [
    #include "appendix.typ"
    #include "checklist.typ"
  ],
  accepted: false,
)

#figure(
  image("intro_fig.svg", width: 100%),
  caption: [Instruction Following Pipeline.]
)

= Introduction

The value of Language Models (LM) hinges on their ability to follow instructions precisely while generating responses @radford_language_nodate @touvron_llama_2023. While instruction tuning has improved model obedience @wei_chain--thought_2023 @ouyang_training_2022, recent benchmarks reveal a critical gap: LMs still fail to adhere to long or complex instructions that require decomposing interdependent constraints @zhou_instruction-following_2023, @pyatkin_generalizing_2025, @peng_verif_2025.

This gap is particularly acute in high-stakes domains like finance, where workflows combine domain reasoning with strict, machine-checkable constraints; e.g., _"Create a table with exact headers, sort by spread descending, and bold values above a threshold."_ In this context, a factually correct answer that violates formatting instructions can cause operational failures. While existing Financial NLP (FinNLP) benchmarks measure task-specific accuracy for tasks like sentiment analysis or QA @shah_when_2022, @wu_golden_2024, @lu_bizfinbench_2025, @matlin_finance_2025, they do not evaluate a model's ability to adhere to the complex, multi-part constraints common in financial queries. `IFF` is designed to measure this crucial, yet overlooked, dimension of instruction fidelity.

// Language Models (LMs) have seen recent success, driven primarily by their ability to follow instructions. Techniques like instruction tuning and reinforcement learning (RL) have proven effective at aligning models to user intent @wang_self-instruct_2023; @he_can_2023. However, most evaluations focus on general-domain tasks. In high-stakes fields like finance, instructions are often complex and multi-step, making instruction fidelity a critical point of failure @diao_guidebench_2025.

// Financial professionals require LLMs to perform multi-step quantitative reasoning, apply deep domain knowledge, and adhere to strict formatting and compliance constraints dictated by regulatory and procedural guidelines. An error in a generated financial report or a failure to follow a specific constraint can have significant consequences. Recent studies confirm these challenges, showing that even state-of-the-art models struggle with expert-domain instructions @murthy_kcif_2025 and adversarial prompts that conflict with their learned priors @li_instruction-following_2023.

To address this gap, we introduce Instruction Following for Finance (`IFF`), a benchmark that stress-tests LMs using #num_prompts human-authored tasks that mirror realistic financial workflows. The benchmark's instructions are designed to be verifiable, covering a wide range of compositional and stylistic constraints such as table structures, conditional formatting, and domain-specific data normalization. Using this framework, we evaluate #num_models_evaluated leading proprietary and open-source LMs in a zero-shot setting, with compliance scored automatically via regex-based verification. We release the entire benchmark,including all prompts, verifiers, and evaluation code as open-source tool to support future research into verifiable-reward training for high-stakes domains.

// (TBD: After results section to update our findings) Our findings provide a sobering reality check. While frontier models like GPT-4 show impressive capabilities, they consistently struggle with the precision demanded by financial workflows. We document substantial performance gaps between proprietary and open-source models, with quantitative reasoning emerging as a persistent weakness across the board. The results suggest that reliable instruction following in high-stakes financial contexts remains an open challenge, one that will require targeted advances in model training and evaluation methodologies.

= Related work
// Our research builds on the combined effort from literature that can be grouped into two strands: instruction-tuned language models and their general evaluation, and domain-specific benchmarks in financial NLP.

== Evaluating instruction-following

While instruction tuning methods like InstructGPT @ouyang_training_2022, Self-Instruct @wang_self-instruct_2023, and WizardLM @xu_wizardlm_2025 have improved model obedience, evaluating this capability requires more than task-level accuracy. Assessing instruction fidelity demands specialized benchmarks. Frameworks like IFEval @zhou_instruction-following_2023 and its successors (@wen_benchmarking_2024, @chen_recent_2025, @hwang_llms_2025) were created for this purpose, introducing verifiable, machine-checkable constraints on length, formatting, and keyword inclusion. However, these evaluations are largely domain-agnostic and do not test the specialized constraints required in financial workflows. 

== Financial NLP benchmarks

Existing FinNLP benchmarks primarily focus on core NLP tasks including sentiment analysis (FOMC @shah_trillion_2023), numerical question answering (FinQA, @chen_finqa_2021), and text summarization (SubjECTive-QA, @pardawala_subjective-qa_2024). These benchmarks assess the labeling accuracy of LMs on FinNLP tasks, supporting the development of domain-adapted models. However, none of these benchmarks address the paper's main concern, which is instruction-following. They lack mechanisms to verify compliance with the procedural and formatting constraints common in financial workflows, such as producing tables with exact headers, reporting numerical results to a mandated precision, or including regulatory disclaimers. Consequently, they cannot determine if a model's output is both factually correct *and* compliant with user constraints. `IFF` is designed to fill this critical gap.

= Methodology

== Instruction-following task
Our methodology, Instruction Following for Finance (`IFF`), is the first instruction-following benchmark designed specifically for finance. We created `IFF` to evaluate this fundamental capability in LMs and to provide a robust environment for Reinforcement Learning with Verified Rewards (RLVR). The benchmark is built on a set of #num_prompts difficult, SME-curated tasks that replicate real-world financial scenarios, prioritizing complexity and breadth over a large volume of simple tasks. Each task contains verifiable output constraints and is designed around four composition types: *single* (a single instruction), *and* (multiple concurrent instructions), *chained* (sequential instructions), and *nested* (conditional instructions) @wen_benchmarking_2024. See @sec:dataset-examples for detailed examples.

== Evaluation procedure

We evaluate a wide range of text-only LMs, deferring multimodal evaluation for future work. The models studied include leading proprietary, open-weight, and open-source systems; a complete list is available in @appendix-models-table. All experiments were conducted via cloud APIs, using commercial endpoints for proprietary models and services like TogetherAI and Cirrascale for open models.

Following the precedent set by IFEval @zhou_instruction-following_2023 and IFBench @pyatkin_generalizing_2025, we evaluate outputs using both "strict" and "loose" criteria. The loose evaluation programmatically cleans model outputs to normalize for minor formatting artifacts. Our benchmark instructions test five broad categories of compliance: (1) exact cardinality, (2) table schema, (3) ordering/deduplication, (4) style cues, and (5) word limits.

= Results
Our findings reveal a clear hierarchy in instruction-following capabilities, with open-weight models leading the `IFF` benchmark. As shown in @results-table, systems like Llama-4 Maverick 17B surpass the strongest closed-source models. While proprietary systems remain competitive, they no longer define the frontier of performance. Fully open-source models, despite recent progress, continue to lag behind both their open-weight and proprietary counterparts.

A surprising result is the relatively weak performance of several models explicitly designed for complex reasoning. Despite their focus on multi-step or conversational tasks, their reliability in our strict evaluation is not markedly stronger than general-purpose models, and in some cases, it is worse. This suggests that current reasoning-oriented tuning does not necessarily translate to more precise instruction following.

Across all model classes, we find that failures often stem from an inability to adhere to precise formatting or structural requirements. The significant gap between "strict" and "loose" scores, particularly for open-source models, indicates that many failures are "near misses" where the semantic content is correct but a specific constraint is violated.

#figure(
  kind: "table",
  supplement: none, // prevents duplication in caption
  image("table_benchmark.svg", width: 100%),
  caption: [Table 1: Model performance on the IFF Benchmark],
) <results-table>

= Limitations

Our evaluation has two primary limitations. First, we rely on a single response per prompt due to API cost, which limits robustness against stochastic model variation. Second, our regex-based validators, while transparent and reproducible, can be brittle. They may occasionally fail to recognize a semantically correct response due to minor formatting deviations. More flexible validation methods, such as LLM-as-a-judge or hybrid semantic checks, are a natural next step for future work.

= Conclusion

In this study, we introduced the `IFF` Benchmark to assess instruction-following reliability for financial applications. While proprietary systems remain competitive, they are no longer dominant, with top-performing open-weight models now leading in instruction-following capabilities; fully open-source models, however, continue to lag behind. We find that reasoning-oriented models and smaller checkpoints surprisingly underperform, suggesting that scaling or explicit reasoning design alone does not ensure robustness. The observed gap between strict and loose scoring indicates that many failures are "near-misses",outputs that are semantically plausible but procedurally flawed. This highlights that for models to be trusted in finance, the standard for success must be precise, verifiable compliance, not just plausible generation.

#pagebreak()
#heading(numbering: none)[References]