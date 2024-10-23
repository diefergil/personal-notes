---
tags:
  - resource
Area: "[[Generative AI]]"
---

# Adaptation

Adaptation in AI is a crucial step to enhance the capabilities of
foundation models, allowing them to cater to specific tasks and domains.
This process is about tailoring pre-trained AI systems with new data,
ensuring they perform optimally in specialized applications and respect
privacy constraints. Reaping the benefits of adaptation leads to AI models
that are not only versatile but also more aligned with the unique needs of
organizations and industries.

Adapting foundation models is essential due to their limitations in
specific areas despite their extensive training on large datasets.
Although they excel at many tasks, these models can sometimes misconstrue
questions or lack up-to-date information, which highlights the need for
fine-tuning. By addressing these weaknesses through additional training or
other techniques, the performance of foundation models can be significantly improved.

* #Prompting
* [Probing](./probing.md): Using probing to train a classifier is a powerful approach to
  tailor generative AI foundation models, like BERT, for specific
  applications. By adding a modestly-sized neural network, known as a
  classification head, to a foundation model, one can specialize in
  particular tasks such as sentiment analysis. This technique involves
  freezing the original model's parameters and only adjusting the
  classification head through training with labeled data. Ultimately, this
  process simplifies adapting sophisticated AI systems to our needs,
  providing a practical tool for developing efficient and targeted machine
  learning solutions.

    * Linear Probing: A simple form of probing that involves attaching a
     linear classifier to a pre-trained model to adapt it to a new task
      without modifying the original model.

    * Classification Head: It is the part of a neural network that is
     tailored to classify input data into defined categories.
* Transfer learning
    * Fine Tuning: Fine-tuning is an important phase in enhancing the
    abilities of generative AI models, making them adept at specific tasks.
    By introducing additional data to these powerful models, they can be
    tailored to meet particular requirements, which is invaluable in making
    AI more effective and efficient. Although this process comes with its
    challenges, such as the need for significant computational resources
    and data, the outcome is a more specialized and capable AI system
    that can bring value to a wide range of applications.

    * Fine tuning is a type of transfer learning.
    * Traditional fine tuning consist in update all the weigths of a
     training model. (Need more resource a much more data)

## Adaptation Resources

