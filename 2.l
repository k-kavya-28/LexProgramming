%{
/*2. Write a program in LEX to recognize different tokens: Keywords, Identifiers, Constants, Operators and Punctuation symbols*/
%}

letter [a-zA-Z]
digit [0-9]
id ({letter}({letter}|{digit})*)
constant ({digit}+)
operator [+\-*/%]
punctuation ("\\."|","|":"|";"|"!"|"\\?"|"\\("|"\\)")

%%

"int"|"char"|"float"|"double"|"if"|"else"|"while"|"for"|"switch"|"return"|"main"|"printf" {printf("%s is a keyword\n", yytext);}
{id} {printf("%s is an identifier\n", yytext);}
{constant} {printf("%s is a constant\n", yytext);}
{operator} {printf("%s is an operator\n", yytext);}
{punctuation} {printf("%s is a punctuation\n", yytext);}

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
