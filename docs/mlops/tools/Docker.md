# Dockerizing a Python Application

This guide will walk you through the process of dockerizing a simple Python
 application.

## Prerequisites

* Docker installed on your machine.
* Basic knowledge of Python.

## Step 1: Create a Python Application

First, let's create a simple Python application that we want to dockerize.
 Let's call it `app.py`.

```python
def main():
    print('Hello, Docker')

if __name__ == '__main__':
    main()
```

This application simply prints out 'Hello, Docker!' when run.

## Step 2: Create a Dockerfile

A Dockerfile is a script that contains collections of commands and instructions
 to create a Docker image.

In the same directory as your `app.py`, create a file named `Dockerfile` with
the following content:

```Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Run app.py when the container launches
CMD ['python', 'app.py']
```

This Dockerfile starts with a Python 3.9 base image, sets the working directory
 to /app, copies the current directory into the container, and finally runs the
  `app.py` script.

## Step 3: Build the Docker Image

Now, you can build the Docker image from the Dockerfile. Run the following
 command in the same directory as your Dockerfile:

```bash
docker build -t python-docker-demo .
```

This tells Docker to build an image from the Dockerfile and tag it with the
 name `python-docker-demo`.

## Step 4: Run the Docker Container

After the Docker image is built, you can run the Docker container with the
 following command:

```bash
docker run python-docker-demo
```

You should see 'Hello, Docker!' printed to your console.

## Conclusion

Congratulations! You have just dockerized a Python application. Docker allows
 you to package your applications with all of their dependencies into a
  standardized unit for software development, making your applications more
   reliable and easier to share and deploy.
