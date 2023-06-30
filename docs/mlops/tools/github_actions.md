---
tags:
  - Mlops
  - Continuous Integration
---
# GitHub Actions

In this guide, we'll go through the steps to create a continuous integration
 (CI) workflow for a Python package using GitHub Actions. This will
  automatically test your Python package each time you push a commit to your repository.

.
├── .github
│   ├── workflows
│   │   └── workflow1.yml
├── Makefile
├── README.md
├── src

## Step 1: Create a Workflow File

In your GitHub repository, create a new file in the `.github/workflows`
 directory. You can name it anything you like, but it must end in `.yml`
 or `.yaml`. For this example, let's name it `python-package.yml`.

## Step 2: Set up the Workflow

Open `python-package.yml` and let's set up the workflow. Here's a simple
 starting point:

```yaml
name: Python package

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  build:

    runs-on: ubuntu-latest

    strategy:
      matrix:
        python-version: [3.6, 3.7, 3.8, 3.9, 3.10]
```

This configures the workflow to run on `push` and `pull_request` events to the
 `master` branch. It runs on the `ubuntu-latest` GitHub-hosted runner and tests
  against Python 3.6, 3.7, 3.8, 3.9, and 3.10.

## Step 3: Configure the Workflow Steps

We will now add the steps that the workflow will follow. Below the
 `python-version` line, add:

``` yaml
    steps:
    - uses: actions/checkout@v2
    - name: Set up Python ${{ matrix.python-version }}
      uses: actions/setup-python@v2
      with:
        python-version: ${{ matrix.python-version }}
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install flake8 pytest
        if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
    - name: Lint with flake8
      run: |
        # stop the build if there are Python syntax errors or undefined names
        flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
        # exit-zero treats all errors as warnings. The GitHub editor is 127
         chars wide
        flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
    - name: Test with pytest
      run: |
        pytest
```

This checks out your repository, sets up Python, installs dependencies, and
 then runs `flake8` for linting and `pytest` for running tests.

## Step 4: Commit and Push

Once you're done, commit the `python-package.yml` file and push it to your
 GitHub repository. GitHub Actions will start running the workflow on your next
  push.

Remember, you can always modify and expand this workflow to suit your specific
 needs. For more information, check out the [GitHub Actions documentation](https://docs.github.com/en/actions).
