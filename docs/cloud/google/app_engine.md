---
tags:
  - Mlops
  - Continuous
  - Integration
  - FastApi
  - Devops
  - Google
  - Cloud
  - Microservices
  - resource
Area: "[[Google cloud]]"
---
# Google App Engine

# Deploy a [[fastapi]] App in Google App engine

This guide will help you deploy a FastAPI application on Google App Engine.

## Prerequisites

* A Google Cloud account
* Google Cloud SDK installed on your machine
* A FastAPI application

## Step 1: Prepare Your FastAPI Application

Your FastAPI application is ready to go. Here's the `main.py` for reference:

```python
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

## Step 2: Create app.yaml File

Next, you'll need to create an `app.yaml` file in the root directory of your
 project. This file configures your App Engine application's settings.

Here's an example `app.yaml` file:

```yaml
runtime: python39  # Use the Python 3.9 runtime
instance_class: F2  # Choose a class with at least 256MB to run FastAPI and Uvicorn
entrypoint: uvicorn main:app --host 0.0.0.0 --port $PORT
automatic_scaling:
  target_cpu_utilization: 0.65
  min_instances: 1
  max_instances: 10
```

## Step 3: Create a requirements.txt File

Create a `requirements.txt` file in the root directory of your project and add
 the necessary dependencies:

```txt
fastapi==0.68.1
uvicorn[standard]==0.15.0
```

## Step 4: Deploy Your Application

Before you deploy, make sure you're authenticated to Google Cloud:

```bash
gcloud auth login
```

Next, set your project ID:

```bash
gcloud config set project your-project-id
```

Finally, deploy your app:

```bash
gcloud app deploy
```

Your FastAPI application should now be deployed to Google App Engine!

### Bonus: Deploy with github actions

To deploy your FastAPI application on Google App Engine using GitHub Actions,
 you'll first need to create a service account in your Google Cloud Project.
  This service account should have the 'App Engine Deployer' and 'Storage
   Admin' roles to allow it to deploy applications and upload to the Cloud
    Storage bucket. Download the JSON key file for this service account and
     store it as a secret (let's say GCP_SA_KEY) in your GitHub repository.

Here's a simple GitHub Actions workflow that can be used for deployment. Create
 a new file under .github/workflows in your repository named deploy.yml and add
  the following content:

```yaml
name: Deploy to Google App Engine

on:
  push:
    branches:
      - main  # Trigger the workflow on push to main branch

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Python 3.9
      uses: actions/setup-python@v2
      with:
        python-version: 3.9

    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt

    - name: Setup gcloud CLI
      uses: google-github-actions/setup-gcloud@master
      with:
        service_account_key: ${{ secrets.GCP_SA_KEY }}
        project_id: your-gcp-project-id
        export_default_credentials: true

    - name: Deploy to App Engine
      run: gcloud app deploy --quiet
```

# Conclusion

Google App Engine is a powerful platform for deploying Python web applications.
 With it, you can focus on building your FastAPI application and leave the
 infrastructure management to Google.

# References

* [Fastapi](../../python/apis/fastapi.md)
* [Github Actions](../../mlops/tools/github_actions.md)
