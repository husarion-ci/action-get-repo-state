# action-get-repo-state
This GitHub Action checks last commit in repo and saves that information into output variable. 

# Requirements

This action gets info on last commit in cloned repository. It was tested and
runs successfully on ubuntu runners.

# Overview

The action runs `git log -1` and forwards that information to output variable `last-commit`.

## Inputs

The action has the following input:

* `repo-path` (string): Path to repository. Needed only if repository is not in the current folder.
## Outputs

The action has the following outputs:

* `last-commit` (string):  Information about last commit.

# Example

The following example is a simple workflow that uses the action.
```
name: Version Bump
on:
  push:
    branch: master

jobs:

  get-bump:
    name: Get version bump
    runs-on: ubuntu-latest
    outputs:
      bump: ${{ steps.get-version-bump.outputs.bump }}
    steps:
      -
        name: Get version bump
        id: get-version-bump
        uses: husarion-ci/action-get-version-bump@v0.1.0

  bump-version:
    name: Bump version
    runs-on: ubuntu-latest
    needs: get-bump
    if: ${{ needs.get-bump.outputs.bump != 'none' }}
    steps:
      -
        name: Bump version
        run: echo "Bumping ${{ needs.get-bump.outputs.bump }} version"
```

In the example, this action is used in a separate `get-bump` job,
and the subsequent `bump-version` job is only run if the `get-bump`
detects a version bump command.