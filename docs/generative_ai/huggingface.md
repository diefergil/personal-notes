# Hugginface

## Hugginface CLI

Hugging Face, primarily known for its advancements in natural language
 processing, offers a robust Command Line Interface (CLI) that streamlines the
  usage of its models and datasets. This guide provides a comprehensive
   overview of installing the Hugging Face CLI and creating a project, drawing
    parallels to GitHub's functionality. [Link](https://huggingface.co/docs/huggingface_hub/quick-start)

### CLI Installation

To begin, ensure you have Python installed on your system. Hugging Face CLI
 requires Python 3.6 or later.

Step 1: Install the Hugging Face Hub

Use pip to install the Hugging Face Hub:

```bash
pip install huggingface_hub
```

Step 2: Verify Installation
Confirm the installation by checking the version:

```bash
huggingface-cli --version
```

###  Creating a Project

Similar to GitHub, Hugging Face allows users to create and manage projects.
 Here's how you can create a new project.

Step 1: Log In
First, log in to your Hugging Face account via the CLI:

```bash
huggingface-cli login
```

Enter your Hugging Face credentials when prompted.

Step 2: Create a New Repository
To create a new repository, use:

```bash
huggingface-cli repo create your-repo-name
```

Replace your-repo-name with the desired name for your repository.

Step 3: Clone the Repository
Clone your newly created repository:

```bash
git clone <https://huggingface.co/username/your-repo-name>
```

Replace username with your Hugging Face username and your-repo-name with the
 repository name.

## 🤗 Transformers

Load State-of-the-art Machine Learning models for PyTorch, TensorFlow, and JAX
dynamically.

🤗 Transformers provides APIs and tools to easily download and train state-of-the-art
 pretrained models. Using pretrained models can reduce your compute costs, carbon
  footprint, and save you the time and resources required to train a model from
  scratch. These models support common tasks in different modalities, such as:

📝 _Natural Language Processing_: text classification, named entity recognition,
 question answering, language modeling, summarization, translation, multiple
 choice, and text generation.
🖼️ _Computer Vision_: image classification, object detection, and segmentation.
🗣️ _Audio_: automatic speech recognition and audio classification.
🐙 _Multimodal_: table question answering, optical character recognition, information
 extraction from scanned documents, video classification, and visual question answering.

🤗 Transformers support framework interoperability between PyTorch, TensorFlow,
and JAX. This provides the flexibility to use a different framework at each stage
 of a model’s life; train a model in three lines of code in one framework, and
 load it for inference in another. Models can also be exported to a format like
 ONNX and TorchScript for deployment in production environments.

## Install Hugginface tansformers

