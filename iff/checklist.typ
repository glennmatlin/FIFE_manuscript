#import "@preview/bloated-neurips:0.7.0": url

#let TODO = text(fill: red, [*[TODO]*])
#let answerNA = text(fill: gray, "[NA]")
#let answerNo = text(fill: red, "[NO]")
#let answerYes = text(fill: blue, "[YES]")

#pagebreak(weak: true)

#set heading(numbering: none)

= NeurIPS Paper Checklist

#let claim(
  name: [], question: [], answer: [], justification: [], guidelines: [],
) = {
  set list(indent: 1em, tight: false)
  show list: set block(spacing: 10pt)
  set block(spacing: 5.8pt)
  [
    *#name*

    Question: #question

    Answer: #answer

    Justification: #justification

    Guidelines:

    #guidelines
  ]
}

+ #claim(
  name: [Claims],
  question: [
    Do the main claims made in the abstract and introduction accurately reflect
    the paper's contributions and scope?],
  answer: answerYes,
  justification: [The abstract and introduction claim to introduce a new benchmark, `IFF`, for financial instruction following, present a large-scale evaluation of modern LMs, and release the associated code and data. These contributions are described in detail in the Methodology section and the results are presented in the Results section. The appendix provides further details on the models, framework, and dataset.],
  guidelines: [
  - The answer NA means that the abstract and introduction do not include the
    claims made in the paper.

  - The abstract and/or introduction should clearly state the claims made,
    including the contributions made in the paper and important assumptions and
    limitations. A No or NA answer to this question will not be perceived well
    by the reviewers.

  - The claims made should match theoretical and experimental results, and
    reflect how much the results can be expected to generalize to other settings.

  - It is fine to include aspirational goals as motivation as long as it is
    clear that these goals are not attained by the paper.
  ])

+ #claim(
  name: [Limitations],
  question: [
    Does the paper discuss the limitations of the work performed by the
    authors?
  ],
  answer: answerYes,
  justification: [The paper includes a dedicated "Limitations" section. We discuss that our evaluation relies on a single response sample per model, which may not fully account for stochastic model outputs, and note that this was due to the high API costs of generating multiple responses.],
  guidelines: [
    - The answer NA means that the paper has no limitation while the answer No
      means that the paper has limitations, but those are not discussed in the
      paper.

    - The authors are encouraged to create a separate "Limitations" section in
      their paper.

    - The paper should point out any strong assumptions and how robust the
      results are to violations of these assumptions (e.g., independence
      assumptions, noiseless settings, model well-specification, asymptotic
      approximations only holding locally). The authors should reflect on how
      these assumptions might be violated in practice and what the implications
      would be.

    - The authors should reflect on the scope of the claims made, e.g., if the
      approach was only tested on a few datasets or with a few runs. In
      general, empirical results often depend on implicit assumptions, which
      should be articulated.

    - The authors should reflect on the factors that influence the performance
      of the approach. For example, a facial recognition algorithm may perform
      poorly when image resolution is low or images are taken in low lighting.
      Or a speech-to-text system might not be used reliably to provide closed
      captions for online lectures because it fails to handle technical jargon.

    - The authors should discuss the computational efficiency of the proposed
      algorithms and how they scale with dataset size.

    - If applicable, the authors should discuss possible limitations of their
      approach to address problems of privacy and fairness.

    - While the authors might fear that complete honesty about limitations
      might be used by reviewers as grounds for rejection, a worse outcome
      might be that reviewers discover limitations that aren't acknowledged in
      the paper. The authors should use their best judgment and recognize that
      individual actions in favor of transparency play an important role in
      developing norms that preserve the integrity of the community. Reviewers
      will be specifically instructed to not penalize honesty concerning
      limitations.
  ])

