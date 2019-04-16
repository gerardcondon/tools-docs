# PyTest

* Test framework for Python
* Tests are functions beginning with `test_` which can be autodiscovered
* Support for `assert` statements
* Supports [fixtures](https://docs.pytest.org/en/latest/fixture.html) - preferred way rather than setup and teardown functions.

## Cache
* Persistent storage which is maintained across test runs.
* Can be used to persist the output from REST API calls etc.
* Use the `--cache-clear` option to disable
* Enabled by default but may wish to guard behind command line parameter so that the user has to manually enable it - so won't interfere with CI build.

## Command Line Options
* Sample code for boolean parameter
* `parser.addoption("--enable-bool", action="store_true", help="Help text")`

## Asserts
* Can use `any(list of boolean)` or `all(<list of boolean>)` to reduce a series of tests to a single boolean

## References
* [Pytest Docs](https://docs.pytest.org/en/latest/index.html)