[Installation](https://huggingface.co/docs/transformers/installation)

=== "Normal instalation"

    ```bash
    pip install transformers
    ```

=== "pytorch"

    ```bash
    pip install 'transformers[torch]'
    ```

=== "tensorflow"

    ```bash
    pip install 'transformers[tf-cpu]'
    ```

## Pipeline

## [Datasets](https://huggingface.co/docs/datasets/index)

🤗 Datasets is a library for easily accessing and sharing datasets for Audio,
Computer Vision, and Natural Language Processing (NLP) tasks.

Load a dataset in a single line of code, and use our powerful data processing
methods to quickly get your dataset ready for training in a deep learning model.
Backed by the Apache Arrow format, process large datasets with zero-copy reads
without any memory constraints for optimal speed and efficiency. We also feature
 a deep integration with the Hugging Face Hub, allowing you to easily load and
  share a dataset with the wider machine learning community.

Find your dataset today on the [Hugging Face Hub](https://huggingface.co/datasets),
 and take an in-depth look inside of it with the live viewer.

### Example of a dataset generator class

The GeneratorBasedBuilder class in the datasets library (often used with
 Hugging Face's datasets module) is designed to create and manage datasets for
  machine learning tasks, particularly in natural language processing. The
   example demonstrates how to create a custom dataset class
    WineRatings using this framework. Here's an overview of what the class does:

Class Definition: WineRatings is a subclass of GeneratorBasedBuilder, meaning
 it inherits functionalities for generating and processing datasets.

Metadata: The class includes metadata such as _CITATION,_DESCRIPTION,
 _HOMEPAGE, and_LICENSE, which provide information about the dataset, its
  source, and usage terms.

Dataset Version: VERSION is defined to keep track of different versions of the
 dataset. This is useful for maintaining consistency and reproducibility in experiments.

Dataset Information (_info method): This method defines the structure of the
 dataset, specifying features like "name", "region", "variety", "rating", and
  "notes". Each of these features is assigned a data type (e.g., string, float).

Dataset Splits (_split_generators method): This method is used to define how
 the dataset is split into different sets, typically "train", "validation", and
  "test". It also specifies the file paths for each split.

Data Generation (_generate_examples method): This method is crucial for
 processing the data. It reads from the specified CSV files and yields
  individual examples. Each example is a dictionary with keys corresponding to
   the features defined in _info. The method iterates over the dataset,
    converting each row of the CSV file into the structured format required by
     the datasets library.

In summary, the WineRatings class defines how to structure, split, and process
 a dataset about wine ratings. It's a template for creating a custom dataset
  that can be easily integrated with tools and models in the Hugging Face
   ecosystem. This kind of setup is particularly useful for training and
    evaluating machine learning models, as it standardizes data handling and
     makes it easier to work with various datasets.

```python
'''A wine-ratings dataset'''

import csv

import datasets


_CITATION = """\
@InProceedings{huggingface:dataset,
title = {A wine ratings dataset from regions around the world},
author={Alfredo Deza
},
year={2022}
}
"""

_DESCRIPTION = """\
This is a dataset for wines in various regions around the world with names,
 regions, ratings and descriptions
"""

_HOMEPAGE = "https://github.com/paiml/wine-ratings"

_LICENSE = "MIT"

class WineRatings(datasets.GeneratorBasedBuilder):

    VERSION = datasets.Version("0.0.1")

    def _info(self):
        features = datasets.Features(
            {
                "name": datasets.Value("string"),
                "region": datasets.Value("string"),
                "variety": datasets.Value("string"),
                "rating": datasets.Value("float"),
                "notes": datasets.Value("string"),
            }
        )
        return datasets.DatasetInfo(
            description=_DESCRIPTION,
            features=features,
            homepage=_HOMEPAGE,
            license=_LICENSE,
            citation=_CITATION,
        )

    def _split_generators(self, dl_manager):

        return [
            datasets.SplitGenerator(
                name=datasets.Split.TRAIN,
                gen_kwargs={
                    "filepath": "train.csv",
                    "split": "train",
                },
            ),
            datasets.SplitGenerator(
                name=datasets.Split.VALIDATION,
                gen_kwargs={
                    "filepath": "validation.csv",
                    "split": "validation",
                },
            ),
            datasets.SplitGenerator(
                name=datasets.Split.TEST,
                gen_kwargs={
                    "filepath": "test.csv",
                    "split": "test"
                },
            ),
        ]

    # method parameters are unpacked from `gen_kwargs` as given in `_split_generators`
    def _generate_examples(self, filepath, split):
        with open(filepath, encoding="utf-8") as f:
            csv_reader = csv.reader(f, delimiter=",")
            next(csv_reader)
            for id_, row in enumerate(csv_reader):
                yield id_, {
                    "name": row[0],
                    "region": row[1],
                    "variety": row[2],
                    "rating": row[3],
                    "notes": row[4],
                }
```

[Here](https://huggingface.co/datasets/cais/mmlu/blob/main/mmlu.py) there is
 another example.

With this class you can deal with data without uploading to hugginface like for
 example [here](https://huggingface.co/datasets/blimp/tree/6c2b0d452a8e2dc0bd53522a9872961a053d7130)

### Installation

```bash
pip install datasets
```

### Load datasets

```python
from datasets import load_dataset, list_datasets

available = list_datasets()

# load the dataset dynamically
movie_rationales = load_dataset('movie_rationales)

# the object is a dict-like mapping of actual datasets
train = movie_rationales['train]
df = train.to_pandas()
```

## Key Components

### Tokenizers

 These work like a translator, converting the words we use into smaller parts
  and creating a secret code that computers can understand and work with.

HuggingFace tokenizers help us break down text into smaller, manageable pieces
 called tokens. These tokenizers are easy to use and also remarkably fast due to
  their use of the Rust programming language.

Hugging Face provides pretrained tokenizers through its flexible API as part of
 the `transformers`` Python library.

You can:

    * Use a tokenizer off the shelf. (Don't need to modify it at all).
    * Fine tuning with your own data.
    * Train your tokenizer from scratch.

#### Encoding text

To tokenize text with Hugging Face, instantiate a tokenizer object with the
 `AutoTokenizer.from_pretrained`` method. Pass in the name of the model as a
 string value.

```python
# 'bert-base-cased' can be replaced with a different model as needed
my_tokenizer = AutoTokenizer.from_pretrained('bert-base-cased')
```

Then you can use the tokenizer object to generate either string tokens or integer
 ID tokens.

To generate string tokens, including special tokens:

```python
tokens = my_tokenizer(raw_text).tokens()
```

To generate integer ID tokens you can use the `.encode` method on raw text,
or the `.convert_tokens_to_ids` method on string tokens.

```python
# Option for raw text
token_ids = my_tokenizer.encode(raw_text)
# Option for string tokens
token_ids = my_tokenizer.convert_tokens_to_ids(tokens)
```

#### Decoding text

Integer ID tokens can be converted back to text using the `.decode` method:

```python
decoded_text = my_tokenizer.decode(token_ids)
```

##### Unknown tokens

Pretrained tokenizers have a predetermined vocabulary. If a token is not in the
tokenizer's vocabulary, it will be lost in the encoding + decoding process. In
this example, unknown tokens were replaced with `[UNK]`, but this behavior will
vary depending on the tokenizer.

#### Documentation

* [Hugging Face's PreTrainedTokenizer](https://huggingface.co/docs/transformers/main_classes/tokenizer)
* [Hugging Face's AutoTokenizer](https://huggingface.co/docs/transformers/main_classes/tokenizer)

#### Tutorial

* [Tokenizer intro](./tutorials/hugging-face-tokenizer.ipynb)

### Models

 These are like the brain for computers, allowing them to learn and make
 decisions based on information they've been fed.

### Datasets

 Think of datasets as textbooks for computer models. They are collections of
  information that models study to learn and improve.

### Trainers

 Trainers are the coaches for computer models. They help these models get better
 at their tasks by practicing and providing guidance. HuggingFace Trainers implement
  the PyTorch training loop for you, so you can focus instead on other aspects
  of working on the model.

# Resources

* [Fine tuning hugginface model](https://github.com/nogibjj/hugging-face-cli-with-codespaces)
* [MLops codespace template](https://github.com/nogibjj/mlops-template) ->
   Create a github codespace with some utilities around cuda and hugginface.
* [Example Notebooks](https://github.com/huggingface/transformers/tree/main/notebooks)
* [Train Bert for classification](https://github.com/kaushaltrivedi/bert-toxic-comments-multilabel?tab=readme-ov-file)
