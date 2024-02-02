# Introduction

LoRA is a PEFT technique based on reparameterization.
The encoder and decoder blocks of a Transformer consist of self-attention (in
the form of Multi-Headed Attention) layers. Weights are applied to the input
embedding vectors to obtain an attention map for the input prompt.
In full fine-tuning, every weight in these layers is updated. In LoRA:

* All the model parameters are frozen.
* Two (smaller) rank decomposition matrices A and B are injected with
the original weights. The dimensions of the matrices are such that their
product has the same dimension as that of the original weight matrices.
* The weights in the smaller matrices are trained via fine-tuning.
For inference:

* We multiply the two low rank matrices to obtain B × A, which has the
same dimensions as the frozen weights of the model.
* We add B × A to the original frozen weights.
* The model weights are replaced with these new weights.

We now have a fine-tuned model which can carry out the task(s) we have finetuned
it for. Since the model has the same number of parameters as original,
there is little to no impact on inference latency.
Researchers have found that applying LoRA just to the self-attention layers is
often enough to fine-tune for a task and achieve performance gains. However, in
principle, we can use LoRA in other components such as the feed-forward layers.
Since most of the parameters are the model are in the attention layers, we get
the biggest savings when we apply LoRA in those layers.

## Multiple Tasks

LoRA also makes it easy to fine-tune a model for different tasks. We can train
the model using the rank decomposition matrices for each of the tasks. This will
give us a pair of A and B matrices for each task.
During inference, we can swap out the matrices depending on the task we want
the model to do and update the weights (by adding to the frozen weights).

## Choosing The Rank r

In general. The smaller the rank r, the smaller the number of trainable
parameters and the bigger the savings on compute.

According to the LoRA paper:

* Effectiveness of higher rank appears to plateau. That is, after a certain
    rank value, making it larger generally has no effect on performance.
* 4 ≤ r ≤ 32 (in powers of 2) can provide a good trade-off between reducing
    trainable parameters and preserving performance.
* Relationship between rank and dataset size needs more research.
