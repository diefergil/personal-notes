# Using Makefile and Python for Streamlined Development

Makefiles are powerful tools for automating build processes and managing
 dependencies in software development projects. When combined with Python, they
  become even more versatile and efficient. In this article, we will explore
   the benefits of using Makefiles and Python together and demonstrate how they
    can streamline your development workflow.

## What is a Makefile

A Makefile is a simple text file that contains a set of rules and dependencies.
 It is commonly used in Unix-based systems to automate the compilation and
  execution of programs. Make, the build automation tool, reads the Makefile
   and executes the necessary commands to build the target or targets specified.

Makefiles are especially useful when working on projects with multiple source
 files, libraries, or complex build processes. They provide a clear and concise
  way to define the dependencies and actions needed to build and run your
   project.

## Integrating Python with Makefiles

Python is a popular programming language known for its simplicity and
 readability. It offers a wide range of libraries and frameworks that
  facilitate various tasks, from data analysis to web development. By combining
   Python with Makefiles, you can leverage the strengths of both tools and
    create a more efficient development workflow.

One of the primary advantages of using Python in a Makefile is its ability to
 automate repetitive tasks. Instead of manually executing commands or scripts,
  you can define them as rules in the Makefile and let Make handle the
   execution. This approach saves time and reduces the chance of errors.

Let's look at an example to illustrate how Python and Makefiles work together
. Suppose you are working on a Python project that requires installing
 dependencies, running tests, and generating documentation. You can define the
  following rules in your Makefile:

```make
install:
    pip install -r requirements.txt

test:
    pytest tests/

docs:
    python generate_docs.py
```

In this example, the `install` rule installs the project dependencies by
 running `pip install -r requirements.txt`. The `test` rule executes the test
  suite using pytest, and the `docs` rule generates the project documentation
   using a custom Python script.

To run a specific rule, you simply type `make <rule_name>` in your terminal.
 For example, `make test` will execute the tests defined in the `tests/` directory.

## Handling Dependencies with Makefiles

One of the key features of Makefiles is their ability to handle dependencies
 automatically. When a rule depends on certain files or other rules, Make
  ensures that the dependencies are up to date before executing the rule. This
   feature is invaluable in large projects with complex dependencies.

Let's consider a scenario where your Python project depends on multiple source
 files, and each file needs to be compiled before the final executable is
  generated. You can define the following rule in your Makefile:

```make
main: utils.o file1.o file2.o
    gcc -o main main.c utils.o file1.o file2.o

%.o: %.c
    gcc -c $<
```

In this example, the `main` rule depends on three object files: `utils.o`,
 `file1.o`, and `file2.o`. The rule specifies the compilation command to
  generate the `main` executable. The second rule, `%.o: %.c`, is a pattern
   rule that compiles any `.c` file into an object file. The `$<` placeholder
    represents the source file name.

When you execute `make main`, Make automatically checks if any of the object
 files are missing or have been modified since the last build. If necessary, it
  compiles the required source files and then proceeds to link them into the
   `main` executable.

By defining the dependencies accurately in your Makefile, you ensure that your
 project is built correctly and efficiently, with only the necessary steps
 being executed.

## Using the `.PHONY` Target

In a Makefile, the `.PHONY` target is used to declare rules that do not
 correspond to actual files. These rules are considered 'phony' because they
  don't generate any output files with the same name. Instead, they execute a
   series of commands or actions.

The `.PHONY` target is typically used for defining rules that perform common
 tasks such as cleaning the project directory, running tests, or building the
  project. By declaring these rules as phony, you ensure that Make doesn't
   confuse them with actual files and always executes the associated commands.

For example, consider the following Makefile snippet:

```make
.PHONY: clean test build

clean:
    rm -rf build/

test:
    pytest tests/

build:
    python setup.py build
```

In this example, the `.PHONY` target is used to declare the rules `clean`,
 `test`, and `build` as phony targets. When you run `make clean`, it executes
  the command `rm -rf build/` to remove the build directory. Similarly,
  `make test` runs the test suite using pytest, and `make build` builds the
   project using the `setup.py` script.

By using the `.PHONY` target, you ensure that Make always executes the
 specified commands for these rules, regardless of whether there are files with
  the same names.

## Including Environment Variables in Makefile

Makefiles allow you to include environment variables within their definitions,
 which can be useful for setting configuration parameters or passing values to
  the commands executed by Make.

To define an environment variable in a Makefile, you can use the `export`
 directive followed by the variable name and its value. Here's an example:

```make
export MY_VARIABLE = my_value

rule:
    echo $(MY_VARIABLE)
```

