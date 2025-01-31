CC = gcc
FLAGS = -Wall -Werror -Wextra

all: clean clang s21_grep

s21_grep:
	$(CC) s21_grep.c $(FLAGS) -o s21_grep

clean:
	rm -rf s21_grep

clang:
	cp ../../materials/linters/.clang-format .