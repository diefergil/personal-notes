---
tags:
  - Development
  - Application Programming Interface
---
# FastApi

FastAPI is a modern, fast (high-performance), web framework for building APIs with
 Python 3.6+ based on standard Python type hints.

## Installation

To install FastAPI, you'll need a Python version of 3.6 or greater. You can install
 it using pip:

```bash
pip install fastapi
pip install uvicorn
```

## Baseic example

Here's a basic example of a FastAPI application:

```python
from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def read_root():
    return {'Hello': 'World'}
```

You can run the application using Uvicorn:

```bash
uvicorn main:app --reload
```

This command refers to:

* `uvicorn`: Python framework that allows us to run a python application.
* `main`: the file main.py (the Python 'module').
* `app`: the object created inside of main.py with the line app = FastAPI().
* `--reload`: make the server restart after code changes. Only do this for development.

## Path parameters

You can define path parameters by putting them in curly braces {} in the path
 of the
 route decorator:

```python
@app.get('/items/{item_id}')
def read_item(item_id: int):
    return {'item_id': item_id}
```

## Query Parameters

If you want the client to send additional data, but not in the path, you can use
 query parameters:

```python
from typing import Optional

@app.get('/items/')
def read_items(q: Optional[str] = None):
    if q:
        return {'item': q}
    return {'item': 'not found'}
```

In this case, `q` is an optional string query parameter.

##  Request Body

### Type hints

FastAPI automatically recognizes Python type hints in the function parameters:

```python
from pydantic import BaseModel

class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None

@app.post('/items/')
def create_item(item: Item):
    return item
```

In this example, the item body request parameter is declared to be of type Item.

## Example script

```python
from datetime import datetime
from os.path import dirname, abspath, join
from fastapi import FastAPI
from fastapi.responses import FileResponse # for serving files
from fastapi.staticfiles import StaticFiles # for serving static files
from pydantic import BaseModel

current_dir = dirname(abspath(__file__)) # get the path of the current script
static_path = join(current_dir, 'static') 

app = FastAPI()
app.mount('/ui', StaticFiles(directory=static_path), name='ui')

class Body(BaseModel):
    strftime: str


@app.get('/')
def root():
    html_path = join(static_path, 'index.html')
    return FileResponse(html_path)


@app.post('/generate')
def generate(body: Body):
    '''
    Generate the current time given a strftime template. For example:
    '%Y-%m-%dT%H:%M:%S.%f'
    '''
    tmpl = body.strftime or '%Y-%m-%dT%H:%M:%S.%f'
    return {'date': datetime.now().strftime(tmpl)}

@app.post('/azure_cognitive')
def azure_cognitive(body: Body):
    '''
    Put here your code to create an Azure Cognitive service endpoint!
    '''
    return {'result': None} # Change None
```

## Why use uvicorn

Uvicorn is an ASGI (Asynchronous Server Gateway Interface) server that is used to
 run your FastAPI application. The ASGI specification fills in the gap left by the
    traditional WSGI servers used for synchronous Python web applications, and allows
   for greater concurrency and the use of long-lived connections, which are required
    for modern web applications that need to handle things like WebSockets and HTTP/2.

Here are some of the features that Uvicorn provides when used with FastAPI:

* _Performance_: Uvicorn is one of the fastest ASGI servers due to its minimal and
  highly optimized code base. It's built on uvloop and httptools, which are
  themselves very fast asynchronous I/O and HTTP parsing libraries, respectively.

* _Concurrency_: By supporting the ASGI specification, Uvicorn allows FastAPI
applications to handle many connections concurrently. This is great for
applications that need to handle long-lived connections, such as WebSocket
connections, in addition to regular HTTP requests.

* _Hot Reload_: Uvicorn supports hot reloading, which means it can automatically
restart the server whenever it detects changes to your source code. This is
extremely useful during development.

* _WebSockets and HTTP/2 Support_: ASGI servers like Uvicorn can handle long-lived
 connections, such as WebSocket connections, which can be used for real-time
  communication between the server and the client. They also support HTTP/2,
  which can provide performance benefits over HTTP/1.

* _Integration with FastAPI_: FastAPI is built to work seamlessly with Uvicorn and
other ASGI servers. This means you can take full advantage of all the features
provided by FastAPI and ASGI, while still getting the performance benefits of
Uvicorn.
