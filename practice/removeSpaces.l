%{

%}
s[ ]
%%
[ ]([ ])* {fprintf(yyout," ");}
([ ])*(\n)([ ])* {fprintf(yyout," ");}
%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("inp1.txt","r");
    yyout = fopen("out1.txt","w");
    yylex();
    return 0;
}