%{
/*Write a LEX program to recognize the following tokens over the alphabets {0,1,..,9}
a) The set of all string ending in 00.
b) The set of all strings with three consecutive 222’s.
c) The set of all string such that every block of five consecutive symbols contains at
least two 5’s.*/
%}

%%

[0-9]*00 {printf("String ending in 00 : %s\n",yytext);}
[0-9]*222[0-9]* {printf("String with three consecutive 222s : %s\n", yytext);}
([0-9]*5[0-9]*5[0-9]*)+ {printf("String such that every block of five consecutive symbols contains at least two 5's: %s\n",yytext);}

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}