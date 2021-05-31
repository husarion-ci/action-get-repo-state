#!/bin/bash
if git fetch --unshallow; then
    git fetch --tags
    ref="`git describe --tags` `git rev-parse HEAD`"
    echo "ref=$ref" >> $GITHUB_ENV
else
    ref="failed to get: git describe --tags git rev-parse HEAD)"
    echo "ref=$ref" >> $GITHUB_ENV
fi

echo "writing $ref to: $GITHUB_ENV"