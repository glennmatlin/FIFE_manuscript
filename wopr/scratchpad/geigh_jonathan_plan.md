\## 1) Copy‑paste prompt for your AI agent



> \*\*Role \& goal\*\*

> You are a careful writing assistant. Your job is to scan all `\*.typ` files in my project and suggest \*\*at most two\*\* high‑leverage citation insertions \*\*per paper\*\* from the attached JSONL “context pack”. Focus on my paper’s topic: \*\*AI and LLMs in open‑ended, language‑based wargames\*\* (creativity, novelty, exploration, narrative coherence, rule changes, reliability/hallucination, world models). Cite \*\*only\*\* where a paper \*specifically substantiates\* a claim, methodological choice, metric, or definition in the local text. Do \*\*not\*\* sprinkle background citations everywhere.

>

> \*\*Inputs you have\*\*

>

> 1. All repository `\*.typ` files.

> 2. The \*\*context pack\*\* JSONL (one line per paper) that includes:

>

>    \* `key` (Zotero‑style citation key I will use in `\[@key]` syntax in Typst),

>    \* canonical metadata (title, authors, year, venue, DOI/arXiv/url),

>    \* a BLUF summary,

>    \* `citable\_points` (1–2 claims that are ideal to cite),

>    \* `anchor\_phrases` (what to search for in my text),

>    \* `avoid\_citing\_when` (when not to cite),

>    \* and an example local insertion.

>

> \*\*How to work\*\*

>

> 1. \*\*Index\*\* all `\*.typ` files. Record paragraph/line numbers or a stable snippet around candidate spots.

> 2. For each JSONL paper (in given order), run a \*\*keyword+synonym\*\* scan using that entry’s `anchor\_phrases`. Consider synonyms (examples below).

> 3. When you find a promising span, verify the local claim actually matches the paper’s \*\*specific\*\* `citable\_points`. If it’s only vaguely related, skip it.

> 4. Propose \*\*one\*\* insertion for that paper. If the whole project lacks a clean spot, you may propose \*\*a second\*\* alternative; otherwise skip the paper entirely. Do not exceed \*\*two\*\* suggestions per paper.

> 5. \*\*Insertion format\*\* for Typst: put the citation right after the precise clause it supports using `\[@<key>]`.

> 6. Be conservative: if a claim is generic background (e.g., “RL explores”) or already sufficiently cited, \*\*do not\*\* add another citation.

> 7. \*\*Output schema (JSONL)\*\*: one line per \*suggestion\* with

>

> ```

> {

>   "paper\_key": "<key from context pack>",

>   "file": "<relative/path.typ>",

>   "line\_or\_snippet": "<line no(s) or a short unique snippet>",

>   "why\_here": "<1–2 sentences mapping the local claim to the paper’s citable point>",

>   "insertion": "…the exact text with the citation injected…",

>   "fallback": "optional alternative location if your first choice is weak"

> }

> ```

>

> \*\*Trigger synonyms (use in addition to each entry’s `anchor\_phrases`)\*\*

>

> \* \*Novelty \& rule change\*: novelty, \*\*distribution shift\*\*, \*\*open‑world\*\*, \*\*house rules\*\*, rule change, mechanics change, \*\*non‑stationary\*\*

> \* \*Exploration\*: \*\*intrinsic reward\*\*, curiosity, diversity, stochasticity, \*\*NoisyNets\*\*, RE3, DIAYN, \*\*transfer\*\*

> \* \*World models\*: model‑based RL, \*\*imagination\*\*, dreamer, \*\*forward model\*\*, symbolic rules

> \* \*Narrative coherence for LLMs\*: \*\*coherence\*\*, fabula, \*\*reader agreement\*\*, \*\*true/false QA\*\*, backward story generation, \*\*EDGAR\*\*

> \* \*Reliability/Hallucination\*: hallucination, \*\*early token logits\*\*, \*\*AUROC\*\*, detection, reliability, multi‑token

> \* \*Safety/purification\*: adversarial examples, diffusion, purification, Tucker, denoise

>

> \*\*Quality bar\*\*

>

> \* Only propose insertions that \*tighten\* an argument or ground a method/metric.

> \* Prefer exact claims with numbers/definitions (e.g., “explicit diversity and stochasticity help transfer”) over generic statements.

> \* If two papers could fit, choose the \*\*more exact\*\* one; do not cite two.

>

> \*\*Deliverables\*\*

>

> \* A JSONL list of suggested insertions (schema above).

> \* A short changelog: counts by file and which papers were used or skipped.





Below are JSON Lines you can use for the paper content (e.g., `context\_pack.jsonl`).



\* Keys follow your formula (first author family, shortTitle(1), year).

\* I set `shortTitle` so the rendered keys are informative (e.g., \*Exploration\* instead of \*Is\*).

\* Each `note` carries the BLUF + citable points + trigger phrases so your agent has everything in one place.

\* You can  use the keys directly in Typst.



