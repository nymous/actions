# Nymous GitHub Actions

A repository to hold all my [GitHub Actions](https://github.com/features/actions)

## Usage

Choose any action from the [list](#List-of-actions), and add it to you workflow
like this:

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
* [Detect secrets](./detect-secrets): scan a repository for secrets, optionally comparing with a baseline.

## Credits

See each individual README for credits.

## License

[MIT](./LICENSE)
