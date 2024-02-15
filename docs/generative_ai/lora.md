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

#### Creating a PEFT Config

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

#### Converting a Transformers Model into a PEFT Model

Once you have a PEFT config object, you can load a Hugging Face transformers
 model as a PEFT model by first loading the pre-trained model as usual (here we
 load GPT-2):

```python
from transformers import AutoModelForCausalLM
model = AutoModelForCausalLM.from_pretrained("gpt2")
```

Then using `get_peft_model()` to get a trainable PEFT model (using the LoRA
config instantiated previously):

```python
from peft import get_peft_model
lora_model = get_peft_model(model, config)
```

#### Training with a PEFT Model

After calling `get_peft_model()`, you can then use the resulting `lora_model`
 in a training process of your choice (PyTorch training loop or Hugging Face `Trainer`).

#### Checking Trainable Parameters of a PEFT Model

A helpful way to check the number of trainable parameters with the current config
 is the `print_trainable_parameters()` method:

```python
lora_model.print_trainable_parameters()
```

Which prints an output like this:

```bash
trainable params: 294,912 || all params: 124,734,720 || trainable%: 0.23643136409814364
```

#### Saving a Trained PEFT Model

Once a PEFT model has been trained, the standard Hugging Face `save_pretrained()`
 method can be used to save the weights locally. For example:

```python
lora_model.save_pretrained("gpt-lora")
```

Note that this only saves the adapter weights and not the weights of the original
 Transformers model. Thus the size of the files created will be much smaller than
  you might expect.

### Inference with PEFT

Because you have only saved the adapter weights and not the full model weights,
 you can't use `from_pretrained()` with the regular Transformers class (e.g.,
  `AutoModelForCausalLM`). Instead, you need to use the PEFT version (e.g.,
   `AutoPeftModelForCausalLM`). For example:

```python
from peft import AutoPeftModelForCausalLM
lora_model = AutoPeftModelForCausalLM.from_pretrained("gpt-lora")
```

After completing this step, you can proceed to use the model for inference.

### Generating Text from a PEFT Model

You may see examples from regular Transformer models where the input IDs are
 passed in as a positional argument (e.g., `model.generate(input_ids)`). For a
 PEFT model, they must be passed in as a keyword argument (e.g., `model.generate
 (input_ids=input_ids`)). For example:

```python
from transformers import AutoTokenizer

tokenizer = AutoTokenizer.from_pretrained("gpt2")
inputs = tokenizer("Hello, my name is ", return_tensors="pt")
outputs = model.generate(input_ids=inputs["input_ids"], max_new_tokens=10)
print(tokenizer.batch_decode(outputs))
```

## Resources

* [Lora intro](https://huggingface.co/docs/peft/main/en/conceptual_guides/lora)
* [Hugging Face PEFT configuration](https://huggingface.co/docs/peft/package_reference/config)
* [Hugging Face LoRA adapter](https://huggingface.co/docs/peft/package_reference/lora)
* [Hugging Face Models save_pretrained](https://huggingface.co/docs/transformers/main/en/main_classes/model#transformers.PreTrainedModel.save_pretrained)
* [Hugging Face Text Generation](https://huggingface.co/docs/transformers/main_classes/text_generation)
