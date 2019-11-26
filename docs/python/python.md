# Python

I created this document as I was learning Python and it archives some of the tools and tips I found during this process.

## Version

* There are two strands of Python. The 2.x and 3.x branches. Officical support for 2.x is due to end in the next few years however it is still popular as a lot of companies would have legacy code written for 2.x.

## Style Guide

* [Pep8](https://www.python.org/dev/peps/pep-0008/) seems to be the standard coding guidlines for Python. It is based on the original standards that Guido van Rossum created.
* Example Google DocString [style](http://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html)

## Whitespace

* Linters can give guidance as to the appropriate amount of indentation
* To split lines, especially strings, wrap the whole expression in brackets and then line can be split anywhere. Some operators can also be used to split lines e.g. + to append strings. This is better than using the `\` line continuation as whitespace after that character will mess up the program.

## Tools

There are a number of tools written to check the quality of Python code. These will typically check the Pep8 standard along with other coding best practice checks.

* [Flake8][]
* [Pylint][]
* [Bandit][]
* [yapf][]

* These can be added to Vim using the [Syntastic](https://github.com/vim-syntastic/syntastic) plugin.

## Debugger

* You can break into a Python debugging session from a script using the built in `pdb` package.
* Import it using `import pdb;`
* At the point where you want to break into the debugger put ` pdb.set_trace()`

## Performance Tuning

* Use timeit to compare small snippets of code https://docs.python.org/3.4/library/timeit.html

```python
$ python -m timeit '"-".join(str(n) for n in range(100))'
10000 loops, best of 3: 40.3 usec per loop
```

## Named Tuples

* These are effectively structs in Python
* Attributes are read only - must use _replace to change them
* https://docs.python.org/3/library/collections.html#namedtuple-factory-function-for-tuples-with-named-fields

## Unit Testing

* Assert that a function throws an exception - http://stackoverflow.com/questions/129507/how-do-you-test-that-a-python-function-throws-an-exception

## Run Python from the Command Line

* `python -c "# python code here"`

## Python Exception Wrapping

* Doesn't work as you would think out of the box. The original exceptions trace is replaced by the new one.
* In an except block with `ex` as the exception instance, when reraising use `raise` instead of `raise ex`
* If you want to raise a new Exception then you need to get the original traceback.
* http://stackoverflow.com/questions/39949525/in-python-2-how-to-raise-a-python-error-without-changing-its-traceback?rq=1

## Default Arguments

* Functions can take default values for arguments e.g. `def func(arg="some value")`

## Decorators

* A function that takes another function and extends the behaviour of that function without explicitly modifying it
* When implementing decorators that take arguments then use `functools.wrap` to set the name and docstring of the wrapped function correctly
* Guides - [RealPython Primer](https://realpython.com/primer-on-python-decorators/), [Hangar.Runway 7](http://hangar.runway7.net/python/decorators-and-wrappers),
  [Programiz](https://www.programiz.com/python-programming/decorator), [TheCodeShip](https://www.thecodeship.com/patterns/guide-to-python-function-decorators/)
* [Python Decorator Library](https://wiki.python.org/moin/PythonDecoratorLibrary)

## Function Caching

* Python 3.2 and up has a built in [LRU cache ](http://book.pythontips.com/en/latest/function_caching.html#function-caching)

## Lambda

* Small anonymous function. Can take any number of arguments
* Can be passed around in a variable or to a function as an argument
* `x = lambda a, b : a * b`

## Itertools Recipes

* Lots of [small functions](https://docs.python.org/3.3/library/itertools.html#itertools-recipes) for working with iterables
* For example `grouper` and `pairwise` for iterating over multiple values in a list at the same time. 

## Writing Command Line Tools in Python

* [Click](https://palletsprojects.com/p/click/) is a good library to help for describing options and generating help pages.
* Can have variadic arguments e.g. to process multiple files
```python  
@click.command()
@click.argument('files', nargs=-1, help="List of files.")
def my_cmd(files):
```
* Tutorials for using Click - [kite.com](https://kite.com/blog/python/python-command-line-click-tutorial/), [Basic](https://dbader.org/blog/python-commandline-tools-with-click), [Advanced](https://dbader.org/blog/mastering-click-advanced-python-command-line-apps), [PYM](https://pymbook.readthedocs.io/en/latest/click.html)
* Use [TDQM](https://pypi.org/project/tqdm/) to create progress bars - just wrap whatever iterable you are already using e.g. `for f in tqdm(files):`

### FileSystem
* Built in libraries `os.path` and `os.pathlib` for dealing with Paths. Pathlib is a higher level library. 
* `os.path` contain functions like `isdir` and `exists` for operating on paths.
* `os.scandir` can get the contents of a directory as a list. Special entries `.` and `..` are not included.
* `os.pathlib` contains a `read_text` function for reading the entire contents of a file.

### DataClasses
* Add fields to classes and auto generate the required constructor, eq etc.
* On Python 3.6 can use the backport available via pip
* Can give types and default values to the fields e.g. `total: int = 0`
* Can add factory lambdas/methods for fields e.g. initialise a timestamp to current time

### Flask
* Use to create web servers
* Use [flask_restplus][] to add more fucntionality for REST APIs e.g. autogenerate Swagger docs.
* `api` object has built in logger. By default logs input requests. Can use the standard Python [logging](https://docs.python.org/3/howto/logging.html#logging-basic-tutorial) features to control it.
* Can use sys.argv to pass command line arguments to it
* To expose on the network then [bind to 0.0.0.0](https://stackoverflow.com/a/7027113/1131820).

[flask_restplus]: https://flask-restplus.readthedocs.io/en/latest/index.html
[Flake8]: https://pypi.python.org/pypi/flake8/
[Pylint]: https://www.pylint.org/
[Bandit]: https://github.com/openstack/bandit
[yapf]: https://github.com/google/yapf