```jsonl

{

&nbsp; "id": "castricato\_fabula\_2021",

&nbsp; "type": "paper-conference",

&nbsp; "title": "Fabula Entropy Indexing: Objective Measures of Story Coherence",

&nbsp; "shortTitle": "Fabula",

&nbsp; "author": \[

&nbsp;   {"family": "Castricato", "given": "Louis"},

&nbsp;   {"family": "Frazier", "given": "Spencer"},

&nbsp;   {"family": "Balloch", "given": "Jonathan"},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2021]]},

&nbsp; "container-title": "Proceedings of the Third Workshop on Narrative Understanding (NAACL-HLT)",

&nbsp; "page": "84–94",

&nbsp; "DOI": "10.18653/v1/2021.nuse-1.9",

&nbsp; "URL": "https://aclanthology.org/2021.nuse-1.9/",

&nbsp; "note": "BLUF: Introduces FEI—two entropy-based metrics (EWC and ETC) that quantify story coherence via reader agreement on true/false questions. Citable points: (1) Reader answer entropy reliably discriminates coherent vs corrupted stories; (2) ETC (event transitions) and EWC (world facts) cover local vs global coherence. Anchor\_phrases: coherence metric; reader agreement; entropy of answers; fabula; transitional vs world coherence. Avoid\_citing\_when: generic mentions of 'coherence' without measurement. Example\_insertion: 'We quantify narrative coherence using reader agreement \[@castricato\_fabula\_2021].'"

}

{

&nbsp; "id": "castricato\_automated\_2021",

&nbsp; "type": "article-journal",

&nbsp; "title": "Automated Story Generation as Question-Answering",

&nbsp; "shortTitle": "Automated",

&nbsp; "author": \[

&nbsp;   {"family": "Castricato", "given": "Louis"},

&nbsp;   {"family": "Frazier", "given": "Spencer"},

&nbsp;   {"family": "Balloch", "given": "Jonathan"},

&nbsp;   {"family": "Tarakad", "given": "Nitya"},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2021]]},

&nbsp; "DOI": "10.48550/arXiv.2112.03808",

&nbsp; "URL": "https://arxiv.org/abs/2112.03808",

&nbsp; "note": "BLUF: Recasts story generation as iterative 'why' QA (EDGAR) generating backward from the ending; human studies show ~15% higher coherence than a strong LM baseline. Citable points: (1) Backward QA generation improves perceived coherence; (2) Coherence measured via FEI-style reader entropy. Anchor\_phrases: backward/goal-driven story generation; 'explain the ending'; QA-driven narration. Avoid\_citing\_when: generic claims about LLM creativity. Example\_insertion: 'We frame narrative generation as answering successive \\"why\\" questions \[@castricato\_automated\_2021].'"

}

{

&nbsp; "id": "balloch\_novgrid\_2022",

&nbsp; "type": "article-journal",

&nbsp; "title": "NovGrid: A Flexible Grid World for Evaluating Agent Response to Novelty",

&nbsp; "shortTitle": "NovGrid",

&nbsp; "author": \[

&nbsp;   {"family": "Balloch", "given": "Jonathan C."},

&nbsp;   {"family": "Lin", "given": "Zhiyu"},

&nbsp;   {"family": "Hussain", "given": "Mustafa"},

&nbsp;   {"family": "Srinivas", "given": "Aarun"},

&nbsp;   {"family": "Wright", "given": "Robert"},

&nbsp;   {"family": "Peng", "given": "Xiangyu"},

&nbsp;   {"family": "Kim", "given": "Julia"},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2022]]},

&nbsp; "DOI": "10.48550/arXiv.2203.12117",

&nbsp; "URL": "https://arxiv.org/abs/2203.12117",

&nbsp; "note": "BLUF: Defines a novelty ontology for RL (object vs action; unary vs relational; hindering vs shortcut novelties) and releases NovGrid to inject such changes and evaluate adaptation metrics. Citable points: (1) Clear definition/taxonomy of 'novelty' distinct from outliers/continual learning; (2) Built-in metrics for pre/post-novelty recovery. Anchor\_phrases: novelty ontology; house rules; shortcut novelties; non-stationary; adaptation metrics. Avoid: generic transfer statements. Example: 'We adopt NovGrid’s taxonomy of novelty types \[@balloch\_novgrid\_2022].'"

}

{

&nbsp; "id": "balloch\_neuro\_symbolic\_2023",

&nbsp; "type": "paper-conference",

&nbsp; "title": "Neuro-Symbolic World Models for Adapting to Open World Novelty",

&nbsp; "shortTitle": "Neuro-Symbolic",

&nbsp; "author": \[

&nbsp;   {"family": "Balloch", "given": "Jonathan C."},

&nbsp;   {"family": "Lin", "given": "Zhiyu"},

&nbsp;   {"family": "Hussain", "given": "Mustafa"},

&nbsp;   {"family": "Srinivas", "given": "Aarun"},

&nbsp;   {"family": "Peng", "given": "Xiangyu"},

&nbsp;   {"family": "Kim", "given": "Julia"},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2023]]},

&nbsp; "DOI": "10.1145/3545946.3599099",

&nbsp; "URL": "https://arxiv.org/abs/2301.06294",

&nbsp; "note": "BLUF: WorldCloner learns symbolic rules pre‑novelty and uses them for novelty detection plus imagination‑based adaptation, cutting post‑novelty interactions vs neural‑only baselines. Citable points: (1) Symbolic rule updates detect novelty via failed predictions; (2) Imagination rollouts accelerate adaptation. Anchor\_phrases: world model; neuro‑symbolic; imagination; rule pre‑/post‑conditions; novelty detection via prediction error. Avoid: generic 'model‑based RL' claims. Example: 'We detect rule changes via symbolic forward‑model mismatches \[@balloch\_neuro\_symbolic\_2023].'"

}

{

&nbsp; "id": "peng\_detecting\_2021",

&nbsp; "type": "paper-conference",

&nbsp; "title": "Detecting and Adapting to Novelty in Games",

&nbsp; "shortTitle": "Detecting",

&nbsp; "author": \[

&nbsp;   {"family": "Peng", "given": "Xiangyu"},

&nbsp;   {"family": "Balloch", "given": "Jonathan C."},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2021]]},

&nbsp; "URL": "https://arxiv.org/abs/2106.02204",

&nbsp; "note": "BLUF: Knowledge‑graph rules for game mechanics enable (1) novelty detection as graph deltas and (2) imagination‑based retraining for fast adaptation. Citable points: (1) KG of state + rules aids detection and policy recovery under 'house rules'; (2) Model‑based look‑ahead using KG. Anchor\_phrases: knowledge graph rules; house rules; rule delta; imagination; model-based adaptation. Avoid: citations about text-only KGs unless tied to rules. Example: 'We model rule changes as knowledge‑graph updates \[@peng\_detecting\_2021].'"

}

{

&nbsp; "id": "balloch\_role\_2022",

&nbsp; "type": "report",

&nbsp; "title": "The Role of Exploration for Task Transfer in Reinforcement Learning",

&nbsp; "shortTitle": "Role",

&nbsp; "author": \[

&nbsp;   {"family": "Balloch", "given": "Jonathan C."},

&nbsp;   {"family": "Kim", "given": "Julia"},

&nbsp;   {"family": "Riedl", "given": "Mark O."},

&nbsp;   {"family": "Inman", "given": "Jessica L."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2022]]},

&nbsp; "DOI": "10.48550/arXiv.2210.06168",

&nbsp; "URL": "https://arxiv.org/abs/2210.06168",

&nbsp; "note": "BLUF: Conceptual taxonomy linking exploration principles (e.g., stochasticity, prediction error, multi‑goal) to \*\*online task transfer\*\* needs in non‑stationary RL. Citable points: (1) Why transfer RL needs different exploration trade‑offs than single‑task; (2) World‑model‑centric exploration as a promising path. Anchor\_phrases: exploration-exploitation; online transfer; taxonomy; non‑stationary. Avoid: generic exploration citations. Example: 'We adopt an exploration taxonomy tailored for transfer \[@balloch\_role\_2022].'"

}

{

&nbsp; "id": "balloch\_exploration\_2024",

&nbsp; "type": "report",

&nbsp; "title": "Is Exploration All You Need? Effective Exploration Characteristics for Transfer in Reinforcement Learning",

&nbsp; "shortTitle": "Exploration",

&nbsp; "author": \[

&nbsp;   {"family": "Balloch", "given": "Jonathan C."},

&nbsp;   {"family": "Zollicoffer", "given": "Geigh"},

&nbsp;   {"family": "Peng", "given": "Xiangyu"},

&nbsp;   {"family": "Kim", "given": "Julia"},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2024]]},

&nbsp; "DOI": "10.48550/arXiv.2404.02235",

&nbsp; "URL": "https://arxiv.org/abs/2404.02235",

&nbsp; "note": "BLUF: Large empirical study (11 exploration algos, 5 OTT novelties) shows \*\*explicit diversity\*\* and \*\*stochasticity\*\* consistently improve online transfer; time‑dependent exploration harms continuous control transfer. Citable points: (1) Diversity \& stochasticity => better adaptive efficiency; (2) Convergence vs adaptation trade‑off differs by discrete/continuous control. Anchor\_phrases: explicit diversity; NoisyNets; RE3; OTT; adaptive efficiency. Avoid: generic 'exploration helps' claims. Example: 'We choose diversity‑driven exploration for transfer \[@balloch\_exploration\_2024].'"

}

{

&nbsp; "id": "zollicoffer\_novelty\_2023",

&nbsp; "type": "report",

&nbsp; "title": "Novelty Detection in Reinforcement Learning with World Models",

&nbsp; "shortTitle": "Novelty",

&nbsp; "author": \[

&nbsp;   {"family": "Zollicoffer", "given": "Geigh"},

&nbsp;   {"family": "Eaton", "given": "Kenneth"},

&nbsp;   {"family": "Balloch", "given": "Jonathan"},

&nbsp;   {"family": "Kim", "given": "Julia"},

&nbsp;   {"family": "Zhou", "given": "Wei"},

&nbsp;   {"family": "Wright", "given": "Robert"},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2023]]},

&nbsp; "DOI": "10.48550/arXiv.2310.08731",

&nbsp; "URL": "https://arxiv.org/abs/2310.08731",

&nbsp; "note": "BLUF: In world‑model RL, detect novelty by \*\*misalignment between predicted ('hallucinated') and observed next states\*\* using KL‑based bounds—outperforms prior RL novelty detectors across MiniGrid/Atari/DM‑Control. Citable points: (1) KL‑bound novelty score in world models; (2) Practical halting or adaptation trigger for safety. Anchor\_phrases: world model collapse; predicted vs observed mismatch; KL divergence; halting. Avoid: OOD detection unrelated to transition dynamics. Example: 'We monitor model/observation divergence for novelty \[@zollicoffer\_novelty\_2023].'"

}

{

&nbsp; "id": "zollicoffer\_diverging\_2025",

&nbsp; "type": "report",

&nbsp; "title": "Diverging Towards Hallucination: Detection of Failures in Vision-Language Models via Multi-token Aggregation",

&nbsp; "shortTitle": "Diverging",

&nbsp; "author": \[

&nbsp;   {"family": "Zollicoffer", "given": "Geigh"},

&nbsp;   {"family": "Vu", "given": "Minh"},

&nbsp;   {"family": "Bhattarai", "given": "Manish"}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2025]]},

&nbsp; "DOI": "10.48550/arXiv.2505.11741",

&nbsp; "URL": "https://arxiv.org/abs/2505.11741",

&nbsp; "note": "BLUF: Hallucination detection for VLMs improves by aggregating the \*\*first ~10 token logits\*\* (MTRE) rather than only the first token; SOTA AUROC gains on safety/math/geometry benchmarks. Citable points: (1) Multi‑token reliability beats single‑token P(True)/linear probes; (2) Early‑sequence divergence signals unreliable generations. Anchor\_phrases: hallucination detection; early token logits; AUROC; reliability estimation. Avoid: factuality in text‑only LLMs unless multi‑token signal is relevant. Example: 'We assess VLM reliability via multi‑token aggregation \[@zollicoffer\_diverging\_2025].'"

}

{

&nbsp; "id": "zollicoffer\_lorid\_2025",

&nbsp; "type": "paper-conference",

&nbsp; "title": "LoRID: Low-Rank Iterative Diffusion for Adversarial Purification",

&nbsp; "shortTitle": "LoRID",

&nbsp; "author": \[

&nbsp;   {"family": "Zollicoffer", "given": "Geigh"},

&nbsp;   {"family": "Vu", "given": "Minh N."},

&nbsp;   {"family": "Nebgen", "given": "Ben"},

&nbsp;   {"family": "Castorena", "given": "Juan"},

&nbsp;   {"family": "Alexandrov", "given": "Boian"},

&nbsp;   {"family": "Bhattarai", "given": "Manish"}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2025]]},

&nbsp; "container-title": "Proceedings of the AAAI Conference on Artificial Intelligence, 39(21), 23081–23089",

&nbsp; "DOI": "10.1609/aaai.v39i21.34472",

&nbsp; "URL": "https://arxiv.org/abs/2409.08255",

&nbsp; "note": "BLUF: Information‑theoretic analysis of diffusion‑based adversarial purification; proposes \*\*multi‑stage early‑step denoise + Tucker low‑rank factorization\*\* to reduce purification error, SOTA robustness on CIFAR‑10/100/CelebA‑HQ/ImageNet. Citable points: (1) Low‑rank iterative purification improves robustness; (2) Early‑step multi‑pass denoising mitigates over/under‑purification. Anchor\_phrases: adversarial inputs; diffusion purification; low‑rank/Tucker. Avoid: general adversarial training. Example: 'We purify VLM inputs via low‑rank iterative diffusion \[@zollicoffer\_lorid\_2025].'"

}

{

&nbsp; "id": "smith\_always\_2021",

&nbsp; "type": "paper-conference",

&nbsp; "title": "Always Be Dreaming: A New Approach for Data-Free Class-Incremental Learning",

&nbsp; "shortTitle": "Always",

&nbsp; "author": \[

&nbsp;   {"family": "Smith", "given": "James"},

&nbsp;   {"family": "Hsu", "given": "Yen-Chang"},

&nbsp;   {"family": "Balloch", "given": "Jonathan"},

&nbsp;   {"family": "Shen", "given": "Yilin"},

&nbsp;   {"family": "Jin", "given": "Hongxia"},

&nbsp;   {"family": "Kira", "given": "Zsolt"}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2021]]},

&nbsp; "container-title": "Proceedings of ICCV 2021",

&nbsp; "DOI": "10.1109/ICCV48922.2021.00924",

&nbsp; "URL": "https://openaccess.thecvf.com/content/ICCV2021/html/Smith\_Always\_Be\_Dreaming\_A\_New\_Approach\_for\_Data-Free\_Class-Incremental\_Learning\_ICCV\_2021\_paper.html",

&nbsp; "note": "BLUF: Data‑free class‑incremental learning with a new distillation strategy; up to \*\*25.1%\*\* absolute accuracy gain over DeepInversion baselines. Citable points: (1) How to incrementally learn without storing past data; (2) Feature‑distillation + linear‑head fine‑tuning. Anchor\_phrases: data‑free incremental; knowledge distillation; no stored replay. Avoid: claims about RL transfer. Example: 'We discuss data‑free incremental learning via targeted distillation \[@smith\_always\_2021].'"

}

{

&nbsp; "id": "smith\_memory\_2021",

&nbsp; "type": "paper-conference",

&nbsp; "title": "Memory-Efficient Semi-Supervised Continual Learning: The World is its Own Replay Buffer",

&nbsp; "shortTitle": "Memory",

&nbsp; "author": \[

&nbsp;   {"family": "Smith", "given": "James"},

&nbsp;   {"family": "Balloch", "given": "Jonathan"},

&nbsp;   {"family": "Hsu", "given": "Yen-Chang"},

&nbsp;   {"family": "Kira", "given": "Zsolt"}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2021]]},

&nbsp; "container-title": "International Joint Conference on Neural Networks (IJCNN) 2021",

&nbsp; "DOI": "10.48550/arXiv.2101.09536",

&nbsp; "URL": "https://arxiv.org/abs/2101.09536",

&nbsp; "note": "BLUF: Semi‑supervised continual learning with DistillMatch leverages \*\*unlabeled in‑environment data\*\*; +8.7% to +54.5% avg task accuracy vs SOTA and better memory efficiency (e.g., 0.23 vs 0.08 stored images per processed unlabeled image). Citable points: (1) Use ambient data streams as 'replay'; (2) Practical memory/sensitivity trade‑offs. Anchor\_phrases: semi‑supervised continual; unlabeled environment data; replay buffer from the world. Avoid: LLM‑only claims unless about continual updates. Example: 'We treat logs/transcripts as a replay source \[@smith\_memory\_2021].'"

}

```



