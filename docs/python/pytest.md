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

```python
class TestMyClass:

  def test_my_method(self):
    assert 1 == 1
```

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
