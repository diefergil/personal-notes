# NLP: Natural Language Processing

NLP stands for "natural language processing" and forms the bridge between human
 communication and computer logic.

Typical NLP tasks and applications include:

* Speech recognition
* Text classification
* Machine translation
* Text summarization
* Question answering
* Chatbots

Some of the major challenges in NLP are the complexity, nuance, and ambiguity of
 natural language, as well as the difficulty of acquiring clean and labeled text
  data.

NLP reveals structure and meaning from human language to computers and its
importance has grown in the modern age.

Language is complex, nuanced, and ambiguous, making it challenging for computers
 to process language data.

Data can have misspellings, unconventional words, and biases that can be difficult
 and expensive for humans to label.

## Tokenization

Tokenization transform text to useful representation that a computer can understand.

### Tokenization Steps

#### Normalization

cleans text for consistency by removing complexity.

breaks the text into smaller "words" and will be the base of what tokens will be.

More normalization can reduces complexity in the text. But can lose context.

#### Pretokenization

breaks the text into smaller "words" and will be the base of what tokens will be.

#### Tokenization step

Breaks text into smaller parts called "tokens" to create meaningful building blocks.

Methods:

    * Character tokenization: Smaller vocabulary. Less meanningful representations.
    * Word tokenization: Bigger vocabulary. More tokens are out of vocabulary.
    (If the word was never in the training data, then we might no have a
    meaningful way to represent that word as a token)
    * Subword Tokenization. Hybrid and most used in LLM. Frequent words in the
     dataset aren't split, however rarer words are broken down.
        * quickly -> [quick] + [ly]
        * quicker -> [quick] + [er]
        * quickest -> [quick] + [est]
    This method is learned with a particular focus of text data, resulting in deferent
    representations.
    Therefore, if your're using a pre-trained model for your NLP task, make sure
     to use the same tokenizer that the model was trained on.

    Subword tokennization algorithms:
        * [BPE](https://en.wikipedia.org/wiki/Byte_pair_encoding) (GPT and RoBERTa).
        * [WordPiece](
            https://blog.research.google/2021/12/a-fast-wordpiece-tokenization-system.html
            ) (BERT and Electra)
        * [SentencePiece](https://github.com/google/sentencepiece) (T5, ALBERT
         and XLNET)

#### Postprocessing

Applies additional transformations, such as adding tags at the beginning and end
 of sentences.

 ```bash
 [CLS] do you pre fer cof fee or t ea ? [EOS]
```

You can learn about hugginface tokenizers [here](../tutorials/hugging-face-tokenizer.ipynb).
