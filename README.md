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
name: Get last commit info
on:
  push:
    branch: master

jobs:
  push_to_registry:
    name: example workflow
    runs-on: ubuntu-latest
    steps:
      - 
        name: Checkout cartographer_ros
        uses: actions/checkout@v2
        with:
          path: 'some_path' 
      -
        name: last-commit
        id: last-commit
        uses: husarion-ci/action-get-repo-state@v0.1.2
        with:
          repo-path: 'some_path' 
      -
        name: print
        run:  |
          echo ${{ steps.last-commit.outputs.last-commit }}  

```

