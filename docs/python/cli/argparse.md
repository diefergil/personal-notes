# Argparse

# Introduction to `argparse` in Python

`argparse` is a powerful module in Python that provides a convenient way to parse
command-line arguments and options. It simplifies the process of building
command-line interfaces (CLIs) for your Python scripts or applications. In this
tutorial, we will explore the basics of `argparse` and learn how to use it effectively.

## Installation of argparse

`argparse` is included in the Python standard library, so there is no need for
 additional installation.

## Getting Started

To start using `argparse`, you need to import the module:

```python
import argparse
```

## Creating a Parser

The first step in using `argparse` is to create an ArgumentParser object, which will
 handle the parsing of command-line arguments. You can create a parser by invoking
 the `argparse.ArgumentParser()` constructor:

```python
parser = argparse.ArgumentParser()
```

## Adding Arguments

Once you have a parser, you can add arguments to it. An argument is defined by
invoking the `add_argument()` method on the parser object. Here\'s an example
that adds a positional argument:

```python
parser.add_argument('filename', help='name of the file to process')
```

In the example above, we added a positional argument called `filename` that
represents the name of the file to be processed. The `help` parameter provides
a description of the argument, which is displayed when the user requests help information.

You can also add optional arguments using the `add_argument()` method. Here's
an example that adds an optional argument called `--verbose`:

```python
parser.add_argument(
    '--verbose', action='store_true', help='increase output verbosity'
    )
```

In the example above, we added a positional argument called filename that represents
the name of the file to be processed. The help parameter provides a description of
the argument, which is displayed when the user requests help information.

## Parsing Arguments

After you have added the desired arguments, you need to parse the command-line
arguments provided by the user. This is done by invoking the `parse_args()`
method on the parser object:

```python
args = parser.parse_args()
```

The `parse_args()` method returns an object containing the values of the parsed
 arguments. You can access the values by using dot notation on the `args` object.
  For example, to access the value of the `filename` argument:

```python
print(args.filename)
```

## Putting It All Together

Here's an example that combines the concepts discussed above:

```python
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('filename', help='name of the file to process')
parser.add_argument('--verbose', action='store_true', help='increase output verbosity')

args = parser.parse_args()

print("Processing file:", args.filename)
if args.verbose:
    print("Verbose mode enabled.")
```

ssuming this script is saved as `script.py`, you can run it from the command line
as follows:

```bash
python script.py myfile.txt
```

If you include the `--verbose` flag:

```bash
python script.py myfile.txt --verbose
```

## Example script of argparse

```python
import argparse

def greet_user(name, age=None, greeting='Hello', uppercase=False):
    # Modify greeting based on options
    if uppercase:
        greeting = greeting.upper()

    # Greet the user
    output = f'{greeting}, {name}!'
    if age:
        output += f' You are {age} years old.'

    return output

if __name__ == '__main__':
    # Create a parser
    parser = argparse.ArgumentParser(description='Script to greet a user')

    # Add arguments
    parser.add_argument('name', help='name of the user')  # positional argument
    parser.add_argument('--age', type=int, help='age of the user')  # optional argument with type validation
    parser.add_argument('--greeting', choices=['Hello', 'Hi', 'Hola'], default='Hello',
                        help='choose a greeting from the given options')  # optional argument with choices and default value
    parser.add_argument('--uppercase', action='store_true', help='convert greeting to uppercase')  # optional argument with flag

    # Parse the arguments
    args = parser.parse_args()

    # Call the greet_user function with the provided arguments
    output = greet_user(args.name, args.age, args.greeting, args.uppercase)

    # Print the greeting
    print(output)
```

Clarifications:
    * When an argument has a action, by default is `False` until you put it in the
  * call, in this case it is `--sort`argument.
