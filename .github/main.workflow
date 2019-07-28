workflow "Test Python tools" {
  on = "push"
  resolves = [ "Run Bandit", "Run Black", "Run Mypy", "Run Pylint", "Run Pytest" ]
}

action "Run Bandit" {
  uses = "./python-tools"
  args = "cd python-tools/tests && bandit -r ."
}

action "Run Black" {
  uses = "./python-tools"
  args = "cd python-tools/tests && black . --check"
}

action "Run Mypy" {
  uses = "./python-tools"
  args = "cd python-tools && mypy tests --config-file tests/mypy.ini"
}

action "Run Pylint" {
  uses = "./python-tools"
  args = "cd python-tools && pylint tests --rcfile tests/pylintrc"
}

action "Run Pytest" {
  uses = "./python-tools"
  args = "cd python-tools/tests && pip install -r requirements.txt && pytest"
}


workflow "Test detect-secrets" {
  on = "push"
  resolves = [ "Run detect-secrets" ]
}

action "Run detect-secrets" {
  uses = "./detect-secrets"
}
