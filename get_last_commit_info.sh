#!/bin/bash
 
if git log -1 ; then
    echo "::set-output name=last-commit::$( echo $(git log -1))"
else
    echo "::set-output name=last-commit::$( echo failed to get git log)"
fi
