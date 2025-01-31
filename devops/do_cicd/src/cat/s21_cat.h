#ifndef CAT_H
#define CAT_H

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void Parser(int i, char *argv[], char *flags, int flag, int *error_flag);
int Cat_Print(int i, char **argv, char *info);

#endif