---



\## 3) How these papers connect to \*\*AI/LLMs in open‑ended language wargames\*\* (what to look for)



\* \*\*Narrative coherence \& adjudication\*\* — Use FEI for an \*objective\* coherence signal for generated free‑Kriegsspiel narratives or adjudication rationales (reader‑agreement entropy as a metric of coherence for story/world facts). (\[ACL Anthology]\[1])

\* \*\*Goal‑backward story generation\*\* — When you describe backward reasoning to reach a pre‑stated endstate (a victory condition or consequence), cite the QA‑driven \*backwards\* generator (EDGAR) that improved coherence in human studies. (\[arXiv]\[2])

\* \*\*Non‑stationary rules (“house rules”)\*\* — For rule changes, cite the novelty ontology (NovGrid) and KG‑based rule modeling/detection/adaptation (Peng et al.). These map directly to wargame adjudication when rules mutate.\&#x20;

\* \*\*World models for rapid adaptation\*\* — If you propose a world‑model loop for wargame engines, cite WorldCloner (symbolic rule mismatches for detection + imagination‑based updates) and Zollicoffer et al. (KL‑bound novelty signals in world models). (\[arXiv]\[3])

\* \*\*Exploration settings for transfer\*\* — For experimental choices about exploration in open‑world scenarios (e.g., scouting for rule changes or shortcuts), cite the 2024 study showing \*\*explicit diversity/stochasticity\*\* help online transfer and the 2022 taxonomy that motivates transfer‑specific exploration. (\[arXiv]\[4])

