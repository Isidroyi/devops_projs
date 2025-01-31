CC = gcc
FLAGS = -Wall -Werror -Wextra

all: clean clang s21_cat

s21_cat:
	$(CC) s21_cat.c $(FLAGS) -o s21_cat

clean:
	rm -rf s21_cat

clang:
	cp ../../materials/linters/.clang-format .