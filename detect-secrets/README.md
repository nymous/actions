# Detect secrets

A GitHub Action to check for secrets in a repository using
[Yelp/detect-secrets][detect-secrets GitHub].

:warning: Beware, once secrets are committed **it's too late**! You **have to**
revoke any password, API key or token first, then you can clean up the history
if you want. See https://help.github.com/en/articles/removing-sensitive-data-from-a-repository
for more information.

To better protect you, you should use detect-secrets as a pre-commit. See
https://github.com/Yelp/detect-secrets#client-side-pre-commit-hook for more
information on how to set it up.

## Usage

To use this action, create a Workflow like this:

```workflow
workflow "Check for secrets" {
  on = "push"
  resolves = [ "Run detect-secrets" ]
}

action "Run detect-secrets" {
  uses = "nymous/actions/detect-secrets@master"
}
```

The action detects if a `.secrets.baseline` file exists at the root of the
repository, and does a diff between the new scan and the old. If new secrets are
detected, the action errors out. If no `.secrets.baseline` file is found, then a
full scan is done on all commited files.

## Credits

Credits to Yelp for the [detect-secrets][detect-secrets GitHub] tool. I reused a
few of their tainted files to test this action.

[detect-secrets GitHub]: https://github.com/Yelp/detect-secrets
