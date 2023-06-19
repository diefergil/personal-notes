---
tags:
  - Python
  - Tests
  - Development
---
# Pytest

## Test layouts

* Directory layout starts with `tests`
* From `tests` you can add anything like `unit`, `functional` or other meaningful
  names like `database`
* Files need to be pre-fixed with `test_`
* Test functions need to be prefixed with `test_`
* Test classes need to be prefixed with `Test`

## How syntax works

Tests can be functions or classes

### Functions

```python
def test_my_function():
  assert 1 == 1
```

### Classes

Classes do not need inheritance:

<a id="str_to_int-function"></a>

```python
# This function is here for convenience only, in a real-world scenario this function
# would be elsewhere in a package

def str_to_int(string):
    """
    Parses a string number into an integer, optionally converting to a float
    and rounding down.
    You can pass "1.1" which returns 1
    ["1"] -> raises RuntimeError
    """
    error_msg = "Unable to convert to integer: '%s'" % str(string)
    try:
        integer = float(string.replace(',', '.'))
    except AttributeError:
        # this might be a integer already, so try to use it, otherwise raise
        # the original exception
        if isinstance(string, (int, float)):
            integer = string
        else:
            raise RuntimeError(error_msg)
    except (TypeError, ValueError):
        raise RuntimeError(error_msg)

    return int(integer)

# When you create yout class test you have special methods
class TestStrToInt:

    def setup_method(self):
        print('\nthis is setup')

    def teardown_method(self):
        print('\nthis is teardown')

    def setup_class(cls):
        print('\nthis is setup class')

    def teardown_class(cls):
        print('\nthis is teardown class')

    def test_rounds_down(self):
        result = str_to_int('1.99')
        assert result == 2

    def test_round_down_lesser_half(self):
        result = str_to_int('1.2')
        assert result == 2

```

That setup_class is executed before a test in a class and happens just once,
and setup_method is executed before every test in the class.

You can use these special methods to run code before all tests in a class or
before each one.

You can see the ouput here:

<details>
  <summary>Ouptut example</summary>

```python
======================================= test session starts =======================================
platform linux -- Python 3.8.10, pytest-7.2.0, pluggy-1.0.0
rootdir: /home/coder/python-testing/notebooks/lesson2
collected 2 items

test-classes/test_classes.py FF                                                             [100%]

============================================ FAILURES =============================================
__________________________________ TestStrToInt.test_rounds_down __________________________________

self = <test_classes.TestStrToInt object at 0x7f9e8a8c8220>

    def test_rounds_down(self):
        result = str_to_int('1.99')
>       assert result == 2
E       assert 1 == 2

test-classes/test_classes.py:44: AssertionError
-------------------------------------- Captured stdout setup --------------------------------------

this is setup class

this is setup
------------------------------------ Captured stdout teardown -------------------------------------

this is teardown
____________________________ TestStrToInt.test_round_down_lesser_half _____________________________

self = <test_classes.TestStrToInt object at 0x7f9e8a8c8340>

    def test_round_down_lesser_half(self):
        result = str_to_int('1.2')
>       assert result == 2
E       assert 1 == 2

test-classes/test_classes.py:48: AssertionError
-------------------------------------- Captured stdout setup --------------------------------------

this is setup
------------------------------------ Captured stdout teardown -------------------------------------

this is teardown

this is teardown class
===================================== short test summary info =====================================
FAILED test-classes/test_classes.py::TestStrToInt::test_rounds_down - assert 1 == 2
FAILED test-classes/test_classes.py::TestStrToInt::test_round_down_lesser_half - assert 1 == 2
======================================== 2 failed in 0.02s ========================================
```

</details>

## Run tests

In the test directory

```bash
pytest -vvvv tests/
```

<details>
  <summary>Ouptut example</summary>

```python
============================= test session starts ==============================
platform linux2 -- Python 2.7.17, pytest-3.6.4, py-1.8.0, pluggy-0.7.1 -- /usr/bin/python2
cachedir: .pytest_cache
rootdir: /content, inifile:

collecting 0 items
collecting 2 items
collecting 2 items
collecting 2 items
collected 2 items

test_util.py::TestFloats::test_rounds_down FAILED                        [ 50%]
test_util.py::TestFloats::test_round_down_lesser_half FAILED             [100%]

=================================== FAILURES ===================================
_________________________ TestFloats.test_rounds_down __________________________

self = <test_util.TestFloats instance at 0x7fbf26d90870>

    def test_rounds_down(self):
        result = str_to_int('1.99')
>       assert result == 2
E       assert 1 == 2

test_util.py:42: AssertionError
show more (open the raw output data in a text editor) ...


this is teardown

this is teardown class
=========================== 2 failed in 0.04 seconds ===========================
```

</details>

## Testing failures

Enter to the python debugger where your code is failing:

```bash
pytest --pdb test_failure_output.py
```

Once entered in the debugger you can type `h` to see the commands that you can use.

## Another commands for pytest

 - `--collect-only` -> Only collect tests, don't execute them
 - `-x` -> Stop at the first failure


To see all type:

```bash

pytest --help
```

## Plugins

### pytest-xdist

