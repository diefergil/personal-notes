# Evaluating LLMS

## Metrics

* ROUGE: ROUGE (Recall-Oriented Understudy for Gisting Evaluation) is primarily used
for text summarization. It compares a summary to one or more human-generated
reference summaries.
* BLEU: BLEU (BiLingual Evaluation Understudy) is primarily used for machine
translation. It compares a translation to human-generation translations.
The score is computed using the average precision over multiple n-gram sizes. It
is similar to the ROUGE score but is calculated over a range of n-gram sizes
and then averaged.

## Benchmark

* GLUE
* SUPERGLUE
* MMLU
* BIG-Bench
* HELM
