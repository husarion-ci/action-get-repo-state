#!/bin/bash
 
if git status; then
    echo "::set-output name=last-commit::$( echo `git describe --tags` `git rev-parse HEAD`)"
else
    echo "::set-output name=last-commit::$( echo failed to get: git describe --tags git rev-parse HEAD)"
fi
