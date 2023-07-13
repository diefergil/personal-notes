---
tags:
  - Mlops
  - Devops
  - AWS
  - Microservices
  - App Runner
---
# AWS App Runner

App Runner is a fully managed service that makes it easy for developers to
 quickly build, deploy, and run containerized applications. It was announced by
  AWS (Amazon Web Services) in May 2021.

Amazon App Runner is designed to simplify the process of deploying applications
 in containers, making it easier for developers to focus on writing code rather
  than managing infrastructure. The service automatically handles all the
   operational aspects like building and running containers, scaling up or down
    based on traffic, and monitoring application health.

This guide will walk you through the process of deploying a containerized
 FastAPI application using AWS App Runner.

## Deploy A FastApi app in App Runner

### Prerequisites

* An AWS account.
* Docker installed on your machine.
* A FastAPI application to deploy.

### Step 1: Containerizing your FastAPI Application

Once you have your [Fastapi](../../python/apis/fastapi.md) app builded, in this
 example we are going to use a simple summatory function:

```python
# main.py
from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get('/')
async def root():
    return {'message': 'Hello Duke'}

@app.get('/add/{num1}/{num2}')
async def add(num1: int, num2: int):
    '''Add two numbers together'''

    total = num1 + num2
    return {'total': total}

if __name__ == '__main__':
    uvicorn.run(app, port=8080, host='0.0.0.0')
```

You can curl your app in local doing:

```bash
curl http:/0.0.0.0:8080/add/2/2
```

You'll need to create a Dockerfile in the root directory of your FastAPI
 application. This file will instruct Docker on how to build a container for
  your app.

Here's a simple Dockerfile for a FastAPI app:

```docker
FROM public.ecr.aws/lambda/python:3.8 # (1)

RUN mkdir -p /app
COPY . main.py /app/
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 8080
CMD [ 'main.py' ]
ENTRYPOINT [ 'python', 'main.py' ]
```

1. The container that you need to run app runner.

Then, build the Docker image with the following command:

```bash
docker build -t your-image-name .
```

### Step 2: Push your Docker Image to Amazon ECR

AWS App Runner needs to pull your Docker image from a registry. We'll use
 Amazon's Elastic Container Registry (ECR).

First, create a new repository in ECR:

```bash
aws ecr create-repository --repository-name your-repo-name
```

Next, authenticate Docker to your ECR registry:

```bash
aws ecr get-login-password --region your-region | docker login --username AWS
--password-stdin your-ecr-url
```

Then, tag your image with the ECR repository:

```bash
docker tag your-image-name:latest your-ecr-url/your-repo-name:latest
```

Finally, push your image to ECR:

```bash
docker push your-ecr-url/your-repo-name:latest
```

### Step 3: Deploy your FastAPI App using AWS App Runner

Navigate to the AWS App Runner console and follow these steps:

1. Click 'Create an App Runner service'.
2. Select 'Source' as 'Container registry'.
3. Enter the ECR image URI from the previous step.
4. Configure the build settings and deployment settings as per your requirements.
5. Click 'Create and Deploy'.

You should now have your FastAPI application running on AWS App Runner!

## Conclusion

AWS App Runner is a powerful service for deploying containerized applications.
 With it, you can focus more on developing your FastAPI applications and less
  on managing infrastructure.

## References

* [Fastapi](../../python/apis/fastapi.md)
