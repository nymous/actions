#!/bin/bash -l

set -euo pipefail

if [[ -f .secrets.baseline ]]; then
  detect-secrets scan --exclude-file .secrets.baseline > /tmp/.secrets.baseline
  python /diff.py
else
  DETECT_SECRETS_OUTPUT=$(detect-secrets scan)
  DETECT_SECRETS_HAS_RESULTS=$(jq -r '.results == {}' <<< "$DETECT_SECRETS_OUTPUT")
  if [[ "$DETECT_SECRETS_HAS_RESULTS" == "true" ]]; then
    echo "No secrets detected"
    exit 0
  else
    echo "Secrets detected!"
    echo $DETECT_SECRETS_OUTPUT | jq
    exit 1
  fi
fi
