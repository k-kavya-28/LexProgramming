%{
    /*Lex program to remove comments from C program and save it in a file*/
%}

/*starting character sequence for multiline comment*/
start \/\/*
/*ending character sequence for multiline comment*/
end \*\/ 

%%

\/\/(.*) {};
\/\*(.*\n)*.*\*\/ {};

%%

int yywrap(){
    return 1;
}

int main() {
    yyin=fopen("input.c","r");
    yyout=fopen("output.c","w");

    yylex();

    fclose(yyin);
    fclose(yyout);

    return 0;
}