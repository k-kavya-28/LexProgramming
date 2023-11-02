%{

%}

%%
[ ]([ ])* {fprintf(yyout,"");}
([ ])*(\n)([ ])* {fprintf(yyout,"");}
%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("inp2.txt","r");
    yyout = fopen("out2.txt","w");
    yylex();
    return 0;
}