Gives you the ability to run instance for running your test using the `-n` cli
parameter.

```bash
pytest -n 4 test/
```

Going to set 4 differents runner instances and run them at the same time.


## Other functionalities

### Parametrize tests

Parametrize tests it's like put a for loop over the tests that you want to expect
 the same result using the same function. The problem with plain for loops it's
 that the output it's a little bit confused. You don't know really where the error
 is located and if the rest of the loop it's going to be cover. So a good
 option it's parametrize tests.

<details>
  <summary>str_to_bool function:</summary>
  ```python
    def str_to_bool(val):
      """
      Convert a string representation of truth to True or False
      True values are 'y', 'yes', or ''; case-insensitive
      False values are 'n', or 'no'; case-insensitive
      Raises ValueError if 'val' is anything else.
      """
      true_vals = ['yes', 'y', '']
      false_vals = ['no', 'n']
      try:
          val = val.lower()
      except AttributeError:
          val = str(val).lower()
      if val in true_vals:
          return True
      elif val in false_vals:
          return False
      else:
          raise ValueError("Invalid input value: %s" % val)
  ```
</details>

```python
 import pytest
from src impport str_to_bool # function to convert string to bool


@pytest.mark.parametrize('value', ['y', 'yes', ''])
def test_is_true(value):
    result = str_to_bool(value)
    assert result is True
```

<details>
  <summary>Example output:</summary>

  ```python
  ======================================= test session starts =======================================
  platform linux -- Python 3.8.10, pytest-7.2.0, pluggy-1.0.0
  rootdir: /home/coder/python-testing/notebooks/lesson2
  collected 3 items

  parametrize/test_utils.py ...                                                               [100%]

  ======================================== 3 passed in 0.01s ========================================
  ```
</details>

### Fixtures

In pytest, fixtures are a way to provide data or test-doubles (mocks, stubs, etc)
to your tests. They are created using the `@pytest.fixture` decorator and then
injected into your tests as arguments. Fixtures are meant to simplify test setup
and teardown code, and they help to make your tests more modular and scalable.

Here's a basic example of how to use a fixture in pytest:

```python
import pytest

# Define a fixture
@pytest.fixture
def my_fixture():
    return "Hello, World!"

# Use the fixture in a test
def test_hello(my_fixture):
    assert my_fixture == "Hello, World!"
```

In this example, the `my_fixture` fixture is defined to return the string
`"Hello, World!"`. Then, in the `test_hello` test, `my_fixture` is injected as
an argument. When pytest runs this test, it first calls the my_fixture fixture
function and then passes its return value to `test_hello`.

Here's a more complex example where a fixture is used for setup and teardown:

```python
import pytest

# Define a fixture
@pytest.fixture
def database():
    db = setup_database()  # Setup code
    yield db  # This is what will be injected into your tests
    teardown_database(db)  # Teardown code

# Use the fixture in a test
def test_db(database):
    assert database.is_connected()
```

In this example, the `database` fixture is used to manage a database connection.
The setup_database function is called to establish the connection, and then the
connection object is yielded to the test. After the test runs, the `teardown_database`
function is called to clean up the connection.


#### fixture scopes

Fixture scope determines when a fixture is set up and torn down. The possible scopes are function, class, module, package or session:

* `function`: The default scope, the fixture is set up and torn down for each test function.
* `class`: The fixture is set up and torn down for each test class.
* `module`: The fixture is set up and torn down once per test module.
* `package`: The fixture is set up and torn down once per test package.
* `session`: The fixture is set up once when the test session starts, and is torn down once at the end of the test session.

```python
import pytest

@pytest.fixture(scope="module")
def module_fixture():
    # Setup code here
    yield "Hello, Module!"
    # Teardown code here
```

#### Fixture dependencies

Fixtures can use other fixtures. This is often useful when you want to modularize your
fixtures for reuse and better organization.

```python
import pytest

@pytest.fixture
def order():
    return {"name": "Burger", "price": 7.99}

@pytest.fixture
def cart(order):
    return [order]

def test_cart(cart):
    assert len(cart) == 1
````

#### conftest

The conftest.py file serves as a means of providing fixtures for an entire directory
of tests. Any fixture defined in conftest.py will be automatically available to all
test files in the same directory and subdirectories.

```python
# conftest.py
import pytest

@pytest.fixture
def my_fixture():
    return "Available Everywhere"
```

### temporal directories

The tmpdir fixture is a built-in pytest fixture that creates a temporary directory
unique to the test invocation, which is automatically cleaned up after the test.

```python
class TestMyClass:

    def test_write_Yes(self, tmpdir):
        path = str(tmpdir.join("test_value"))
        write_integer("Yes", path)
        with open(path, "r") as _f:
            value = _f.read()

        assert value == "True"
```

### Monkeypatch

The monkeypatch fixture helps to safely set/delete an attribute,
dictionary item or environment variable or to modify sys.path for importing.

```python
def test_monkeypatch(monkeypatch):
    result = {"HELLO": "world"}
    monkeypatch.setenv("HELLO", "monkeypatched")
    assert result["HELLO"] == "monkeypatched"
```
