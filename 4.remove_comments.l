%{
    /*Lex program to remove comments from C program and save it in a file*/
%}

/*starting character sequence for multiline comment*/
start \/\*
/*ending character sequence for multiline comment*/
end \*\/ 

%%

\/\/(.*);
{start}.*{end};

%%

int main() {
    yyin=fopen("input.c","r");
    yyout=fopen("output.c","w");

    yylex();

    fclose(yyin);
    fclose(yyout);

    return 0;
}