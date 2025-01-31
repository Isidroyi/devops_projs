#!/bin/bash

rm -rf s21_cat.txt cat.txt
#cat -t
./s21_cat -t test.txt >> s21_cat.txt
cat -t test.txt >> cat.txt
if diff -q s21_cat.txt cat.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    #exit 1
fi
rm -rf s21_cat.txt cat.txt
#cat without flags
./s21_cat s21_cat.c >> s21_cat.txt
cat s21_cat.c >> cat.txt
if diff -q s21_cat.txt cat.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    #exit 1
fi
rm -rf s21_cat.txt cat.txt
#cat -b
./s21_cat -b s21_cat.c >> s21_cat.txt
cat -b s21_cat.c >> cat.txt
if diff -q s21_cat.txt cat.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    #exit 1
fi
rm -rf s21_cat.txt cat.txt
#cat -e
./s21_cat -e s21_cat.c >> s21_cat.txt
cat -e s21_cat.c >> cat.txt
if diff -q s21_cat.txt cat.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    #exit 1
fi
rm -rf s21_cat.txt cat.txt
#cat -n
./s21_cat -n s21_cat.c >> s21_cat.txt
cat -n s21_cat.c >> cat.txt
if diff -q s21_cat.txt cat.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    #exit 1
fi
rm -rf s21_cat.txt cat.txt
#cat -s
./s21_cat -s s21_cat.c >> s21_cat.txt
cat -s s21_cat.c >> cat.txt
if diff -q s21_cat.txt cat.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    #exit 1
fi
rm -rf s21_cat.txt cat.txt
#cat -t
./s21_cat -t s21_cat.c >> s21_cat.txt
cat -t s21_cat.c >> cat.txt
if diff -q s21_cat.txt cat.txt >/dev/null; then
    echo "Файлы одинаковы"
else
    echo "Файлы различны"
    #exit 1
fi
rm -rf s21_cat.txt cat.txt