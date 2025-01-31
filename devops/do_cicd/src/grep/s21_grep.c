#include "s21_grep.h"

int main(int argc, char* argv[]) {
  struct Options options = {0};

  int file_num = 0;
  char patt[256] = {};
  char files[256][256] = {};
  for (int i = 1; i < argc; i++) {
    int opt = read_option(argv[i], &options, patt);
    if ((!opt) && !(*patt)) {
      strcpy(patt, argv[i]);
    } else if (!opt) {
      strcpy(files[file_num], argv[i]);
      file_num++;
    }
  }

  if (options.only_matching && !options.invert_match &&
      !options.files_with_matches && !options.count) {
    for (int i = 0; i < file_num; i++) {
      o_function(patt, files[i], file_num, options);
    }
  } else {
    for (int i = 0; i < file_num; i++) {
      print_function(files[i], options, patt, file_num);
    }
  }
  return 0;
}

int read_option(const char* str, struct Options* opt, char* patt) {
  int is_opt = 0;
  if (str[0] == '-') {
    int patt_count = 0;
    is_opt = 1;
    for (size_t i = 1; i < strlen(str); i++) {
      if ((*opt).regexp_o || (*opt).file_o) {
        patt[patt_count] = str[i];
        patt_count++;
      }
      if ((*opt).file_o) {
        get_pattern_from_file(patt);
      }

      switch (str[i]) {
        case 'f':
          if (!(*opt).regexp_o && !(*opt).file_o) opt->file_o = 1;
          break;
        case 'i':
          if (!(*opt).regexp_o && !(*opt).file_o) opt->ignore_case = 1;
          break;
        case 's':
          if (!(*opt).regexp_o && !(*opt).file_o) opt->no_messages = 1;
          break;
        case 'v':
          if (!(*opt).regexp_o && !(*opt).file_o) opt->invert_match = 1;
          break;
        case 'n':
          if (!(*opt).regexp_o && !(*opt).file_o) opt->line_number = 1;
          break;
        case 'h':
          if (!(*opt).regexp_o && !(*opt).file_o) opt->no_filename = 1;
          break;
        case 'o':
          if (!(*opt).regexp_o && !(*opt).file_o) opt->only_matching = 1;
          break;
        case 'l':
          if (!(*opt).regexp_o && !(*opt).file_o) opt->files_with_matches = 1;
          break;
        case 'c':
          if (!(*opt).regexp_o && !(*opt).file_o) opt->count = 1;
          break;
        case 'e':
          if (!(*opt).regexp_o && !(*opt).file_o) opt->regexp_o = 1;
          break;
        default:
          fprintf(stderr, "%c: uknown option\n", str[i]);
          break;
      }
    }
  }
  return is_opt;
}

int has_pattern(char* patt, char* str, int regist_check) {
  regex_t regex;
  int has_match = 0;
  int reti = 0;

  if (regist_check)
    reti = regcomp(&regex, patt, REG_ICASE);  // обработка i-флага
  else
    reti = regcomp(&regex, patt, 0);

  if (reti) {
    fprintf(stderr, "Could not compile regex\n");
    return -1;
  }
  reti = regexec(&regex, str, 0, NULL, 0);
  if (!reti) {
    has_match = 1;
  }
  regfree(&regex);
  return has_match;
}

int print_function(const char* filename, struct Options options, char* patt,
                   int file_num) {
  char line[5096] = {};

  int count_of_printline = 0;

  FILE* fp = fopen(filename, "r");
  if (fp) {
    int num_line = 0;

    while (fgets(line, sizeof(line), fp)) {
      int has_match = 0;
      if (line[strlen(line) - 1] != '\n') strcat(line, "\n");
      num_line++;
      has_match = has_pattern(patt, line, options.ignore_case);
      if (options.invert_match) {
        has_match = (has_match + 1) % 2;
      }
      if (file_num > 1 && !options.no_filename && has_match && !options.count &&
          !options.files_with_matches)
        printf("%s:", filename);
      if (options.line_number && has_match && !options.count &&
          !options.files_with_matches)
        printf("%d:", num_line);
      if (!options.count && !options.files_with_matches && has_match)
        printf("%s", line);
      count_of_printline += has_match;
    }

    if (options.files_with_matches) {
      count_of_printline = count_of_printline ? 1 : 0;
      if (options.count) {
        if (file_num > 1 && !options.no_filename) printf("%s:", filename);
        printf("%d\n", count_of_printline);
      }
      if (count_of_printline) printf("%s\n", filename);
    } else if (options.count) {
      if (file_num > 1 && !options.no_filename) printf("%s:", filename);
      printf("%d\n", count_of_printline);
    }

    fclose(fp);
  } else {
    if (!options.no_messages)
      fprintf(stderr, "%s: No such file or directory\n", filename);
  }
  return 0;
}

int get_pattern_from_file(char* patt) {
  FILE* fp = fopen(patt, "r");
  if (fp) {
    fgets(patt, sizeof(patt), fp);
    fclose(fp);
  } else
    fprintf(stderr, "%s: No such file or directory\n", patt);
  return 0;
}

int o_function(char* patt, const char* filename, int file_num,
               struct Options options) {
  regex_t regex;
  regmatch_t match;
  char line[5096] = {};
  int reti = 0;
  if (options.ignore_case)
    reti = regcomp(&regex, patt, REG_ICASE);  // обработка i-флага
  else
    reti = regcomp(&regex, patt, 0);

  if (reti) {
    fprintf(stderr, "Could not compile regex\n");
    return -1;
  }

  FILE* fp = fopen(filename, "r");
  if (fp) {
    int num_line = 0;
    while (fgets(line, sizeof(line), fp)) {
      num_line++;
      char* current_pos = line;
      while (1) {
        reti = regexec(&regex, current_pos, 1, &match, 0);
        if (reti) {
          break;
        }

        if (file_num > 1 && !options.no_filename) printf("%s:", filename);
        if (options.line_number) printf("%d:", num_line);
        printf("%.*s\n", (int)(match.rm_eo - match.rm_so),
               current_pos + match.rm_so);
        current_pos += match.rm_eo;
      }
    }
    fclose(fp);
  } else {
    if (!options.no_messages)
      fprintf(stderr, "%s: No such file or directory\n", filename);
  }
  regfree(&regex);
  return 0;
}
