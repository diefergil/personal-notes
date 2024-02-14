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
