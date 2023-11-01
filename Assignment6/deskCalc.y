%{
    #include<stdio.h>
    int flag = 0;
    int yylex(void);
    void yyerror(char* s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

expr: E {
    printf("\nResult=%d\n",$$);
    return 0;
};
E : E'+'E {$$=$1+$3;}
    | E'-'E {$$=$1-$3;}
    | E'*'E {$$=$1*$3;}
    | E'/'E {$$=$1/$3;}
    | E'%'E {$$=$1%$3;}
    | '('E')' {$$=$2;}
    | NUMBER {$$=$1;}
;
%%
void main(){
    printf("Enter arithmetic expr: \n");
    yyparse();

    if(flag==0){
        printf("Valid\n");
    }
}

void yyerror(char* s){
    printf("Invalid\n");
    flag = 1;
}