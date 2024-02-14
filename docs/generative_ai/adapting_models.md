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

* [Prompting](./prompting.md)
* [Probing](./probing.md): Using probing to train a classifier is a
 powerful approach to
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

# Resources

* [Create a sentiment classifier with Bert](https://www.kaggle.com/code/diegofndz/create-a-bert-sentiment-classifier)