\* \*\*Reliability/hallucination in VLM adjudication\*\* — When you monitor VLM rationales (maps, counters, orders), cite multi‑token reliability (MTRE) for hallucination detection. (\[arXiv]\[5])

\* \*\*Safety/purification for image inputs\*\* — If your pipeline filters map screenshots or game images before a VLM sees them, LoRID is the right pointer. (\[arXiv]\[6])

\* \*\*Continual learning without data hoarding\*\* — For policies about not storing sensitive play logs, cite data‑free and semi‑supervised continual learning to justify safe incremental updates from ambient data. (\[CVF Open Access]\[7])



---



\### Notes on sources (for your records)



\* \*\*FEI (coherence metrics)\*\*: ACL Anthology page with DOI and full PDF confirm EWC/ETC definitions and validation on corrupted vs original stories. (\[ACL Anthology]\[1])

\* \*\*Automated Story Generation as QA (EDGAR)\*\*: arXiv paper shows \\~15% coherence gain and uses FEI‑style reader entropy in evaluation. (\[arXiv]\[2])

\* \*\*NovGrid (novelty ontology \& metrics)\*\*: arXiv PDF defines novelty classes and evaluation metrics.\&#x20;

\* \*\*WorldCloner (neuro‑symbolic)\*\*: arXiv PDF details rule‑mismatch detection and imagination‑based adaptation; ACM DOI confirms publication metadata. (\[arXiv]\[3])

\* \*\*KG rules for house rules\*\*: arXiv PDF with explicit knowledge‑graph rule modeling and look‑ahead.\&#x20;

\* \*\*Exploration for transfer (empirical)\*\*: arXiv HTML summarises key findings (diversity/stochasticity; time‑dependent harms). (\[arXiv]\[4])

\* \*\*Exploration taxonomy for transfer (conceptual)\*\*: arXiv PDF motivates transfer‑specific exploration needs.\&#x20;

\* \*\*World‑model novelty detection (KL bound)\*\*: arXiv HTML explains predicted‑vs‑observed divergence scoring and cross‑benchmark results. (\[arXiv]\[8])

\* \*\*VLM hallucination detection (multi‑token)\*\*: arXiv page provides MTRE concept and reported AUROC gains. (\[arXiv]\[5])

\* \*\*LoRID purification\*\*: arXiv \& AAAI metadata confirm method and publication; PDF shows Tucker low‑rank detail. (\[arXiv]\[6])

\* \*\*Data‑free CIL (25.1% gain)\*\*: ICCV paper PDF states the improvement and method. (\[CVF Open Access]\[7])

\* \*\*SSCL (world as replay buffer)\*\*: arXiv abstract details +8.7% to +54.5% gains and memory efficiency numbers. (\[arXiv]\[9])



---



\### What to do next



1\. Save the JSONL block as `context\_pack.jsonl`.

2\. Give the agent the prompt (Section 1) and the context pack.

3\. Have it output its \*\*suggested insertions\*\* in JSONL—then you can accept/reject and apply diffs in your Typst files.



If you’d like, I can also generate a first pass of the suggestions against a specific repo snapshot once you share the files.



\[1]: https://aclanthology.org/2021.nuse-1.9/ "Fabula Entropy Indexing: Objective Measures of Story Coherence - ACL Anthology"

\[2]: https://arxiv.org/abs/2112.03808 "\[2112.03808] Automated Story Generation as Question-Answering"

\[3]: https://arxiv.org/pdf/2301.06294 "Neuro-Symbolic World Models for Adapting to Open World Novelty"

\[4]: https://arxiv.org/html/2404.02235v1 "Is Exploration All You Need? Effective Exploration Characteristics for Transfer in Reinforcement Learning"

\[5]: https://arxiv.org/abs/2505.11741 "\[2505.11741] Diverging Towards Hallucination: Detection of Failures in Vision-Language Models via Multi-token Aggregation"

\[6]: https://arxiv.org/pdf/2409.08255?utm\_source=chatgpt.com "arXiv:2409.08255v1 \[cs.LG] 12 Sep 2024"

\[7]: https://openaccess.thecvf.com/content/ICCV2021/papers/Smith\_Always\_Be\_Dreaming\_A\_New\_Approach\_for\_Data-Free\_Class-Incremental\_Learning\_ICCV\_2021\_paper.pdf "Always Be Dreaming: A New Approach for Data-Free Class-Incremental Learning"

