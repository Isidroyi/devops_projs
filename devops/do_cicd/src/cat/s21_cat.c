#include "s21_cat.h"

int main(int argc, char *argv[]) {
  //               b  e  n  t  s  v
  char flags[6] = {0, 0, 0, 0, 0, 0};
  int flag = 10;
  int error_flag = 0;
  for (int i = 1; i < argc; i++) {
    if (argv[i][0] == '-') {
      if (argv[i][1] == '-') {
        flag = 1;
        Parser(i, argv, flags, flag, &error_flag);
      } else {
        flag = 0;
        Parser(i, argv, flags, flag, &error_flag);
      }
    } else {
      if (error_flag) {
        exit(1);
      } else if (argv[i][1] != '-') {
        Cat_Print(i, argv, flags);
      }
    }
  }
  return 0;
}

void Parser(int i, char *argv[], char *flags, int flag, int *error_flag) {
  if (flag) {
    if (argv[i][0] == '-' || argv[i][1] == '-') {
      if (strcmp(argv[i], "--number-nonblak") == 0) {
        flags[0] = 1;
      } else if (strcmp(argv[i], "--number") == 0) {
        flags[2] = 1;
      } else if (strcmp(argv[i], "--squeeze-blank") == 0) {
        flags[4] = 1;
      } else {
        printf("%s is not argument\n", argv[i]);
        *error_flag = 1;
      }
    }
  } else {
    for (size_t k = 1; k < strlen(argv[i]); k++) {
      switch (argv[i][k]) {
        case 'b':
          flags[0] = 1;
          break;
        case 'e':
          flags[1] = 1;
          flags[5] = 1;
          break;
        case 'n':
          flags[2] = 1;
          break;
        case 's':
          flags[4] = 1;
          break;
        case 't':
          flags[3] = 1;
          flags[5] = 1;
          break;
        case 'v':
          flags[5] = 1;
          break;
        case 'T':
          flags[3] = 1;
          flags[5] = 1;
          break;
        case 'E':
          flags[1] = 1;
          flags[5] = 1;
          break;
        default:
          printf("%c is not argument\n", argv[i][k]);
          *error_flag = 1;
      }
    }
  }
}

int Cat_Print(int i, char *argv[], char *flags) {
  FILE *fp = fopen(argv[i], "r");
  if (fp == NULL) {
    printf("This file does not exist in this directory\n");
    return 0;
  } else {
    int str_count = 1;
    int empty_str_count = 0;
    int last_sym = '\n';

    while (1) {
      int ch = fgetc(fp);
      if (ch == EOF) {
        break;
      }
      if (flags[4] && ch == '\n' && last_sym == '\n') {
        empty_str_count++;
        if (empty_str_count > 1) {
          continue;
        }
      } else {
        empty_str_count = 0;
      }
      if (last_sym == '\n' && ((flags[0] && ch != '\n') || flags[2])) {
        printf("%6d\t", str_count++);
      }
      if (flags[3] && ch == '\t') {
        printf("^");
        ch = 'I';
      }
      if (flags[1] && ch == '\n') {
        printf("$");
      }
      if (flags[5]) {
        if ((ch >= 0 && ch < 9) || (ch > 10 && ch < 32)) {
          printf("^");
          ch += 64;
        }
      }
      printf("%c", ch);
      last_sym = ch;
    }
  }
  fclose(fp);
  return 0;
}