+ #claim(
  name: [Theory Assumptions and Proofs],
  question: [
    For each theoretical result, does the paper provide the full set of
    assumptions and a complete (and correct) proof?
  ],
  answer: answerNA,
  justification: [This paper introduces a new benchmark and reports empirical findings. It does not include any theoretical results, theorems, or proofs.],
  guidelines: [
    - The answer NA means that the paper does not include theoretical results.

    - All the theorems, formulas, and proofs in the paper should be numbered
      and cross-referenced.

    - All assumptions should be clearly stated or referenced in the statement
      of any theorems.

    - The proofs can either appear in the main paper or the supplemental
      material, but if they appear in the supplemental material, the authors
      are encouraged to provide a short proof sketch to provide intuition.

    - Inversely, any informal proof provided in the core of the paper should be
      complemented by formal proofs provided in appendix or supplemental
      material.

    - Theorems and Lemmas that the proof relies upon should be properly
      referenced.
  ])

+ #claim(
  name: [Experimental Result Reproducibility],
  question: [
    Does the paper fully disclose all the information needed to reproduce the
    main experimental results of the paper to the extent that it affects the
    main claims and/or conclusions of the paper (regardless of whether the code
    and data are provided or not)?
  ],
  answer: answerYes,
  justification: [We provide detailed descriptions of our evaluation methodology, including the "strict" and "loose" accuracy metrics. The appendix contains the full list of models evaluated and their hyperparameters, a description of the evaluation framework, and representative examples from our benchmark dataset to ensure our results can be reproduced.],
  guidelines: [
    - The answer NA means that the paper does not include experiments.

    - If the paper includes experiments, a No answer to this question will not
      be perceived well by the reviewers: Making the paper reproducible is
      important, regardless of whether the code and data are provided or not.

    - If the contribution is a dataset and/or model, the authors should
      describe the steps taken to make their results reproducible or verifiable.

    - Depending on the contribution, reproducibility can be accomplished in
      various ways. For example, if the contribution is a novel architecture,
      describing the architecture fully might suffice, or if the contribution
      is a specific model and empirical evaluation, it may be necessary to
      either make it possible for others to replicate the model with the same
      dataset, or provide access to the model. In general. releasing code and
      data is often one good way to accomplish this, but reproducibility can
      also be provided via detailed instructions for how to replicate the
      results, access to a hosted model (e.g., in the case of a large language
      model), releasing of a model checkpoint, or other means that are
      appropriate to the research performed.

    - While NeurIPS does not require releasing code, the conference does
      require all submissions to provide some reasonable avenue for
      reproducibility, which may depend on the nature of the contribution. For
      example

      #set enum(numbering: "(a)")

      + If the contribution is primarily a new algorithm, the paper should make
        it clear how to reproduce that algorithm.
      + If the contribution is primarily a new model architecture, the paper
        should describe the architecture clearly and fully.
      + If the contribution is a new model (e.g., a large language model), then
        there should either be a way to access this model for reproducing the
        results or a way to reproduce the model (e.g., with an open-source
        dataset or instructions for how to construct the dataset).
      + We recognize that reproducibility may be tricky in some cases, in which
        case authors are welcome to describe the particular way they provide
        for reproducibility. In the case of closed-source models, it may be
        that access to the model is limited in some way (e.g., to registered
        users), but it should be possible for other researchers to have some
        path to reproducing or verifying the results.
  ])

