---
tags:
  - Development
  - Application Programming Interface
---
# Flask

Flask is a web framework for Python, it's lightweight and easy to understand.

## Setup

First, we need to install Flask. We can do this with pip:

```shell
pip install flask
```

## You first Flask application

Here's a basic Flask application:

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run()
```

Here's what this code does:

* `from flask import Flask` imports the Flask module.
* `app = Flask(__name__)` creates an instance of the Flask class for our application.
* `@app.route('/')` is a decorator that tells Flask what URL should trigger the
  function that follows.
* `def hello_world():` defines a function that returns the string 'Hello, World!'
* `if __name__ == '__main__': app.run()` runs the application on the local
  development server.

To run the application, save the above code in a file called app.py, then run
 python app.py from your terminal. You should see output indicating that the
 server is running, and you can visit <http://localhost:5000> in your web browser
  to view your application.

## Run flask api

You can now run your Flask app by using the following command in your terminal:

```shell
python app.py
```

Then, open your web browser and navigate to `http://127.0.0.1:5000/`. You should
see the text 'Hello, World!' displayed.

## Add more routes

Flask allows you to add more decorators to create more routes. Here's how you can
 create a new route:

```python
@app.route('/about')
def about():
    return 'About Page'
```

Now, if you navigate to `http://127.0.0.1:5000/about`, you will see the text
'About Page'.

## Script example

```python
from flask import Flask, abort

app = Flask(__name__)

@app.route('/') # / equals to the root of the website
def hello_world():
    return 'Hello, World!'

@app.route('/error')
def error():
    abort(500, 'oooh some error!')

if __name__ == '__main__':
    app.run(debug=True, port=8000, host='0.0.0.0')
```

## LLM model with flask (RoBERTa)

```python
from flask import Flask, request, jsonify
import torch
import numpy as np
from transformers import RobertaTokenizer
import onnxruntime


app = Flask(__name__)
tokenizer = RobertaTokenizer.from_pretrained('roberta-base')
session = onnxruntime.InferenceSession('roberta-sequence-classification-9.onnx')


def to_numpy(tensor):
    return (
        tensor.detach().cpu().numpy() if tensor.requires_grad else tensor.cpu().numpy()
    )


@app.route('/')
def home():
    return '<h2>RoBERTa sentiment analysis</h2>'


@app.route('/predict', methods=['POST'])
def predict():
    input_ids = torch.tensor(
        tokenizer.encode(request.json[0], add_special_tokens=True)
    ).unsqueeze(
        0
    )

    inputs = {session.get_inputs()[0].name: to_numpy(input_ids)}
    out = session.run(None, inputs)

    result = np.argmax(out)

    return jsonify({'positive': bool(result)})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
```

* `roberta-sequence-classification-9.onnx` The model was donwloaded.

## Send a post

```bash
curl -X POST --header 'Content-Type: application/json'\
    --data '['using curl is not to my liking']'\
    http:/127.0.0.1:5000/predict
```
