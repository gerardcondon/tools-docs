# Snippets

## SFTP a file

```python
    import paramiko
    
    def fetch_remote_file(hostname, username, password, remote_file_path, local_file_path):
        with paramiko.Transport(hostname, 22) as transport:
            transport.connect(username, password)
            with paramiko.sftp_client.SFTPClient.from_transport(transport) as sftp:
                sftp.get(remote_file_path, local_file_path)
```

## Memoize a function

```python
from functools import wraps

def memoize(func):
    @wraps(func)
    def memoizer(*args, **kwargs):
        key = func.__name__ + str(<something dependent on the input params>)
        if cache_enabled:
            cached_value = cache.get(key, None)
            if cached_value is not None:
                return cached_value
        result = func(*args, **kwargs)
        cache.set(key, result)
        return result
    return memoizer
```

* Reference - [Ned Batchelder](https://nedbatchelder.com/blog/201601/isolated_memoize.html)

## File
* list all entries in a directory - `return [f.name for f in os.scandir(self.data_folder) if f.is_dir()]`
* read contents of a file - `contents = Path(file_path).read_text()`

## Misc
* Combine array of strings to single string `''.join(str_list)`
* String interpolation `"Input string goes here %s" % str_value`
* To convert a list of strings in the correct order to a NamedTuple use `MyNamedTuple._make(str_list)`

## Map
* Map a function on a list `list(map(func, orig_list))`
* Can use a lambda if you want to modify the element `list(map(lambda x: func(x.foo()), orig_list))`
* Result can be passed to functions like `list()` or `set()`
* Equivalent to list comprehensions `[func(x) for x in orig_list]`
