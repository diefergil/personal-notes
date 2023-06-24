---
tags:
  - Development
  - Command Line interface
---
# Click Command Line Python Framework Tutorial

Click is a Python package that allows for the creation of beautiful command
line interfaces (CLI) in a composable way. It's perfect for building command
line applications and supports lazy argument parsing.

## Installation

First, we need to install Click. You can do this using pip:

```shell
pip install click
```

## A Basic Click Command

Here is an example of a simple Click command:

```python
import click

@click.command()
def hello():
    click.echo('Hello Click!')

if __name__ == '__main__':
    hello()

```

In this script,`@click.command()` is a decorator which tells Click that this +¡
function is a command line command. `click.echo` is a function that prints text
to the console.

## Command with Arguments

We can add arguments to our Click commands as follows:

```python
import click

@click.command()
@click.argument('name')
def hello(name):
    click.echo(f'Hello {name}!')

if __name__ == '__main__':
    hello()

```

In this example, `@click.argument('name')` is another decorator which adds an
argument to our command. Now, when you run the command, you need to provide
an additional piece of information.

## Command with Options

Options are like arguments, but they are optional and have default values:

```python
import click

@click.command()
@click.option('--greeting', default='Hello', help='Change the greeting.')
@click.argument('name')
def hello(greeting, name):
    click.echo(f'{greeting} {name}!')

if __name__ == '__main__':
    hello()
```

In this example, `@click.option('--greeting', default='Hello', help='Change the greeting.')`
is an option. You can provide it when you run the command, or you can leave it out
to use the default value.

## Grouping commands

You can group multiple commands together:

```python
import click

@click.group()
def cli():
    pass

@cli.command()
def initdb():
    click.echo('Initialized the database')

@cli.command()
def dropdb():
    click.echo('Dropped the database')

if __name__ == '__main__':
    cli()
```

## Example click script

```python
import click

@click.group()
def cli():
    'Example CLI group. This is a Click command-line interface.'
    pass

@cli.command()
@click.argument('name', nargs=1)
def greet(name):
    'This command greets NAME.'
    click.echo(f'Hello, {name}!')

@cli.command()
@click.argument('name', nargs=1)
@click.option('--count', default=1, help='Number of greetings.')
@click.option('--greeting', '-g', default='Hello', help='Customize the greeting.')
def repeat(name, count, greeting):
    'This command repeats a greeting to NAME, COUNT times.'
    for _ in range(count):
        click.echo(f'{greeting}, {name}!')

@cli.group()
def maths():
    'Maths commands group.'
    pass

@maths.command()
@click.argument('numbers', nargs=-1, type=int)
def sum(numbers):
    'This command sums up NUMBERS.'
    click.echo(f'Sum: {sum(numbers)}')

@maths.command()
@click.argument('numbers', nargs=-1, type=int)
def multiply(numbers):
    'This command multiplies NUMBERS.'
    result = 1
    for num in numbers:
        result *= num
    click.echo(f'Product: {result}')

@cli.command()
@click.argument('filepath', type=click.Path(exists=True))
def showfile(filepath):
    'This command shows the content of a FILEPATH.'
    with open(filepath, 'r') as file:
        content = file.read()
    click.echo(content)

if __name__ == '__main__':
    cli()
```

This script provides a command-line interface with a `greet` command that accepts
one argument (a name to greet), a `repeat` command that accepts a name and optional
count and greeting options (to repeat the greeting a certain number of times), and
a `maths` group with `sum` and `multiply` commands that perform mathematical operations
on a list of numbers.

You can run these commands like so:

```shell
python myscript.py greet Bob
python myscript.py repeat Alice --count 3 --greeting Hi
python myscript.py maths sum 1 2 3 4 5
python myscript.py maths multiply 1 2 3 4 5
python myscript.py showfile /path/to/file
```

## Argument vs Option

In the context of command-line interfaces, the terms "argument" and "option" have
specific meanings:

* _Argument_: An argument is a value that is passed directly to a command. Arguments
  are positional, meaning that their order matters. They are typically mandatory,
   although some commands may allow optional arguments. For example, in the
    command `cp source.txt dest.txt`, `source.txt` and `dest.txt` are arguments.

* _Option_: An option modifies the behavior of a command. It is usually prefixed
   by a - (single dash for single-character options) or -- (double dash for
   multi-character options). Options may or may not require a value to be provided.
    For example, in the command `ls -l`, `-l` is an option that modifies the behavior
    of the ls command.

In the context of the Click library in Python:

* _Argument_: Click treats arguments similarly to how they are treated in
    command-line interfaces. They are positional and are defined using the
    `@click.argument()` decorator.

* _Option_: Click treats options as modifiers of commands. They are defined using
    the `@click.option()` decorator, and can have default values. Options in Click
    are always optional, and if not provided in the command line, the default value
    is used.

Here's an example of a command in Click that uses both arguments and options:

```python
@click.command()
@click.argument('filename')
@click.option('--verbose', is_flag=True, help='Enable verbose mode.')
def process(filename, verbose):
    """Process a file. If --verbose is provided, print detailed information."""
    if verbose:
        click.echo(f'Processing file in verbose mode: {filename}')
    else:
        click.echo(f'Processing file: {filename}')
```

In this example, filename is an argument, and `--verbose` is an option. The
`is_flag=True` argument to `@click.option()` means that `--verbose` is a flag
that does not take a value; its presence in the command line sets verbose to True.

## Create an unique unique entrypoint in click

If you have multiple command groups defined across different files, you can import
them into a main file and create an entry point for your application. This way,
you can keep your command groups logically separated, which can be beneficial as
your application grows.

Here's an example:

Let's say you have two Python files, `file1.py` and `file2.py`, with different c
ommand groups.

`file1.py`:

```python
import click

@click.group()
def group1():
    """This is group1 commands."""
    pass

@group1.command()
def command1():
    click.echo("Executing command1 from group1.")

@group1.command()
def command2():
    click.echo("Executing command2 from group1.")
```

`file2.py`:

```python
import click

@click.group()
def group2():
    """This is group2 commands."""
    pass

@group2.command()
def command1():
    click.echo("Executing command1 from group2.")

@group2.command()
def command2():
    click.echo("Executing command2 from group2.")
```

You can then create an entry point in a main file (for example, main.py) that imports
these groups and adds them to the main command group:

`main.py`:

```python
import click
from file1 import group1
from file2 import group2

@click.group()
def cli():
    """This is the main entry point."""
    pass

cli.add_command(group1)
cli.add_command(group2)

if __name__ == '__main__':
    cli()

```

Now, when you run `python main.py`, you'll have access to both command groups,
`group1` and `group2`, and all their respective commands. The commands can be
accessed like this:

```shell
python main.py group1 command1
```

Please note that the import statements in `main.py` assume that `file1.py` and
`file2.py` are in the same directory as `main.py`. If they're not, you'll need
to adjust the import statements to match your directory structure.
