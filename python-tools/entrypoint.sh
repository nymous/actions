#!/bin/sh -l

set -euo pipefail

if [ -f "pyproject.toml" ]; then
  echo "Installing dependencies with Poetry..."
  poetry install
elif [ -f "Pipfile" ]; then
  echo "Installing dependencies with Pipenv..."
  pipenv install --system
elif [ -f "requirements.txt" ]; then
  echo "Installing dependencies with pip..."
  pip install -r requirements.txt
else
  echo "No dependencies detected"
fi

sh -c "$*"
