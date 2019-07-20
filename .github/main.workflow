workflow "Test actions" {
  on = "push"
  resolves = [ "Test python-tools" ]
}

action "Run Black" {
  uses = "nymous/actions/python-tools@master"
  args = "cd python-tools/tests && black . --check"
}

action "Run Mypy" {
  uses = "nymous/actions/python-tools@master"
  args = "cd python-tools/tests && mypy ."
}

action "Run Bandit" {
  uses = "nymous/actions/python-tools@master"
  args = "cd python-tools/tests && bandit -r ."
}

action "Run Pylint" {
  uses = "nymous/actions/python-tools@master"
  args = "cd python-tools && pylint tests --rcfile tests/pylintrc"
}

action "Run Pytest" {
  uses = "nymous/actions/python-tools@master"
  args = "cd python-tools/tests && pytest"
}

action "Test python-tools" {
  uses = "./"
  args = "true"
  needs = ["Run Black", "Run Mypy", "Run Bandit", "Run Pylint"]
}
