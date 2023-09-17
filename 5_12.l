%{
/*1. Write a Lex program to find and print all numbers in an input file that contain a specific digit, such
as the digit 7.
2. Create a Lex program to identify and count binary numbers (numbers composed of only 0s and 1s) in an input file.*/

#include<stdio.h>
int binCount=0;

%}

digit [0-9]
bin [01]

%%

{digit}*7{digit}* {printf("Number %s contains 7\n",yytext);}

{bin}+ {binCount++;}

%%

int yywrap(){
    return 1;
}

int main(){
    yyin=fopen("5_12_input.txt","r");
    if(!yyin){
        printf("Error opening file\n");
        return -1;
    }

    yylex();

    printf("Binary Count: %d\n",binCount);
    fclose(yyin);
    return 0;
}