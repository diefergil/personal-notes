---
tags:
  - resource
Area: "[[Generative AI]]"
---
# Reinforcement Learning From Human Feedback (RLHF)

Reinforcement Learning From Human Feedback (RLHF) is a technique used to
fine-tune LLMs with human feedback. It uses reinforcement learning to fine-tune
the LLM with human feedback data, resulting in a model that is better aligned
with human preferences.

## Using Reinforcement Learning To Align LLMs

When we apply RL to fine-tune LLMs, we have the following scenario:

* Agent: The LLM.
* Objective: Generate human-aligned text.
* Environment: Context window of the model (the space in which text
can be entered via a prompt).
* State: At any moment, the current state is the current contents of the
context window.
* Action space: The token vocabulary since each action is the act of
generating tokens.

![RLHF](rlhf.png)

Each action can be generating a single word, a sentence or a longer-form text
depending on the task we are fine-tuning for. At any given moment, the action
that the model will take, meaning which token it will choose next, depends on
the prompt text in the context window and the probability distribution over the
vocabulary space.

## Reward System

The reward is assigned based on how closely the generated completions align
with human preferences.

An example reward system is as follows:

* We can have a human evaluate all of the completions of the model against
some alignment metric, such as toxicity.
* The feedback can be represented as a scalar value, either a zero (not toxic)
or one (toxic).
* The LLM weights are then updated iteratively to maximize the reward
obtained from the human classifier (obtain as many zeros as possible),
enabling the model to generated non-toxic completions.
This reward system requires obtaining manual human feedback, which can be
time consuming and expensive.

### Reward Model

A practical and scalable alternative is to use an additional model, called the
reward model, to classify the outputs of the LLM and evaluate the degree of
alignment with human preferences.

To obtain the reward model, we use a smaller number of human examples to train
the reward model using traditional supervised learning since it’s a classification
problem.
This trained reward model will be used to assess the output of the LLM and
assign a reward a value, which in turn gets used to update the weights of the
LLM and train a new human-aligned version.
Exactly how the weights are updated as the model completions are assessed
depends on the (reinforcement learning) algorithm used to optimize the RL
policy