+ #claim(
  name: [Open access to data and code],
  question: [
    Does the paper provide open access to the data and code, with sufficient
    instructions to faithfully reproduce the main experimental results, as
    described in supplemental material?
  ],
  answer: answerYes,
  justification: [Yes, we are releasing the complete benchmark, including all prompts, instructions, and evaluation code, under an open-source license. For the review process, we provide an anonymized link to the repository. The public URL will be included in the final camera-ready version of the paper.],
  guidelines: [
    - The answer NA means that paper does not include experiments requiring
      code.

    - Please see the NeurIPS code and data submission guidelines
      (#url("https://nips.cc/public/guides/CodeSubmissionPolicy")) for more
      details.

    - While we encourage the release of code and data, we understand that this
      might not be possible, so "No" is an acceptable answer. Papers cannot be
      rejected simply for not including code, unless this is central to the
      contribution (e.g., for a new open-source benchmark).

    - The instructions should contain the exact command and environment needed
      to run to reproduce the results. See the NeurIPS code and data submission
      guidelines (#url("https://nips.cc/public/guides/CodeSubmissionPolicy"))
      for more details.

    - The authors should provide instructions on data access and preparation,
      including how to access the raw data, preprocessed data, intermediate
      data, and generated data, etc.

    - The authors should provide scripts to reproduce all experimental results
      for the new proposed method and baselines. If only a subset of
      experiments are reproducible, they should state which ones are omitted
      from the script and why.

    - At submission time, to preserve anonymity, the authors should release
      anonymized versions (if applicable).

    - Providing as much information as possible in supplemental material
      (appended to the paper) is recommended, but including URLs to data and
      code is permitted.
  ])


+ #claim(
  name: [Experimental Setting/Details],
  question: [
    Does the paper specify all the training and test details (e.g., data
    splits, hyperparameters, how they were chosen, type of optimizer, etc.)
    necessary to understand the results?
  ],
  answer: answerYes,
  justification: [Our study evaluates existing models in a zero-shot setting, so no training was performed. We provide all relevant testing details in the appendix, which includes a table of the models used and the specific inference hyperparameters (e.g., temperature, max tokens) for each one.],
  guidelines: [
    - The answer NA means that the paper does not include experiments.

    - The experimental setting should be presented in the core of the paper to
      a level of detail that is necessary to appreciate the results and make
      sense of them.

    - The full details can be provided either with the code, in appendix, or as
      supplemental material.
  ])

+ #claim(
  name: [Experiment Statistical Significance],
  question: [
    Does the paper report error bars suitably and correctly defined or other
    appropriate information about the statistical significance of the
    experiments?
  ],
  answer: answerNo,
  justification: [We report the exact accuracy scores for each model on our benchmark based on a single run. We do not report error bars or conduct statistical significance tests, as our current evaluation is based on a single response generated for each prompt. This is noted as a limitation in our paper.],
  guidelines: [
    - The answer NA means that the paper does not include experiments.

    - The authors should answer "Yes" if the results are accompanied by error
      bars, confidence intervals, or statistical significance tests, at least
      for the experiments that support the main claims of the paper.

    - The factors of variability that the error bars are capturing should be
      clearly stated (for example, train/test split, initialization, random
      drawing of some parameter, or overall run with given experimental
      conditions).

    - The method for calculating the error bars should be explained (closed
      form formula, call to a library function, bootstrap, etc.)

    - The assumptions made should be given (e.g., Normally distributed errors).

    - It should be clear whether the error bar is the standard deviation or the
      standard error of the mean.

    - It is OK to report 1-sigma error bars, but one should state it. The
      authors should preferably report a 2-sigma error bar than state that they
      have a 96% CI, if the hypothesis of Normality of errors is not verified.

    - For asymmetric distributions, the authors should be careful not to show
      in tables or figures symmetric error bars that would yield results that
      are out of range (e.g. negative error rates).

    - If error bars are reported in tables or plots, The authors should explain
      in the text how they were calculated and reference the corresponding
      figures or tables in the text.
  ])

+ #claim(
  name: [Experiments Compute Resources],
  question: [
    For each experiment, does the paper provide sufficient information on the
    computer resources (type of compute workers, memory, time of execution)
    needed to reproduce the experiments?
  ],
  answer: answerNo,
  justification: [We do not provide a detailed breakdown of the compute resources used to run our evaluation framework. The majority of the models evaluated were accessed via third-party APIs, meaning the computational load for model inference was handled externally. For the self-hosted open-source models, the required resources are specified in their respective documentation.],
  guidelines: [
    - The answer NA means that the paper does not include experiments.

    - The paper should indicate the type of compute workers CPU or GPU,
      internal cluster, or cloud provider, including relevant memory and storage.

    - The paper should provide the amount of compute required for each of the
      individual experimental runs as well as estimate the total compute.

    - The paper should disclose whether the full research project required more
      compute than the experiments reported in the paper (e.g., preliminary or
      failed experiments that didn't make it into the paper).
  ])