\[8]: https://arxiv.org/html/2310.08731v4 "Novelty Detection in Reinforcement Learning with World Models"

\[9]: https://arxiv.org/abs/2101.09536 "\[2101.09536] Memory-Efficient Semi-Supervised Continual Learning: The World is its Own Replay Buffer"



> \*\*Inputs you have\*\*

>

> 1. All repository `\*.typ` files.

> 2. The \*\*context pack\*\* JSONL (one line per paper) that includes:

>

>    \* `key` (Zotero‑style citation key I will use in `\[@key]` syntax in Typst),

>    \* canonical metadata (title, authors, year, venue, DOI/arXiv/url),

>    \* a BLUF summary,

>    \* `citable\_points` (1–2 claims that are ideal to cite),

>    \* `anchor\_phrases` (what to search for in my text),

>    \* `avoid\_citing\_when` (when not to cite),

>    \* and an example local insertion.

>

> \*\*How to work\*\*

>

> 1. \*\*Index\*\* all `\*.typ` files. Record paragraph/line numbers or a stable snippet around candidate spots.

> 2. For each JSONL paper (in given order), run a \*\*keyword+synonym\*\* scan using that entry’s `anchor\_phrases`. Consider synonyms (examples below).

> 3. When you find a promising span, verify the local claim actually matches the paper’s \*\*specific\*\* `citable\_points`. If it’s only vaguely related, skip it.

> 4. Propose \*\*one\*\* insertion for that paper. If the whole project lacks a clean spot, you may propose \*\*a second\*\* alternative; otherwise skip the paper entirely. Do not exceed \*\*two\*\* suggestions per paper.

> 5. \*\*Insertion format\*\* for Typst: put the citation right after the precise clause it supports using `\[@<key>]`.

> 6. Be conservative: if a claim is generic background (e.g., “RL explores”) or already sufficiently cited, \*\*do not\*\* add another citation.

> 7. \*\*Output schema (JSONL)\*\*: one line per \*suggestion\* with

>

> ```

> {

>   "paper\_key": "<key from context pack>",

>   "file": "<relative/path.typ>",

>   "line\_or\_snippet": "<line no(s) or a short unique snippet>",

>   "why\_here": "<1–2 sentences mapping the local claim to the paper’s citable point>",

>   "insertion": "…the exact text with the citation injected…",

>   "fallback": "optional alternative location if your first choice is weak"

> }

> ```

>

> \*\*Trigger synonyms (use in addition to each entry’s `anchor\_phrases`)\*\*

>

> \* \*Novelty \& rule change\*: novelty, \*\*distribution shift\*\*, \*\*open‑world\*\*, \*\*house rules\*\*, rule change, mechanics change, \*\*non‑stationary\*\*

> \* \*Exploration\*: \*\*intrinsic reward\*\*, curiosity, diversity, stochasticity, \*\*NoisyNets\*\*, RE3, DIAYN, \*\*transfer\*\*

> \* \*World models\*: model‑based RL, \*\*imagination\*\*, dreamer, \*\*forward model\*\*, symbolic rules

> \* \*Narrative coherence for LLMs\*: \*\*coherence\*\*, fabula, \*\*reader agreement\*\*, \*\*true/false QA\*\*, backward story generation, \*\*EDGAR\*\*

> \* \*Reliability/Hallucination\*: hallucination, \*\*early token logits\*\*, \*\*AUROC\*\*, detection, reliability, multi‑token

> \* \*Safety/purification\*: adversarial examples, diffusion, purification, Tucker, denoise

>

> \*\*Quality bar\*\*

>

> \* Only propose insertions that \*tighten\* an argument or ground a method/metric.

> \* Prefer exact claims with numbers/definitions (e.g., “explicit diversity and stochasticity help transfer”) over generic statements.

> \* If two papers could fit, choose the \*\*more exact\*\* one; do not cite two.

>

> \*\*Deliverables\*\*

>

> \* A JSONL list of suggested insertions (schema above).

> \* A short changelog: counts by file and which papers were used or skipped.



---



\## 2) Context pack (JSONL with Zotero‑style keys)



Below are JSON Lines you can save (e.g., `context\_pack.jsonl`).



\* Keys follow your formula (first author family, shortTitle(1), year).

\* I set `shortTitle` so the rendered keys are informative (e.g., \*Exploration\* instead of \*Is\*).

\* Each `note` carries the BLUF + citable points + trigger phrases so your agent has everything in one place.

\* You can import these into Zotero (CSL‑JSON is supported) or use the keys directly in Typst.



