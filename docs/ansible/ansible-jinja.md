# Jinja

{% raw %}
## Filters
* Part of `jinja2` but Ansible ships with its own also.
* Can transform data e.g. `{{ my_var | to_nice_json }}`.
* Can operate on lists e.g. `{{ list1 | min }}`.

## Tests
* Used for comparison e.g. `url is match("http://blah")`
* To test against strings use `match` or `search`
* Can use `version(num, operator)` to check version
* Can use `issubset` and `issuperset` for list containment
* Can use `is directory`, `is file` etc for path operations
* Use tests in a `when: ` clause to trigger

## Lookups
* Way to query external data sources e.g. `"{{ lookup('file', '/etc/stuff') }}"`
{% endraw %}