+ #claim(
  name: [Code Of Ethics],
  question: [
    Does the research conducted in the paper conform, in every respect, with
    the NeurIPS Code of Ethics
    #url("https://neurips.cc/public/EthicsGuidelines")
  ],
  answer: answerYes,
  justification: [We have reviewed the NeurIPS Code of Ethics and confirm our research is in full compliance. The benchmark dataset was authored by the research team and does not contain any real-world, sensitive, or personally identifiable information. Our work does not involve human subjects.],
  guidelines: [
    - The answer NA means that the authors have not reviewed the NeurIPS Code
      of Ethics.

    - If the authors answer No, they should explain the special circumstances
      that require a deviation from the Code of Ethics.

    - The authors should make sure to preserve anonymity (e.g., if there is a
      special consideration due to laws or regulations in their jurisdiction).
  ])

+ #claim(
  name: [Broader Impacts],
  question: [
    Does the paper discuss both potential positive societal impacts and
    negative societal impacts of the work performed?
  ],
  answer: answerNo,
  justification: [Our paper focuses on the positive impact of improving model reliability in finance. While we acknowledge the risks of instruction-following failures, we do not include a detailed discussion of potential negative societal impacts or malicious uses of more capable models. Our work is foundational, intended to improve evaluation rather than deploy a new application.],
  guidelines: [
    - The answer NA means that there is no societal impact of the work
      performed.

    - If the authors answer NA or No, they should explain why their work has no
      societal impact or why the paper does not address societal impact.

    - Examples of negative societal impacts include potential malicious or
      unintended uses (e.g., disinformation, generating fake profiles,
      surveillance), fairness considerations (e.g., deployment of technologies
      that could make decisions that unfairly impact specific groups), privacy
      considerations, and security considerations.

    - The conference expects that many papers will be foundational research and
      not tied to particular applications, let alone deployments. However, if
      there is a direct path to any negative applications, the authors should
      point it out. For example, it is legitimate to point out that an
      improvement in the quality of generative models could be used to generate
      deepfakes for disinformation. On the other hand, it is not needed to
      point out that a generic algorithm for optimizing neural networks could
      enable people to train models that generate Deepfakes faster.

    - The authors should consider possible harms that could arise when the
      technology is being used as intended and functioning correctly, harms
      that could arise when the technology is being used as intended but gives
      incorrect results, and harms following from (intentional or
      unintentional) misuse of the technology.

    - If there are negative societal impacts, the authors could also discuss
      possible mitigation strategies (e.g., gated release of models, providing
      defenses in addition to attacks, mechanisms for monitoring misuse,
      mechanisms to monitor how a system learns from feedback over time,
      improving the efficiency and accessibility of ML).
  ])

+ #claim(
  name: [Safeguards],
  question: [
    Does the paper describe safeguards that have been put in place for
    responsible release of data or models that have a high risk for misuse
    (e.g., pretrained language models, image generators, or scraped datasets)?
  ],
  answer: answerNA,
  justification: [This question is not applicable. Our paper introduces a benchmark dataset of synthetic prompts and evaluation code, not a new generative model or a scraped dataset. The prompts are authored by the research team and do not contain sensitive or private information, posing a low risk of misuse.],
  guidelines: [
    - The answer NA means that the paper poses no such risks.

    - Released models that have a high risk for misuse or dual-use should be
      released with necessary safeguards to allow for controlled use of the
      model, for example by requiring that users adhere to usage guidelines or
      restrictions to access the model or implementing safety filters.

    - Datasets that have been scraped from the Internet could pose safety
      risks. The authors should describe how they avoided releasing unsafe
      images.

    - We recognize that providing effective safeguards is challenging, and many
      papers do not require this, but we encourage authors to take this into
      account and make a best faith effort.
  ])

