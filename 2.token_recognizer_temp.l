%{
    /* Program to recognize different tokens: */
%}

%%
/* Regular expressions for different tokens */
int|float|char|double|void       { printf("==>Keyword: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*           { printf("==>Identifier: %s\n", yytext); }
[0-9]+(\.[0-9]+)?                { printf("==>Constant: %s\n", yytext); }
[+\-*/=]                         { printf("==>Operator: %s\n", yytext); }
[(){};]                          { printf("==>Punctuation: %s\n", yytext); }
[ \t\n]                          ; /* Skip whitespace and newlines */
.                                { /* Ignore unrecognized characters */ }
%%

int main() {
    printf("Enter your code:\n");
    yylex();
    return 0;
}


/*
Explanation of the code:

%{ ... %}: The code within these delimiters is copied as-is to the generated C code.
%%: Separates the Lex rules section from the C code section.
Regular expressions define patterns for each type of token.
yytext contains the matched text of the token.
*/