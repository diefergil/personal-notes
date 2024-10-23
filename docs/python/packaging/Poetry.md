
| Command                                                      | Description                                                                                                           |
| ------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| `poetry new <PROJECT_NAME>`                                  | Creates a new poetry project with the given name, including a `pyproject.toml` file.                                  |
| `poetry init`                                                | Initializes a new poetry project in the current directory, interactively creating a `pyproject.toml`.                 |
| `poetry install`                                             | Installs all dependencies defined in `pyproject.toml`.                                                                |
| `poetry add <PACKAGE_NAME>`                                  | Adds a new dependency to the project and installs it.                                                                 |
| `poetry add <PACKAGE_NAME>@<VERSION>`                        | Adds a specific version of a package as a dependency.                                                                 |
| `poetry update`                                              | Updates all dependencies to the latest versions allowed by `pyproject.toml`.                                          |
| `poetry remove <PACKAGE_NAME>`                               | Removes a package from the project dependencies.                                                                      |
| `poetry lock`                                                | Locks the current dependency versions in the `poetry.lock` file.                                                      |
| `poetry shell`                                               | Spawns a shell within the project's virtual environment.                                                              |
| `poetry run <COMMAND>`                                       | Executes a command inside the project's virtual environment.                                                          |
| `poetry build`                                               | Builds the project as a distributable package (wheel and/or sdist).                                                   |
| `poetry publish`                                             | Publishes the package to a repository (e.g., PyPI).                                                                   |
| `poetry check`                                               | Validates the `pyproject.toml` and checks for common issues.                                                          |
| `poetry export --format=requirements.txt > requirements.txt` | Exports dependencies to a `requirements.txt` file.                                                                    |
| `poetry config <KEY> <VALUE>`                                | Configures poetry settings such as repositories, cache, and virtualenv behavior.                                      |
| `poetry show`                                                | Shows information about the project's dependencies.                                                                   |
| `poetry show --latest`                                       | Shows information about dependencies and indicates the latest available versions.                                     |
| `poetry version`                                             | Displays the current project version.                                                                                 |
| `poetry version <NEW_VERSION>`                               | Bumps the project version (e.g., `major`, `minor`, `patch`), or sets a specific version.                              |
| `poetry search <PACKAGE_NAME>`                               | Searches for a package on PyPI.                                                                                       |
| `poetry env list`                                            | Lists the virtual environments associated with the project.                                                           |
| `poetry env use <PYTHON_VERSION>`                            | Selects or creates a virtual environment for a specific Python version.                                               |
| `poetry cache clear --all pypi`                              | Clears the poetry cache for PyPI dependencies.                                                                        |
| `RUN poetry install --no-root`                               | Installs the dependencies without installing the current project package itself                                       |
| `RUN poetry install --without dev`                           | Excludes the installation of development dependencies, ensuring that only non-development dependencies are installed. |
| `RUN poetry install --only main`                             | Installs only the dependencies in the `main` group (assuming this group is defined in `pyproject.toml`                |


## Example [[Docker]] with poetry

```Dockefile
FROM --platform=amd64 python:3.10.13-slim

WORKDIR /app


# Pin Poetry as it cannot control it's own version
ARG POETRY_VERSION="1.8.2"
RUN pip install --upgrade pip && pip install poetry==${POETRY_VERSION}
RUN poetry config virtualenvs.create false


COPY poetry.lock .
COPY pyproject.toml .


RUN poetry install --no-root --only main

# Copy source code after dependencies

COPY ./src ./src
  

RUN poetry install --only main
```