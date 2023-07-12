# Hugginface

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

# Resources

* [Fine tuning hugginface model](https://github.com/nogibjj/hugging-face-cli-with-codespaces)
