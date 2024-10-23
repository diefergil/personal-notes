---
Area: "[[Generative AI]]"
tags:
  - resource
---
# Evaluating LLMS

## Metrics

### ROUGE

ROUGE (Recall-Oriented Understudy for Gisting Evaluation) is primarily used
for text summarization. It compares a summary to one or more human-generated
reference summaries.

### BLEU

BLEU (BiLingual Evaluation Understudy) is primarily used for machine
translation. It compares a translation to human-generation translations.
The score is computed using the average precision over multiple n-gram sizes. It
is similar to the ROUGE score but is calculated over a range of n-gram sizes
and then averaged.

## Benchmark

Benchmarks matter because they are the standards that help us measure and
accelerate progress in AI. They offer a common ground for comparing
different AI models and encouraging innovation, providing important
stepping stones on the path to more advanced AI technologies.

### GLUE

The GLUE benchmarks serve as an essential tool to assess an AI's grasp of
human language, covering diverse tasks, from grammar checking to complex
sentence relationship analysis. By putting AI models through these varied
linguistic challenges, we can gauge their readiness for real-world tasks
and uncover any potential weaknesses.

* **Short Name**: CoLA
    * **Full Name**: Corpus of Linguistic Acceptability
    * **Description**: Measures the ability to determine if an English
     sentence is linguistically acceptable.

* **Short Name**: SST-2
    * **Full Name**: Stanford Sentiment Treebank
    * **Description**: Consists of sentences from movie reviews and human
     annotations about their sentiment.

* **Short Name**: MRPC
    * **Full Name**: Microsoft Research Paraphrase Corpus
    * **Description**: Focuses on identifying whether two sentences are
    paraphrases of each other.

* **Short Name**: STS-B
    * **Full Name**: Semantic Textual Similarity Benchmark
    * **Description**: Involves determining how similar two sentences are
     in terms of semantic content.

* **Short Name**: QQP
    * **Full Name**: Quora Question Pairs
    * **Description**: Aims to identify whether two questions asked on
     Quora are semantically equivalent.

* **Short Name**: MNLI
    * **Full Name**: Multi-Genre Natural Language Inference
    * **Description**: Consists of sentence pairs labeled for textual
     entailment across multiple genres of text.

* **Short Name**: QNLI
    * **Full Name**: Question Natural Language Inference
    * **Description**: Involves determining whether the content of a
     paragraph contains the answer to a question.

* **Short Name**: RTE
    * **Full Name**: Recognizing Textual Entailment
    * **Description**: Requires understanding whether one sentence entails another.

* **Short Name**: WNLI
    * **Full Name**: Winograd Natural Language Inference
    * **Description**: Tests a system's reading comprehension by having it
     determine the correct referent of a pronoun in a sentence, where
     understanding depends on contextual information provided by specific
      words or phrases.

### SuperGLUE

SuperGlue is designed as a successor to the original GLUE benchmark. It's
a more advanced benchmark aimed at presenting even more challenging
language understanding tasks for AI models. Created to push the boundaries
of what AI can understand and process in natural language, SuperGlue
emerged as models began to achieve human parity on the GLUE benchmark. It
also features a public leaderboard, facilitating the direct comparison of
models and enabling the tracking of progress over time.

* **Short Name**: BoolQ
    * **Full Name**: Boolean Questions
    * **Description**: Involves answering a yes/no question based on a short passage.

* **Short Name**: CB
    * **Full Name**: CommitmentBank
    * **Description**: Tests understanding of entailment and contradiction
    in a three-sentence format.

* **Short Name**: COPA
    * **Full Name**: Choice of Plausible Alternatives
    * **Description**: Measures causal reasoning by asking for the cause
    effect of a given sentence.

* **Short Name**: MultiRC
    * **Full Name**: Multi-Sentence Reading Comprehension
    * **Description**: Involves answering questions about a paragraph
     where each question may have multiple correct answers.

* **Short Name**: ReCoRD
    * **Full Name**: Reading Comprehension with Commonsense Reasoning
    * **Description**: Requires selecting the correct named entity from a
     passage to fill in the blank of a question.

* **Short Name**: RTE
    * **Full Name**: Recognizing Textual Entailment
    * **Description**: Involves identifying whether a sentence entails,
     contradicts, or is neutral towards another sentence.

* **Short Name**: WiC
    * **Full Name**: Words in Context
    * **Description**: Tests understanding of word sense disambiguation in
     different contexts.

* **Short Name**: WSC
    * **Full Name**: Winograd Schema Challenge
    * **Description**: Focuses on resolving coreference resolution within
     a sentence, often requiring commonsense reasoning.

* **Short Name**: AX-b
    * **Full Name**: Broad Coverage Diagnostic
    * **Description**: A diagnostic set to evaluate model performance on a
     broad range of linguistic phenomena.

* **Short Name**: AX-g
    * **Full Name**: Winogender Schema Diagnostics
    * **Description**: Tests for the presence of gender bias in automated
     coreference resolution systems.

### Others

* MMLU
* BIG-Bench
* HELM
