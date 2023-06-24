---
tags:
  - Development
  - Application Programming Interface
---

#  API Best Practices with FastAPI in Python

Building APIs is a common task for backend developers, and they serve as the
backbone of many modern web and mobile applications. However, designing and
building an API can be a complex process, and it's important to follow best
practices to ensure the resulting API is robust, reliable, and easy to use.
This article presents API best practices with specific examples using FastAPI,
a modern, fast (high-performance), web framework for building APIs with Python 3.6+
based on standard Python type hints.

##  1. Design First, Code Later

It's important to have a clear plan before starting to code your API. This means
having a detailed specification of your API, including the routes, methods,
parameters, and expected responses. You can create such a specification using
the OpenAPI standard, which FastAPI supports out of the box.

```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/items/{item_id}")
async def read_item(item_id: int):
    return {"item_id": item_id}
```

In the above example, the OpenAPI schema is automatically generated and can be
accessed at the `/docs` endpoint.

##  2. Consistent and RESTful Routing

Make sure your API routes are consistent and follow RESTful principles. This means
using the correct HTTP methods (GET, POST, PUT, DELETE, etc.) and having meaningful,
predictable URLs. FastAPI makes it easy to define these with Python decorators.

```python
@app.get("/users/{user_id}")
async def read_user(user_id: int):
    # code to get user

@app.post("/users/")
async def create_user(user: User):
    # code to create user
```

| HTTP Method | Description | Idempotent | Safe |
| --- | --- | --- | --- |
| GET | Retrieves the current state of a resource. Read Only | Yes | Yes |
| POST | Creates a new resource. Write Only | No | No |
| PUT | Replaces the current state of a resource with a new state. Update existing | Yes | No |
| PATCH | Applies partial modifications to a resource. | No | No |
| DELETE | Deletes a resource. | Yes | No |
| HEAD | Similar to GET but only retrieves the headers of a response. DOes it exist? | Yes | Yes |
| OPTIONS | Returns the HTTP methods that the server supports for the specified URL. | Yes | Yes |

* _Idempotent_ means that multiple identical requests should have the same effect
   as a single request.
* _Safe_ means that the method only retrieves data and does not modify it.

##  3. Use Request Validation

FastAPI supports request validation using Pydantic models, which allow you to define
the expected shape of the data using Python type hints. This can significantly
reduce the amount of boilerplate validation code you need to write.

```python
from pydantic import BaseModel

class Item(BaseModel):
    name: str
    description: str
    price: float
    tax: float = None

@app.post("/items/")
async def create_item(item: Item):
    # code to create item
```

In this example, FastAPI will automatically validate that the incoming request data
matches the `Item` model, and if it doesn't, it will return a helpful error message.

##  4. Error Handling

You should anticipate and handle errors gracefully in your API. FastAPI provides
the HTTPException class which you can raise to return a specific HTTP status
code and message.

```python
from fastapi import HTTPException

@app.get("/items/{item_id}")
async def read_item(item_id: int):
    item = get_item(item_id)
    if not item:
        raise HTTPException(status_code=404, detail="Item not found")
    return item
```

| Error Type            | HTTP Status Code | Description                                                                                                                         |
| --------------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Bad Request           | 400              | The server could not understand the request due to invalid syntax.                                                                  |
| Unauthorized          | 401              | The client must authenticate itself to get the requested response.                                                                  |
| Forbidden             | 403              | The client does not have access rights to the content; that is, it is unauthorized, so server is rejecting to give proper response. |
| Not Found             | 404              | The server can not find the requested resource.                                                                                     |
| Method Not Allowed    | 405              | The method specified in the request is not allowed for the resource identified by the request URI.                                  |
| Conflict              | 409              | This response is sent when a request conflicts with the current state of the server.                                                |
| Internal Server Error | 500              | The server has encountered a situation it doesn't know how to handle.                                                               |
| Service Unavailable   | 503              | The server is not ready to handle the request. Common causes are a server that is down for maintenance or that is overloaded.       |

##  5. Rate Limiting

Protect your API from abuse and overuse by implementing rate limiting. While FastAPI doesn't have built-in support for rate limiting, you can use third-party libraries such as SlowApi.

##  6. Use Asynchronous Code

FastAPI supports asynchronous request handling using Python's async and await
keywords. This can improve the performance of your API by allowing it to handle
other requests while waiting for IO-bound tasks (like database queries) to
complete.

```python
@app.get("/items/")
async def read_items():
    items = await get_all_items()  # an async function that gets all items from the database
    return items
```

##  7. Logging and Monitoring

An essential aspect of maintaining and troubleshooting APIs is having robust logging
and monitoring in place. Here are some best practices for logging and monitoring
in FastAPI:

1.  Use the standard library logging module: The logging module is a built-in Python
    library that provides a flexible and powerful way to log messages from your
    application. FastAPI has built-in support for the logging module, so you can easily
    integrate it into your application​1​.

    ```python
    import logging

    logger = logging.getLogger(__name__)

    @app.post("/items/")
    async def create_item(item: Item):
        logger.info(f"Creating item: {item.name}")
        # code to create item
    ```

2.  Avoid using print() to log messages: print() does not provide the same level
    of control and flexibility as other logging methods. Instead, use FastAPI’s
    built-in logger for more control over how messages are logged, including setting
    log levels, adding contextual information, and formatting logs for easier readability​1​.

3.  Log as much information as possible: By logging detailed information, such as
    the request URL, query parameters, headers, body, response status code, and more,
    developers can easily pinpoint where an issue occurred and what caused it.
    Use structured loggers to log data in a consistent format that can be easily
    parsed by other tools​1​.

4.  Log exceptions: Logging exceptions allows developers to quickly identify and
    debug errors in their applications. By logging exceptions, developers can
    easily pinpoint where an issue occurred and what caused it. To log exceptions
    with FastAPI, use a library like Python’s built-in logging module​1​.

5.  Add context to your logs: Adding context to your logs helps you quickly identify
    the source of an issue. By adding contextual information such as request and
    response data, user IDs, or other relevant details, you can easily pinpoint
    where the issue originated from​1​.

6.  Use a structured logger: Structured logging is a way of formatting log messages
    so that they are easier to read and parse. FastAPI provides built-in support
    for structured logging via its Logging middleware​1​.

7.  Configure your logger for production: Configuring your logger for production
    ensures that the right information is being logged at the right time. This
    includes setting up log levels so that only important messages are recorded,
    and configuring the format of the logs so they are easy to read and interpret.
    Additionally, ensure that sensitive data is not included in the logs, and
    that access to the logs is restricted to authorized personnel​1​.

8.  Use an external service to store and analyze logs: Using an external service
    to store logs is beneficial because it allows for more efficient log
    management. Additionally, these services typically offer a range of features
    such as real-time monitoring, alerting, and reporting capabilities​1​.