```jsonl

{

&nbsp; "id": "castricato\_fabula\_2021",

&nbsp; "type": "paper-conference",

&nbsp; "title": "Fabula Entropy Indexing: Objective Measures of Story Coherence",

&nbsp; "shortTitle": "Fabula",

&nbsp; "author": \[

&nbsp;   {"family": "Castricato", "given": "Louis"},

&nbsp;   {"family": "Frazier", "given": "Spencer"},

&nbsp;   {"family": "Balloch", "given": "Jonathan"},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2021]]},

&nbsp; "container-title": "Proceedings of the Third Workshop on Narrative Understanding (NAACL-HLT)",

&nbsp; "page": "84–94",

&nbsp; "DOI": "10.18653/v1/2021.nuse-1.9",

&nbsp; "URL": "https://aclanthology.org/2021.nuse-1.9/",

&nbsp; "note": "BLUF: Introduces FEI—two entropy-based metrics (EWC and ETC) that quantify story coherence via reader agreement on true/false questions. Citable points: (1) Reader answer entropy reliably discriminates coherent vs corrupted stories; (2) ETC (event transitions) and EWC (world facts) cover local vs global coherence. Anchor\_phrases: coherence metric; reader agreement; entropy of answers; fabula; transitional vs world coherence. Avoid\_citing\_when: generic mentions of 'coherence' without measurement. Example\_insertion: 'We quantify narrative coherence using reader agreement \[@castricato\_fabula\_2021].'"

}

{

&nbsp; "id": "castricato\_automated\_2021",

&nbsp; "type": "article-journal",

&nbsp; "title": "Automated Story Generation as Question-Answering",

&nbsp; "shortTitle": "Automated",

&nbsp; "author": \[

&nbsp;   {"family": "Castricato", "given": "Louis"},

&nbsp;   {"family": "Frazier", "given": "Spencer"},

&nbsp;   {"family": "Balloch", "given": "Jonathan"},

&nbsp;   {"family": "Tarakad", "given": "Nitya"},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2021]]},

&nbsp; "DOI": "10.48550/arXiv.2112.03808",

&nbsp; "URL": "https://arxiv.org/abs/2112.03808",

&nbsp; "note": "BLUF: Recasts story generation as iterative 'why' QA (EDGAR) generating backward from the ending; human studies show ~15% higher coherence than a strong LM baseline. Citable points: (1) Backward QA generation improves perceived coherence; (2) Coherence measured via FEI-style reader entropy. Anchor\_phrases: backward/goal-driven story generation; 'explain the ending'; QA-driven narration. Avoid\_citing\_when: generic claims about LLM creativity. Example\_insertion: 'We frame narrative generation as answering successive \\"why\\" questions \[@castricato\_automated\_2021].'"

}

{

&nbsp; "id": "balloch\_novgrid\_2022",

&nbsp; "type": "article-journal",

&nbsp; "title": "NovGrid: A Flexible Grid World for Evaluating Agent Response to Novelty",

&nbsp; "shortTitle": "NovGrid",

&nbsp; "author": \[

&nbsp;   {"family": "Balloch", "given": "Jonathan C."},

&nbsp;   {"family": "Lin", "given": "Zhiyu"},

&nbsp;   {"family": "Hussain", "given": "Mustafa"},

&nbsp;   {"family": "Srinivas", "given": "Aarun"},

&nbsp;   {"family": "Wright", "given": "Robert"},

&nbsp;   {"family": "Peng", "given": "Xiangyu"},

&nbsp;   {"family": "Kim", "given": "Julia"},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2022]]},

&nbsp; "DOI": "10.48550/arXiv.2203.12117",

&nbsp; "URL": "https://arxiv.org/abs/2203.12117",

&nbsp; "note": "BLUF: Defines a novelty ontology for RL (object vs action; unary vs relational; hindering vs shortcut novelties) and releases NovGrid to inject such changes and evaluate adaptation metrics. Citable points: (1) Clear definition/taxonomy of 'novelty' distinct from outliers/continual learning; (2) Built-in metrics for pre/post-novelty recovery. Anchor\_phrases: novelty ontology; house rules; shortcut novelties; non-stationary; adaptation metrics. Avoid: generic transfer statements. Example: 'We adopt NovGrid’s taxonomy of novelty types \[@balloch\_novgrid\_2022].'"

}

{

&nbsp; "id": "balloch\_neuro\_symbolic\_2023",

&nbsp; "type": "paper-conference",

&nbsp; "title": "Neuro-Symbolic World Models for Adapting to Open World Novelty",

&nbsp; "shortTitle": "Neuro-Symbolic",

&nbsp; "author": \[

&nbsp;   {"family": "Balloch", "given": "Jonathan C."},

&nbsp;   {"family": "Lin", "given": "Zhiyu"},

&nbsp;   {"family": "Hussain", "given": "Mustafa"},

&nbsp;   {"family": "Srinivas", "given": "Aarun"},

&nbsp;   {"family": "Peng", "given": "Xiangyu"},

&nbsp;   {"family": "Kim", "given": "Julia"},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2023]]},

&nbsp; "DOI": "10.1145/3545946.3599099",

&nbsp; "URL": "https://arxiv.org/abs/2301.06294",

&nbsp; "note": "BLUF: WorldCloner learns symbolic rules pre‑novelty and uses them for novelty detection plus imagination‑based adaptation, cutting post‑novelty interactions vs neural‑only baselines. Citable points: (1) Symbolic rule updates detect novelty via failed predictions; (2) Imagination rollouts accelerate adaptation. Anchor\_phrases: world model; neuro‑symbolic; imagination; rule pre‑/post‑conditions; novelty detection via prediction error. Avoid: generic 'model‑based RL' claims. Example: 'We detect rule changes via symbolic forward‑model mismatches \[@balloch\_neuro\_symbolic\_2023].'"

}

{

&nbsp; "id": "peng\_detecting\_2021",

&nbsp; "type": "paper-conference",

&nbsp; "title": "Detecting and Adapting to Novelty in Games",

&nbsp; "shortTitle": "Detecting",

&nbsp; "author": \[

&nbsp;   {"family": "Peng", "given": "Xiangyu"},

&nbsp;   {"family": "Balloch", "given": "Jonathan C."},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2021]]},

&nbsp; "URL": "https://arxiv.org/abs/2106.02204",

&nbsp; "note": "BLUF: Knowledge‑graph rules for game mechanics enable (1) novelty detection as graph deltas and (2) imagination‑based retraining for fast adaptation. Citable points: (1) KG of state + rules aids detection and policy recovery under 'house rules'; (2) Model‑based look‑ahead using KG. Anchor\_phrases: knowledge graph rules; house rules; rule delta; imagination; model-based adaptation. Avoid: citations about text-only KGs unless tied to rules. Example: 'We model rule changes as knowledge‑graph updates \[@peng\_detecting\_2021].'"

}

{

&nbsp; "id": "balloch\_role\_2022",

&nbsp; "type": "report",

&nbsp; "title": "The Role of Exploration for Task Transfer in Reinforcement Learning",

&nbsp; "shortTitle": "Role",

&nbsp; "author": \[

&nbsp;   {"family": "Balloch", "given": "Jonathan C."},

&nbsp;   {"family": "Kim", "given": "Julia"},

&nbsp;   {"family": "Riedl", "given": "Mark O."},

&nbsp;   {"family": "Inman", "given": "Jessica L."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2022]]},

&nbsp; "DOI": "10.48550/arXiv.2210.06168",

&nbsp; "URL": "https://arxiv.org/abs/2210.06168",

&nbsp; "note": "BLUF: Conceptual taxonomy linking exploration principles (e.g., stochasticity, prediction error, multi‑goal) to \*\*online task transfer\*\* needs in non‑stationary RL. Citable points: (1) Why transfer RL needs different exploration trade‑offs than single‑task; (2) World‑model‑centric exploration as a promising path. Anchor\_phrases: exploration-exploitation; online transfer; taxonomy; non‑stationary. Avoid: generic exploration citations. Example: 'We adopt an exploration taxonomy tailored for transfer \[@balloch\_role\_2022].'"

}

{

&nbsp; "id": "balloch\_exploration\_2024",

&nbsp; "type": "report",

&nbsp; "title": "Is Exploration All You Need? Effective Exploration Characteristics for Transfer in Reinforcement Learning",

&nbsp; "shortTitle": "Exploration",

&nbsp; "author": \[

&nbsp;   {"family": "Balloch", "given": "Jonathan C."},

&nbsp;   {"family": "Zollicoffer", "given": "Geigh"},

&nbsp;   {"family": "Peng", "given": "Xiangyu"},

&nbsp;   {"family": "Kim", "given": "Julia"},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2024]]},

&nbsp; "DOI": "10.48550/arXiv.2404.02235",

&nbsp; "URL": "https://arxiv.org/abs/2404.02235",

&nbsp; "note": "BLUF: Large empirical study (11 exploration algos, 5 OTT novelties) shows \*\*explicit diversity\*\* and \*\*stochasticity\*\* consistently improve online transfer; time‑dependent exploration harms continuous control transfer. Citable points: (1) Diversity \& stochasticity => better adaptive efficiency; (2) Convergence vs adaptation trade‑off differs by discrete/continuous control. Anchor\_phrases: explicit diversity; NoisyNets; RE3; OTT; adaptive efficiency. Avoid: generic 'exploration helps' claims. Example: 'We choose diversity‑driven exploration for transfer \[@balloch\_exploration\_2024].'"

}

{

&nbsp; "id": "zollicoffer\_novelty\_2023",

&nbsp; "type": "report",

&nbsp; "title": "Novelty Detection in Reinforcement Learning with World Models",

&nbsp; "shortTitle": "Novelty",

&nbsp; "author": \[

&nbsp;   {"family": "Zollicoffer", "given": "Geigh"},

&nbsp;   {"family": "Eaton", "given": "Kenneth"},

&nbsp;   {"family": "Balloch", "given": "Jonathan"},

&nbsp;   {"family": "Kim", "given": "Julia"},

&nbsp;   {"family": "Zhou", "given": "Wei"},

&nbsp;   {"family": "Wright", "given": "Robert"},

&nbsp;   {"family": "Riedl", "given": "Mark O."}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2023]]},

&nbsp; "DOI": "10.48550/arXiv.2310.08731",

&nbsp; "URL": "https://arxiv.org/abs/2310.08731",

&nbsp; "note": "BLUF: In world‑model RL, detect novelty by \*\*misalignment between predicted ('hallucinated') and observed next states\*\* using KL‑based bounds—outperforms prior RL novelty detectors across MiniGrid/Atari/DM‑Control. Citable points: (1) KL‑bound novelty score in world models; (2) Practical halting or adaptation trigger for safety. Anchor\_phrases: world model collapse; predicted vs observed mismatch; KL divergence; halting. Avoid: OOD detection unrelated to transition dynamics. Example: 'We monitor model/observation divergence for novelty \[@zollicoffer\_novelty\_2023].'"

}

{

&nbsp; "id": "zollicoffer\_diverging\_2025",

&nbsp; "type": "report",

&nbsp; "title": "Diverging Towards Hallucination: Detection of Failures in Vision-Language Models via Multi-token Aggregation",

&nbsp; "shortTitle": "Diverging",

&nbsp; "author": \[

&nbsp;   {"family": "Zollicoffer", "given": "Geigh"},

&nbsp;   {"family": "Vu", "given": "Minh"},

&nbsp;   {"family": "Bhattarai", "given": "Manish"}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2025]]},

&nbsp; "DOI": "10.48550/arXiv.2505.11741",

&nbsp; "URL": "https://arxiv.org/abs/2505.11741",

&nbsp; "note": "BLUF: Hallucination detection for VLMs improves by aggregating the \*\*first ~10 token logits\*\* (MTRE) rather than only the first token; SOTA AUROC gains on safety/math/geometry benchmarks. Citable points: (1) Multi‑token reliability beats single‑token P(True)/linear probes; (2) Early‑sequence divergence signals unreliable generations. Anchor\_phrases: hallucination detection; early token logits; AUROC; reliability estimation. Avoid: factuality in text‑only LLMs unless multi‑token signal is relevant. Example: 'We assess VLM reliability via multi‑token aggregation \[@zollicoffer\_diverging\_2025].'"

}

{

&nbsp; "id": "zollicoffer\_lorid\_2025",

&nbsp; "type": "paper-conference",

&nbsp; "title": "LoRID: Low-Rank Iterative Diffusion for Adversarial Purification",

&nbsp; "shortTitle": "LoRID",

&nbsp; "author": \[

&nbsp;   {"family": "Zollicoffer", "given": "Geigh"},

&nbsp;   {"family": "Vu", "given": "Minh N."},

&nbsp;   {"family": "Nebgen", "given": "Ben"},

&nbsp;   {"family": "Castorena", "given": "Juan"},

&nbsp;   {"family": "Alexandrov", "given": "Boian"},

&nbsp;   {"family": "Bhattarai", "given": "Manish"}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2025]]},

&nbsp; "container-title": "Proceedings of the AAAI Conference on Artificial Intelligence, 39(21), 23081–23089",

&nbsp; "DOI": "10.1609/aaai.v39i21.34472",

&nbsp; "URL": "https://arxiv.org/abs/2409.08255",

&nbsp; "note": "BLUF: Information‑theoretic analysis of diffusion‑based adversarial purification; proposes \*\*multi‑stage early‑step denoise + Tucker low‑rank factorization\*\* to reduce purification error, SOTA robustness on CIFAR‑10/100/CelebA‑HQ/ImageNet. Citable points: (1) Low‑rank iterative purification improves robustness; (2) Early‑step multi‑pass denoising mitigates over/under‑purification. Anchor\_phrases: adversarial inputs; diffusion purification; low‑rank/Tucker. Avoid: general adversarial training. Example: 'We purify VLM inputs via low‑rank iterative diffusion \[@zollicoffer\_lorid\_2025].'"

}

{

&nbsp; "id": "smith\_always\_2021",

&nbsp; "type": "paper-conference",

&nbsp; "title": "Always Be Dreaming: A New Approach for Data-Free Class-Incremental Learning",

&nbsp; "shortTitle": "Always",

&nbsp; "author": \[

&nbsp;   {"family": "Smith", "given": "James"},

&nbsp;   {"family": "Hsu", "given": "Yen-Chang"},

&nbsp;   {"family": "Balloch", "given": "Jonathan"},

&nbsp;   {"family": "Shen", "given": "Yilin"},

&nbsp;   {"family": "Jin", "given": "Hongxia"},

&nbsp;   {"family": "Kira", "given": "Zsolt"}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2021]]},

&nbsp; "container-title": "Proceedings of ICCV 2021",

&nbsp; "DOI": "10.1109/ICCV48922.2021.00924",

&nbsp; "URL": "https://openaccess.thecvf.com/content/ICCV2021/html/Smith\_Always\_Be\_Dreaming\_A\_New\_Approach\_for\_Data-Free\_Class-Incremental\_Learning\_ICCV\_2021\_paper.html",

&nbsp; "note": "BLUF: Data‑free class‑incremental learning with a new distillation strategy; up to \*\*25.1%\*\* absolute accuracy gain over DeepInversion baselines. Citable points: (1) How to incrementally learn without storing past data; (2) Feature‑distillation + linear‑head fine‑tuning. Anchor\_phrases: data‑free incremental; knowledge distillation; no stored replay. Avoid: claims about RL transfer. Example: 'We discuss data‑free incremental learning via targeted distillation \[@smith\_always\_2021].'"

}

{

&nbsp; "id": "smith\_memory\_2021",

&nbsp; "type": "paper-conference",

&nbsp; "title": "Memory-Efficient Semi-Supervised Continual Learning: The World is its Own Replay Buffer",

&nbsp; "shortTitle": "Memory",

&nbsp; "author": \[

&nbsp;   {"family": "Smith", "given": "James"},

&nbsp;   {"family": "Balloch", "given": "Jonathan"},

&nbsp;   {"family": "Hsu", "given": "Yen-Chang"},

&nbsp;   {"family": "Kira", "given": "Zsolt"}

&nbsp; ],

&nbsp; "issued": {"date-parts": \[\[2021]]},

&nbsp; "container-title": "International Joint Conference on Neural Networks (IJCNN) 2021",

&nbsp; "DOI": "10.48550/arXiv.2101.09536",

&nbsp; "URL": "https://arxiv.org/abs/2101.09536",

&nbsp; "note": "BLUF: Semi‑supervised continual learning with DistillMatch leverages \*\*unlabeled in‑environment data\*\*; +8.7% to +54.5% avg task accuracy vs SOTA and better memory efficiency (e.g., 0.23 vs 0.08 stored images per processed unlabeled image). Citable points: (1) Use ambient data streams as 'replay'; (2) Practical memory/sensitivity trade‑offs. Anchor\_phrases: semi‑supervised continual; unlabeled environment data; replay buffer from the world. Avoid: LLM‑only claims unless about continual updates. Example: 'We treat logs/transcripts as a replay source \[@smith\_memory\_2021].'"

}

```



