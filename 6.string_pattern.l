%{
/* Write lex program for
   a. The set of all strings such that the 10th symbol from the right end is 1.
   b. The set of all four digits numbers whose sum is 9 */
%}

d [0-9]

%%

({d})*{d}{9} {printf("%s is a string having 10th symbol from right end is 1 \n",yytext);}

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}