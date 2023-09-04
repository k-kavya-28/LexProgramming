%{
/* Write lex program for
   a. The set of all strings such that the 10th symbol from the right end is 1.
   b. The set of all four digits numbers whose sum is 9 */
%}

d [0-9]

%%

(({d})*1{d}{9}) {printf("%s is a string having 1 as the 10th symbol from right end.  \n",yytext);}

{d}{d}{d}{d} {
    int num = atoi(yytext); //Converting matched digits to an integer
    int sum=0;
    int temp=num;
    while(temp>0){
        sum+=temp%10;
        temp/=10;
    }
    if(sum==9){
        printf("%s is a string such that sum of digits is 9. \n",yytext);
    }
    else{
        printf("%s Invalid string \n",yytext);
    }
}

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}