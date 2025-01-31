#include <ctype.h>
#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
struct Options {
  int regexp_o;
  int file_o;
  int ignore_case;
  int no_messages;
  int invert_match;
  int line_number;
  int no_filename;
  int only_matching;
  int files_with_matches;
  int count;
};
int has_pattern(char* patt, char* str, int regist_check);
int read_option(const char* str, struct Options* opt, char* patt);
int print_function(const char* filename, struct Options options, char* patt,
                   int file_num);
int get_pattern_from_file(char* patt);
int o_function(char* patt, const char* filename, int file_num,
               struct Options options);