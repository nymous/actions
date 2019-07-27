# Python tools

A GitHub Action for all Python needs. It comes preinstalled with useful tools
([Black][black], [Mypy][mypy], [Bandit][bandit], [Pylint][pylint]).

To use it, create a Workflow action like this:

```workflow
workflow "Check code" {
  on = "push"
  resolves = [ "Check Black", "Check security issues" ]
}

action "Install dependencies" {
  uses = "nymous/actions/python-tools@master"
  args = "poetry install"
}

action "Check Black" {
  needs = [ "Install dependencies" ]
  uses = "nymous/actions/python-tools@master"
  args = "black . --check"
}

action "Check security issues" {
  needs = [ "Install dependencies" ]
  uses = "nymous/actions/python-tools@master"
  args = "bandit -r ."
}
```

It automatically prefixes the command with a `poetry run` or a `pipenv run` if a
dependency file is detected (`pyproject.toml` or `Pipfile`) and the first word
isn't `poetry` or `pipenv` itself.

## Credits

Credits to [abatilo/actions-poetry](https://github.com/abatilo/actions-poetry),
I didn't search for Python actions before I started working on this one, but
while debugging his action made me realize that the workspace is shared between
all actions. Also my example workflow changed to look more like his, with an
action to install dependencies before anything else.

[poetry]: https://poetry.eustace.io/
[pipenv]: https://docs.pipenv.org/en/latest/
[black]: https://github.com/python/black
[pylint]: https://github.com/PyCQA/pylint
[pytest]: https://docs.pytest.org/en/latest/
[mypy]: http://mypy-lang.org/
[bandit]: https://github.com/PyCQA/bandit
