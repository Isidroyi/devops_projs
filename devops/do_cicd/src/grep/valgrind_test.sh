#!/bin/bash

valgrind --tool=memcheck --leak-check=yes  ./s21_grep e s21_grep.c 
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -e "for" s21_grep.c 
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -i e s21_grep.c 
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -v e s21_grep.c 
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -c e s21_grep.c 
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -l e s21_grep.c 
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -n e s21_grep.c 
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -h e s21_grep.c 
echo "\n\n\n\n\n\n"
valgrind --tool=memcheck --leak-check=yes  ./s21_grep -s e s21_grep.c
echo "\n\n\n\n\n\n"
#valgrind --tool=memcheck --leak-check=yes  ./s21_grep -f pattern s21_grep.c
