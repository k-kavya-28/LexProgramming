%{

%}
digit [0-9]
num {digit}+
snum [+-]?{num}
%%
{snum}\.{num} {printf("%s yes",yytext);}
{snum} {printf("%s no",yytext);}

%%
int main(){
    printf("enter: ");
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}