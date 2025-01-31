#!/bin/bash

RESULT=$(clang-format -n *.c 2>&1)
if [[ $RESULT ]]; then
    echo "$RESULT"
    exit 1
fi

exit 0