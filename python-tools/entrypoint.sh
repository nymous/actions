#!/bin/bash -l

set -euo pipefail

first_command=${1:-}

if [[ -z "$first_command" ]]; then
  echo "You didn't run a command"
  exit 1
fi

if [[ -f "pyproject.toml" ]]; then
  if [[ $first_command != "poetry" ]]; then
    echo "Running while activating Poetry virtualenv..."
    sh -c "poetry run $*"
  fi
elif [[ -f "Pipfile" ]]; then
  if [[ $first_command != "pipenv" ]]; then
    echo "Running while activating Poetry virtualenv..."
    sh -c "pipenv run $*"
  fi
else
  sh -c "$*"
fi
