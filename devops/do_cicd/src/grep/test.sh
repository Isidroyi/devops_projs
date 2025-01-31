#!/bin/bash

./s21_grep e test.txt > s21_grep.txt
grep e test.txt > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi


./s21_grep -e "for" test.txt > s21_grep.txt
grep -e "for" test.txt > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -i e test.txt > s21_grep.txt
grep -i e test.txt > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -v e test.txt > s21_grep.txt
grep -v e test.txt > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -c e test.txt > s21_grep.txt
grep -c e test.txt > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -l e test.txt test.txt test.txt > s21_grep.txt
grep -l e test.txt test.txt test.txt > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -n e test.txt > s21_grep.txt
grep -n e test.txt > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -h e test.txt > s21_grep.txt
grep -h e test.txt > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -s e test.txt > s21_grep.txt
grep -s e test.txt > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep e s21_grep.c > s21_grep.txt
grep e s21_grep.c > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -e "for" s21_grep.c > s21_grep.txt
grep -e "for" s21_grep.c > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -i e s21_grep.c > s21_grep.txt
grep -i e s21_grep.c > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -v e s21_grep.c > s21_grep.txt
grep -v e s21_grep.c > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -c e s21_grep.c > s21_grep.txt
grep -c e s21_grep.c > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -l e s21_grep.c s21_grep.c s21_grep.c > s21_grep.txt
grep -l e s21_grep.c s21_grep.c s21_grep.c > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -n e s21_grep.c > s21_grep.txt
grep -n e s21_grep.c > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -h e s21_grep.c > s21_grep.txt
grep -h e s21_grep.c > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

./s21_grep -s e s21_grep.c > s21_grep.txt
grep -s e s21_grep.c > grep.txt
if diff -q s21_grep.txt grep.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    exit 1
fi

