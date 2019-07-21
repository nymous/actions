workflow "Test actions" {
  on = "push"
  resolves = [ "Test python-tools" ]
}

action "Run Bandit" {
  uses = "nymous/actions/python-tools@master"
  args = "cd python-tools/tests && bandit -r ."
}

action "Run Black" {
  uses = "nymous/actions/python-tools@master"
  args = "cd python-tools/tests && black . --check"
}

action "Run Mypy" {
  uses = "nymous/actions/python-tools@master"
  args = "cd python-tools && mypy tests --config-file tests/mypy.ini"
}

action "Run Pylint" {
  uses = "nymous/actions/python-tools@master"
  args = "cd python-tools && pylint tests --rcfile tests/pylintrc"
}

action "Run Pytest" {
  uses = "nymous/actions/python-tools@master"
  args = "cd python-tools/tests && pip install -r requirements.txt && pytest"
}

action "Test python-tools" {
  uses = "docker://alpine:latest"
  args = "true"
  needs = ["Run Bandit", "Run Black", "Run Mypy", "Run Pylint", "Run Pytest"]
}