---



\## 3) How these papers connect to \*\*AI/LLMs in open‑ended language wargames\*\* (what to look for)



\* \*\*Narrative coherence \& adjudication\*\* — Use FEI for an \*objective\* coherence signal for generated free‑Kriegsspiel narratives or adjudication rationales (reader‑agreement entropy as a metric of coherence for story/world facts). (\[ACL Anthology]\[1])

\* \*\*Goal‑backward story generation\*\* — When you describe backward reasoning to reach a pre‑stated endstate (a victory condition or consequence), cite the QA‑driven \*backwards\* generator (EDGAR) that improved coherence in human studies. (\[arXiv]\[2])

\* \*\*Non‑stationary rules (“house rules”)\*\* — For rule changes, cite the novelty ontology (NovGrid) and KG‑based rule modeling/detection/adaptation (Peng et al.). These map directly to wargame adjudication when rules mutate.\&#x20;

\* \*\*World models for rapid adaptation\*\* — If you propose a world‑model loop for wargame engines, cite WorldCloner (symbolic rule mismatches for detection + imagination‑based updates) and Zollicoffer et al. (KL‑bound novelty signals in world models). (\[arXiv]\[3])

\* \*\*Exploration settings for transfer\*\* — For experimental choices about exploration in open‑world scenarios (e.g., scouting for rule changes or shortcuts), cite the 2024 study showing \*\*explicit diversity/stochasticity\*\* help online transfer and the 2022 taxonomy that motivates transfer‑specific exploration. (\[arXiv]\[4])

