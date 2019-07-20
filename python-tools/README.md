# Python tools

A GitHub Action for all Python needs. It comes preinstalled with useful tools
([Black][black], [Mypy][mypy], [Bandit][bandit], [Pylint][pylint]).

It also automatically installs dependencies if it finds (in this order, untested):
* `pyproject.toml` (with [Poetry][poetry])
* a `Pipfile` (with [Pipenv][pipenv])
* a `requirements.txt` (with pip)

To use it, create a Workflow action like this:

```workflow
action "Check Black" {
  uses = "nymous/actions/python-tools@master"
  args = "black . --check"
}
```

[poetry]: https://poetry.eustace.io/
[pipenv]: https://docs.pipenv.org/en/latest/
[black]: https://github.com/python/black
[pylint]: https://github.com/PyCQA/pylint
[pytest]: https://docs.pytest.org/en/latest/
[mypy]: http://mypy-lang.org/
[bandit]: https://github.com/PyCQA/bandit
