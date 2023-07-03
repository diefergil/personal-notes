---
tags:
  - Development
  - Packaging
---
# The setup.py python file

`setup.py` is a Python file that provides information about a module/package that
you have created. It's the build script for setuptools. It tells setuptools about
your package (such as the name and version) as well as files to include.

## Creating a Basic `setup.py` File

Here's an example of a basic setup.py file:

```python
from setuptools import setup, find_packages

setup(
    name='MyPackage',
    version='0.1',
    packages=find_packages(),
)
```

In this example, we're importing `setup` and `find_packages` from setuptools.
 `setup` is the function that sets up your package, and `find_packages`
 automatically discovers all packages and subpackages.

The `name` argument is the name of your package, and `version` is the current
version of your package.

## Adding More Information

We can add more information about our package in the setup.py file:

```python
setup(
    name='MyPackage',
    version='0.1',
    packages=find_packages(),
    description='A sample Python package',
    # you cand add this using a function from the requierements.txt
    install_requires = ['click==7.3.0', 'colorama'],
    entry_points='''
    [console_scripts]
    command1=src.main:command1
    '''
    long_description=open('README.txt').read(),
    author='Your Name',
    author_email='your.email@example.com',
    url='http://example.com/MyPackage/',
    license='LICENSE.txt',
)
```

Here, description provides a short description of the package. `long_description`
 can be a detailed description, which we are reading from a file named `README.txt`.
 `author` and `author_email` are self-explanatory. `url` is the URL for the homepage
 of the package. `license` specifies the license under which the package is released.

## Including Additional Files - `MANIFEST.in

To include additional files such as the README, you can use the `MANIFEST.in` file.
Create a file named `MANIFEST.in` in the same directory as setup.py and list any
additional files you want to include in the package:

```bash
include README.txt
include LICENSE.txt
```

You can also specify this directly in the setup.py file:

```python
setup(
    # …
    include_package_data=True,
    package_data={
       '': ['README.txt', 'LICENSE.txt'],
    },
)
```

Here, `include_package_data=True` tells setuptools to include any data files
specified in package_data or `MANIFEST.in.`

## Installing the Package

Once you've written your `setup.py`, you can install your package using `pip`:

```shell
pip install .
```

### Installing editable

This command installs the package in the current directory. If you want to install
 the package in editable mode (i.e., changes to the source code are immediately
 available without needing to reinstall the package), you can use:

=== "Pip"

    ```bash
    pip install -e .
    ```

=== "Pyhton"

    ```bash
    python setup.py develop
    ```

## Tutorials

* [Setuptools official documentaion](https://setuptools.pypa.io/en/latest/)
