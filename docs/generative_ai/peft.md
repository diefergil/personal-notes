# Introduction

Full-fine tuning of large language LLMs is challenging. Fine-tuning requires
storing training weights, optimizer states, gradients, forward activations and
temporary memory. Things to store other than the weights can take up to 12-20
times more memory than the weights themselves.
In full fine-tuning, every weight of the model is updated during training.
PEFT methods only update a subset of the weights. They involve freezing most
of the layers in the model and allowing only a small number of layers to be
trained. Other methods don’t change the weights at all and instead, add new
layers to the model and train only those layers.
Due to this, the number of trainable weights is much smaller than the number
of weights in the original LLM. This reduces the overall memory requirement for
training, so much so that PEFT can often be performed on a single GPU.
Since most of the LLM is left unchanged, PEFT is also less prone to Catastrophic
Forgetting.

# PEFT Methods in General

## Selective

We select a subset of initial LLM parameters to fine-tune.
There are several approaches to select which subset of parameters we want to
fine-tune. We can decide to train:

* Only certain components of the model.
* Specific layers of the model.
* Individual parameter types

The performance of these approaches and the selective method overall is mixed.
There are significant trade-offs in parameter efficiency and compute efficiency
and hence, these methods are not very popular.

## Reparameterization

The model weights are reparameterized using a low-rank representation.
Example techniques are Low Rank Adaptation (LoRA). More detail in its page:
[Link](./lora.md)

## Additive

There are generally two methods:

* Adapters - New trainable layers are added to the model, typically inside
the encoder or decoder blocks, after the FFNN or the attention layers.
* Prompt Tuning - The model architecture is kept fixed and instead, the
input (prompt) is manipulated to obtain better performance. This can
be done by adding trainable parameters to the prompt embeddings, or
keeping the input fixed and retraining the embedding weights. Example
techniques include Soft Prompts.

## Soft Prompts

Prompt tuning is not prompt engineering.
Prompt engineering involves modifying the language of the prompt in order
to “urge” the model to generate the completion that we want. This could be as
simple as trying different words, phrases or including examples for In-Context
Learning (ICL). The goal is to help the model understand the nature of the task
and to generate better completions.
This involves some limitations:

* We require a lot of manual effort to write and try different prompts.
* We are also limited by the length of the context window.

Prompt tuning adds trainable “soft prompts” to inputs that are learnt during
the supervised fine-tuning process.
The set of trainable tokens is called a soft prompt. It is prepended to the
embedding vectors that represent the input prompt. The soft prompt vectors
have the same length as the embeddings. Generally, 20-100 “virtual tokens” can
be sufficient for good performance.

Prompt tuning does not involve updating the model. Instead, the model is
completely frozen and only the soft prompt embedding vectors are updated to
optimize the performance of the model on the original prompt.
This is very efficient since a very small number of parameters are being trained
(10, 000 to 100, 000).

## Hugging Face PEFT Library

### Key Concepts

    1. Hugging Face PEFT allows you to fine-tune a model without having to fine-tune
    all of its parameters.

    2. Training a model using Hugging Face PEFT requires two additional steps beyond
    traditional fine-tuning:

Creating a PEFT config
Converting the model into a PEFT model using the PEFT config
Inference using a PEFT model is almost identical to inference using a non-PEFT
 model. The only difference is that it must be loaded as a PEFT model.

### Training with PEFT

The PEFT config specifies the adapter configuration for your parameter-efficient
 fine-tuning process. The base class for this is a `PeftConfig`, but this example
  will use a `LoraConfig`, the subclass used for low rank adaptation (LoRA).

A LoRA config can be instantiated like this:

```python
from peft import LoraConfig
config = LoraConfig()
```

Look at the LoRA adapter documentation for additional hyperparameters that can
be specified by passing arguments to `LoraConfig()`. [The Hugging Face LoRA
conceptual guide](https://huggingface.co/docs/peft/main/en/conceptual_guides/lora)
 also contains additional explanations.

See te complete example [here](./lora.md)
