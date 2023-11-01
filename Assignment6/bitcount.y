%{
    #include<stdio.h>
    int yylex(void);
    void yyerror(const char* s);
    int tot=0;
%}

%token ZERO ONE
%token EOL

%%

S : L'.'L {printf("%d\n",tot);}
    |L    {printf("%d\n",tot);}
    ;
L : L B {tot=tot+$2;}
    |B {tot=tot+$1;}
    ;
B : ZERO {$$=1;}
    |ONE {$$=1;}
    ;

%%
int main(){
    printf("Enter binary number: \n");
    yyparse();
    return 0;
}
void yyerror(const char* s){
    printf("%s\n",s);
}