+ #claim(
  name: [Licenses for existing assets],
  question: [
    Are the creators or original owners of assets (e.g., code, data, models),
    used in the paper, properly credited and are the license and terms of use
    explicitly mentioned and properly respected?
  ],
  answer: answerNo,
  justification: [We credit the creators of the models we evaluate by citing their original research papers. However, we do not explicitly state the license or terms of use for each model in the paper itself. The models used are all well-known and their licensing information is publicly available.],
  guidelines: [
    - The answer NA means that the paper does not use existing assets.

    - The authors should cite the original paper that produced the code package
      or dataset.

    - The authors should state which version of the asset is used and, if
      possible, include a URL.

    - The name of the license (e.g., CC-BY 4.0) should be included for each
      asset.

    - For scraped data from a particular source (e.g., website), the copyright
      and terms of service of that source should be provided.

    - If assets are released, the license, copyright information, and terms of
      use in the package should be provided. For popular datasets,
      #url("https://paperswithcode.com/datasets") has curated licenses for some
      datasets. Their licensing guide can help determine the license of a
      dataset.

    - For existing datasets that are re-packaged, both the original license and
      the license of the derived asset (if it has changed) should be provided.

    - If this information is not available online, the authors are encouraged
      to reach out to the asset's creators.
  ])

+ #claim(
  name: [New Assets],
  question: [
    Are new assets introduced in the paper well documented and is the
    documentation provided alongside the assets?
  ],
  answer: answerYes,
  justification: [Yes, the new asset (`IFF` benchmark) is documented throughout the paper. We detail its design principles and content in the Methodology section. The appendix provides further details on the framework architecture, and we include a README file with usage instructions in the public code repository.],
  guidelines: [
    - The answer NA means that the paper does not release new assets.

    - Researchers should communicate the details of the dataset/code/model as
      part of their submissions via structured templates. This includes details
      about training, license, limitations, etc.

    - The paper should discuss whether and how consent was obtained from people
      whose asset is used.

    - At submission time, remember to anonymize your assets (if applicable).
      You can either create an anonymized URL or include an anonymized zip file.
  ])

+ #claim(
  name: [Crowdsourcing and Research with Human Subjects],
  question: [
    For crowdsourcing experiments and research with human subjects, does the
    paper include the full text of instructions given to participants and
    screenshots, if applicable, as well as details about compensation (if any)?
  ],
  answer: answerNA,
  justification: [Not applicable. Our paper does not involve crowdsourcing or research with human subjects. The benchmark prompts were created by the authors of the paper.],
  guidelines: [
    - The answer NA means that the paper does not involve crowdsourcing nor
      research with human subjects.

    - Including this information in the supplemental material is fine, but if
      the main contribution of the paper involves human subjects, then as much
      detail as possible should be included in the main paper.

    - According to the NeurIPS Code of Ethics, workers involved in data
      collection, curation, or other labor should be paid at least the minimum
      wage in the country of the data collector.
  ])

+ #claim(
  name: [
    Institutional Review Board (IRB) Approvals or Equivalent for Research with
    Human Subjects
  ],
  question: [
    Does the paper describe potential risks incurred by study participants,
    whether such risks were disclosed to the subjects, and whether
    Institutional Review Board (IRB) approvals (or an equivalent
    approval/review based on the requirements of your country or institution)
    were obtained?
  ],
  answer: answerNA,
  justification: [Not applicable. As our research did not involve human subjects, Institutional Review Board (IRB) approval was not required.],
  guidelines: [
    - The answer NA means that the paper does not involve crowdsourcing nor
      research with human subjects.

    - Depending on the country in which research is conducted, IRB approval (or
      equivalent) may be required for any human subjects research. If you
      obtained IRB approval, you should clearly state this in the paper.

    - We recognize that the procedures for this may vary significantly between
      institutions and locations, and we expect authors to adhere to the
      NeurIPS Code of Ethics and the guidelines for their institution.

    - For initial submissions, do not include any information that would break
      anonymity (if applicable), such as the institution conducting the review.
  ])