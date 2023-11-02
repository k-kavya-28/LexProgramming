%{

%}

digit [0-9]
alpha [a-zA-Z]
id  ({alpha}({digit}|{alpha})*)
constants ({digit}+)
operators [+\-*/%]
punctuation ("."|","|"("|")")


%%

"if"|"else"|"main"|"int"    {printf("%s is keyword \n",yytext);}
{id}                        {printf("%s is an identifier \n",yytext);}
{constants}                 {printf("%s is constant \n",yytext);}
{operators}                 {printf("%s is an operator \n",yytext);}
{punctuation}               {printf("%s is punctuation \n",yytext);}
[\t]                        {;}
[\n]                        {return 0;}

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}