* [Create a sentiment classifier with Bert](https://www.kaggle.com/code/diegofndz/create-a-bert-sentiment-classifier)

# Prompting

The text that is fed to LLMs as input is called the prompt and the act of
providing the input is called prompting.

## Prompt Design Techniques

Prompt Design Techniques are innovative strategies for tailoring AI
foundation models to specific tasks, fostering better performance in
various domains. These methods enable us to guide the AI's output by
carefully constructing the prompts we provide, enhancing the model's
relevance and efficiency in generating responses.

The process of tweaking the prompt provided to an LLM so that it gives the
best possible result is called prompt engineering. Some common techniques are
given below.

Prompt tuning is a technique in generative AI which allows models to
target specific tasks effectively. By crafting prompts, whether through a
hands-on approach with hard prompts or through an automated process with
soft prompts, we enhance the model's predictive capabilities.

* Prompt: In AI, a prompt is an input given to the model to generate
 specific response or output.

* Prompt Tuning: This is a method to improve AI models by optimizing
prompts so that the model produces better results for specific tasks.

* Hard Prompt: A manually created template used to guide an AI model's
 predictions. It requires human ingenuity to craft effective prompts.

* Soft Prompt: A series of tokens or embeddings optimized through deep
 learning to help guide model predictions, without necessarily making sense to humans.

### In-Context Learning (ICL)

When performing few-shot, one-shot, or zero-shot learning, we can pass
information to the model within the prompt in the form of examples,
descriptions, or other data. When we rely on a model using information
from within the prompt itself instead of relying on what is stored within
its own parameters we are using in-context learning.

As these AI models grow in size, their ability to absorb and use
in-context information significantly improves, showcasing their potential
to adapt to various tasks effectively. The progress in this field is
inspiring, as these advances hint at an exciting future where such models
could be even more intuitive and useful.

In ICL, we add examples of the task we are doing in the prompt. This adds
more context for the model in the prompt, allowing the model to “learn” more
about the task detailed in the prompt.

#### Zero-Shot Inference

Zero-shot prompting is a remarkable technique where a generative AI model
can take on new tasks without the need for specific training examples.
This process leverages the AI's extensive pre-existing knowledge gained
from learning patterns across vast datasets. It empowers the AI to infer
and generalize effectively to provide answers and solutions in contexts
that were not expressly covered during its initial training.

For example, we might be doing semantic classification using our LLM. In that
case, a prompt could be:

```bash
Classify this review: I loved this movie!
Sentiment:
```

This prompt works well with large LLMs but smaller LLMs might fail to follow
the instruction due to their size and fewer number of features. This is also called
zero-shot inference since our prompt has zero examples regarding what the
model is expected to output.

#### Few-Shot Inference

One and few-shot prompting represent cutting-edge techniques that enable
AI to adapt and perform tasks with minimal instructions. Instead of
relying on extensive databases for learning, these methods guide
generative AI through just one or a few examples, streamlining the
learning process and demonstrating its ability to generalize solutions to
new problems. This innovative approach marks a significant advancement in
machine learning, empowering AI to quickly adjust to specialized tasks and
showcasing the incredible potential for efficiency in teaching AI new concepts.

This is where ICL comes into play. By adding examples to the prompt, even a
smaller LLM might be able to follow the instruction and figure out the correct
output. An example of such a prompt is shown below. This is also called
one-shot inference since we are providing a single example in the prompt:

```bash
Classify this review: I loved this movie!
Sentiment: Positive
Classify this review: I don’t like this chair.
Sentiment:
```

Here, we first provide an example to the model and then ask it to figure out the
output for the I don’t like this chair review.
Sometimes, a single example won’t be enough for the model, for example when
the model is even smaller. We’d then add multiple examples in the prompt. This
is called few-shot inference.

In other words:

* Larger models are good at zero-shot inference.
* For smaller models, we might need to add examples to the prompt, for
few-shot inference.

#### Chain-of-Thought Prompting

Chain-of-Thought Prompting is a vital technique for enhancing the
reasoning capabilities of large language models by breaking down complex
problems into intermediate steps that lead to a solution. By providing
models with a line of reasoning, they can more effectively tackle problems
that require more advanced problem-solving processes, enabling them to
deduce information, such as the number of cookies in a box, after
considering all variables.

Example:

```bash
Problem:
A car travels 150 kilometers in the first 3 hours of its journey. For the
next 2 hours, it travels at a speed of 60 kilometers per hour. What is the
average speed of the car for the entire journey?

Answer:
* Step 1: Calculate the Distance Covered in the First Part of the Journey

    * Given: The car travels 150 kilometers in the first 3 hours.
    * Calculation: The distance covered in the first part of the journey is 150 kilometers.

* Step 2: Calculate the Distance Covered in the Second Part of the Journey

    * Given: The car travels at a speed of 60 kilometers per hour for the
     next 2 hours.
    * Calculation: Distance = Speed × Time = 60 km/h × 2 h = 120 kilometers.
    * The distance covered in the second part of the journey is 120 kilometers.

* Step 3: Calculate the Total Distance Covered

    * Total Distance = Distance in the first part + Distance in the second part
    * Calculation: Total Distance = 150 km + 120 km = 270 kilometers.

* Step 4: Calculate the Total Time Taken for the Journey

    * Total Time = Time taken in the first part + Time taken in the second part
    * Calculation: Total Time = 3 hours + 2 hours = 5 hours.

* Step 5: Calculate the Average Speed for the Entire Journey

    * Average Speed = Total Distance / Total Time
    * Calculation: Average Speed = 270 kilometers / 5 hours = 54 kilometers per hour.

* Conclusion

    * The average speed of the car for the entire journey is 54 kilometers per hour.

problem:
A car travels 150 kilometers in the first 5 hours of its journey. For the
next 5 hours, it travels at a speed of 60 kilometers per hour. What is the
average speed of the car for the entire journey?
```

# Build LLM-powered applications

## Chain of thought

At its core, CoT prompting spurs reasoning in LLMs via decomposition. When we
tackle a complicated enough math or logic question, we often can’t help but break
 the larger problem into a series of intermediate steps that help us arrive at a
  final answer.

## Program-aided laguage models

The Program-Aided Language Model (PAL) method uses LLMs to read natural language
problems and generate programs as reasoning steps. The code is executed by a
 interpreter to produce the answer.

## ReAct: Synergizing Reasonning and Actions in LLMs

 ReAct enables LLMs to generate reasoning traces and task-specific actions,
 leveraging the synergy between them. The approach demonstrates superior
 performance over baselines in various tasks, overcoming issues like hallucination
 and error propagation. ReAct outperforms imitation and reinforcement learning
 methods in interactive decision making, even with minimal context examples.
 It not only enhances performance but also improves interpretability,
 trustworthiness, and diagnosability by allowing humans to distinguish between
 internal knowledge and external information.

In summary, ReAct bridges the gap between reasoning and acting in LLMs, yielding
remarkable results across language reasoning and decision making tasks. By
interleaving reasoning traces and actions, ReAct overcomes limitations and
outperforms baselines, not only enhancing model performance but also providing
interpretability and trustworthiness, empowering users to understand the
model's decision-making process.

![ReAct](ReAct.png)

The figure provides a comprehensive visual comparison of different prompting
methods in two distinct domains. The first part of the figure (1a) presents a
comparison of four prompting methods: Standard, Chain-of-thought (CoT, Reason Only),
Act-only, and ReAct (Reason+Act) for solving a HotpotQA question. Each method's
approach is demonstrated through task-solving trajectories generated by the model
(Act, Thought) and the environment (Obs). The second part of the figure (1b)
focuses on a comparison between Act-only and ReAct prompting methods to solve
an AlfWorld game. In both domains, in-context examples are omitted from the prompt,
highlighting the generated trajectories as a result of the model's actions and
thoughts and the observations made in the environment. This visual representation
enables a clear understanding of the differences and advantages offered by the ReAct
paradigm compared to other prompting methods in diverse task-solving scenarios.

[Paper Link](https://arxiv.org/abs/2210.03629)

## Resources

* [Chain-of-thought Prompting Elicits Reasoning in Large Language Models](https://arxiv.org/pdf/2201.11903.pdf)
Paper by researchers at Google exploring how chain-of-thought prompting improves
the ability of LLMs to perform complex reasoning.

* [PAL: Program-aided Language Models](https://arxiv.org/abs/2211.10435): This
paper proposes an approach that uses the LLM to read natural language problems
and generate programs as the intermediate reasoning steps.

* [ReAct](https://arxiv.org/abs/2210.03629): Synergizing Reasoning and Acting
in Language Models: This paper presents an advanced prompting technique that allows
an LLM to make decisions about how to interact with external applications.