In this example, the `MY_VARIABLE` environment variable is defined with the
 value `'my_value'`. The `rule` target then uses the `echo` command to display
  the value of `MY_VARIABLE`.

Including a `.venv` File

Sometimes, it is necessary to include environment variables defined in an
 external file, such as a `.venv` file used for managing virtual environments.
  You can achieve this by using the `include` directive in your Makefile.

Assuming you have a `.venv` file with environment variable assignments like:

```make
VAR1=value1
VAR2=value2
```

You can include these variables in your Makefile as follows:

```make
include .venv

rule:
    echo $(VAR1)
    echo $(VAR2)
```

In this example, the `.venv` file is included in the Makefile, and its
 variables (`VAR1` and `VAR2`) are accessible and can be used in the rules.

## Opening a Browser with a Python Script

If you want to open a browser from within a Python script, you can make use of
 the `webbrowser` module. This module provides a high-level interface for
  displaying web-based documents to users. Here's an example script that opens
   a URL in the default web browser:

```python
define BROWSER_PYSCRIPT
import os, webbrowser, sys

from urllib.request import pathname2url

webbrowser.open('file://' + pathname2url(os.path.abspath(sys.argv[1])))
endef
export BROWSER_PYSCRIPT

BROWSER := poetry run python -c '$$BROWSER_PYSCRIPT'
```

In this script, the `webbrowser.open()` function is used to open the specified
 URL in the default web browser. When you run the script, it will launch the
  browser and navigate to the given URL.

You can integrate this Python script into your Makefile by creating a rule that
 executes the script. For example:

```make
coverage:
    poetry run coverage run --rcfile=pyproject.toml -m pytest --benchmark-skip
    poetry run coverage html --rcfile=pyproject.toml
    $(BROWSER) htmlcov/index.html
```

Running `make open_browser` will execute the `open_browser.py`

## Script template

```shell
.PHONY: clean clean-build clean-pyc clean-test create-network db-start
precommit precommit_style pylint precommit_security test_check_coverage coverage
 install install_dev docs test_benchmark

define BROWSER_PYSCRIPT # (1)
import os, webbrowser, sys

from urllib.request import pathname2url

webbrowser.open('file://' + pathname2url(os.path.abspath(sys.argv[1])))
endef
export BROWSER_PYSCRIPT

BROWSER := poetry run python -c '$$BROWSER_PYSCRIPT'


clean: clean-build clean-pyc clean-test

clean-build:
    rm -fr build/
    rm -fr dist/
    rm -fr .eggs/
    find . -name '*.egg-info' -exec rm -fr {} +
    find . -name '*.egg' -exec rm -f {} +

clean-pyc:
    find . -name '*.pyc' -exec rm -f {} +
    find . -name '*.pyo' -exec rm -f {} +
    find . -name '__pycache__' -exec rm -fr {} +

clean-test:
    rm -f .coverage
    rm -fr htmlcov/
    rm -fr .pytest_cache

compose-build:
    docker compose -f docker-compose.yml build --no-cache

compose-up:
    docker compose -f docker-compose.yml up

create-network:
    docker network create my-docker-network

db-start:
    docker compose up -d postgres

docs:
    poetry run mkdocs build

clean-docs:
    rm -fr site/

precommit:
    poetry run pre-commit run -a

precommit_security:
    SKIP=mypy,flakeheaven,black,isort,pycln,check-docstring-first,
    check-case-conflict,trailing-whitespace,end-of-file-fixer,debug-statements,
    check-ast,check-json,check-yaml,no-commit-to-branch poetry run pre-commit
     run -a

pylint:
    pylint --disable=R,C src/

precommit_style:
    SKIP=detect-aws-credentials,detect-private-key,check-added-large-files,
    bandit,no-commit-to-branch poetry run pre-commit run -a

test:
    poetry run pytest -vvv --benchmark-skip

test_check_coverage:
    # Check pyproject.toml configuration
    poetry run coverage run --rcfile=pyproject.toml -m pytest --benchmark-skip
    poetry run coverage report --rcfile=pyproject.toml

coverage:
    poetry run coverage run --rcfile=pyproject.toml -m pytest --benchmark-skip
    poetry run coverage html --rcfile=pyproject.toml
    $(BROWSER) htmlcov/index.html

install: clean
    poetry install --no-dev

install_dev: clean
    poetry install

test_benchmark:
    poetry run pytest -vvv --benchmark-autosave --benchmark-only

init:
    poetry install
    poetry run ipython kernel install --name 'my_kernel_name' --user
    dvc pull
```

1. :man_raising_hand: This is the way to declare a function inside a Makefile
