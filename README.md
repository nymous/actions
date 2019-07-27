# Nymous GitHub Actions

A repository to hold all my [GitHub Actions](https://github.com/features/actions)

## Usage

Choose any action from the [list](#List-of-actions), and add it to you workflow like this:

```workflow
workflow "Run my action" {
  on = "push"
  resolves = [ "Nymous action" ]
}

action "Nymous action" {
  uses = "nymous/actions/python-tools@master"
  args = "black . --check"
}
```

## List of actions

* [Python tools](./python-tools): run commands with a Python environment. Usual tools such as Black, Mypy, Bandit, or Pylint are already installed.

## Credits

Credits to [abatilo/actions-poetry](https://github.com/abatilo/actions-poetry),
I didn't search for Python actions before I started working on this one, but
while debugging his action made me realize that the workspace is shared between
all actions. Also my example workflow changed to look more like his, with an
action to install dependencies before anything else.
