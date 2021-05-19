#!/bin/bash

if git log -1 ; then
    cd ${{ inputs.repo-path }}
    echo "::set-output name=last-commit::$( echo $(git log -1))"
else
    echo "::set-output name=last-commit::$( echo failed to get git log)"
fi
