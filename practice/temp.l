%{
#include<stdio.h>
#include "y.tab.c"
extern int yylval;
%}

%%

%%

int yywrap() {
    return 1;
}