\* \*\*Reliability/hallucination in VLM adjudication\*\* — When you monitor VLM rationales (maps, counters, orders), cite multi‑token reliability (MTRE) for hallucination detection. (\[arXiv]\[5])

\* \*\*Safety/purification for image inputs\*\* — If your pipeline filters map screenshots or game images before a VLM sees them, LoRID is the right pointer. (\[arXiv]\[6])

\* \*\*Continual learning without data hoarding\*\* — For policies about not storing sensitive play logs, cite data‑free and semi‑supervised continual learning to justify safe incremental updates from ambient data. (\[CVF Open Access]\[7])



---



\### Notes on sources (for your records)



\* \*\*FEI (coherence metrics)\*\*: ACL Anthology page with DOI and full PDF confirm EWC/ETC definitions and validation on corrupted vs original stories. (\[ACL Anthology]\[1])

\* \*\*Automated Story Generation as QA (EDGAR)\*\*: arXiv paper shows \\~15% coherence gain and uses FEI‑style reader entropy in evaluation. (\[arXiv]\[2])

\* \*\*NovGrid (novelty ontology \& metrics)\*\*: arXiv PDF defines novelty classes and evaluation metrics.\&#x20;

\* \*\*WorldCloner (neuro‑symbolic)\*\*: arXiv PDF details rule‑mismatch detection and imagination‑based adaptation; ACM DOI confirms publication metadata. (\[arXiv]\[3])

\* \*\*KG rules for house rules\*\*: arXiv PDF with explicit knowledge‑graph rule modeling and look‑ahead.\&#x20;

\* \*\*Exploration for transfer (empirical)\*\*: arXiv HTML summarises key findings (diversity/stochasticity; time‑dependent harms). (\[arXiv]\[4])

\* \*\*Exploration taxonomy for transfer (conceptual)\*\*: arXiv PDF motivates transfer‑specific exploration needs.\&#x20;

\* \*\*World‑model novelty detection (KL bound)\*\*: arXiv HTML explains predicted‑vs‑observed divergence scoring and cross‑benchmark results. (\[arXiv]\[8])

\* \*\*VLM hallucination detection (multi‑token)\*\*: arXiv page provides MTRE concept and reported AUROC gains. (\[arXiv]\[5])

\* \*\*LoRID purification\*\*: arXiv \& AAAI metadata confirm method and publication; PDF shows Tucker low‑rank detail. (\[arXiv]\[6])

\* \*\*Data‑free CIL (25.1% gain)\*\*: ICCV paper PDF states the improvement and method. (\[CVF Open Access]\[7])

\* \*\*SSCL (world as replay buffer)\*\*: arXiv abstract details +8.7% to +54.5% gains and memory efficiency numbers. (\[arXiv]\[9])



---



\### What to do next



1\. Save the JSONL block as `context\_pack.jsonl`.

2\. Give the agent the prompt (Section 1) and the context pack.

3\. Have it output its \*\*suggested insertions\*\* in JSONL—then you can accept/reject and apply diffs in your Typst files.



If you’d like, I can also generate a first pass of the suggestions against a specific repo snapshot once you share the files.



\[1]: https://aclanthology.org/2021.nuse-1.9/ "Fabula Entropy Indexing: Objective Measures of Story Coherence - ACL Anthology"

\[2]: https://arxiv.org/abs/2112.03808 "\[2112.03808] Automated Story Generation as Question-Answering"

\[3]: https://arxiv.org/pdf/2301.06294 "Neuro-Symbolic World Models for Adapting to Open World Novelty"

\[4]: https://arxiv.org/html/2404.02235v1 "Is Exploration All You Need? Effective Exploration Characteristics for Transfer in Reinforcement Learning"

\[5]: https://arxiv.org/abs/2505.11741 "\[2505.11741] Diverging Towards Hallucination: Detection of Failures in Vision-Language Models via Multi-token Aggregation"

\[6]: https://arxiv.org/pdf/2409.08255?utm\_source=chatgpt.com "arXiv:2409.08255v1 \[cs.LG] 12 Sep 2024"

\[7]: https://openaccess.thecvf.com/content/ICCV2021/papers/Smith\_Always\_Be\_Dreaming\_A\_New\_Approach\_for\_Data-Free\_Class-Incremental\_Learning\_ICCV\_2021\_paper.pdf "Always Be Dreaming: A New Approach for Data-Free Class-Incremental Learning"

\[8]: https://arxiv.org/html/2310.08731v4 "Novelty Detection in Reinforcement Learning with World Models"

\[9]: https://arxiv.org/abs/2101.09536 "\[2101.09536] Memory-Efficient Semi-Supervised Continual Learning: The World is its Own Replay Buffer"



