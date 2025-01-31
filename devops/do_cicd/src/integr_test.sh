#!/bin/bash

cd cat

RESULT=$(bash test.sh | grep "Файлы различны")
if [ $? -eq 0 ]; then
    echo "$RESULT"
    echo "Fail!"
    exit 1
fi
cd ../grep
RESULT=$(bash test.sh | grep "Файлы различны")
if [ $? -eq 0 ]; then
    echo "$RESULT"
    echo "Fail!"
    exit 1
fi
exit 0