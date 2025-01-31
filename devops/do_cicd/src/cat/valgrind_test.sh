#!/bin/bash

valgrind --tool=memcheck --leak-check=yes  ./s21_cat test.txt
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_cat -b s21_cat.c
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_cat -e s21_cat.c
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_cat -n s21_cat.c
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_cat -s s21_cat.c
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_cat -t s21_cat.c