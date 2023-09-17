%{
/*3. Write a Lex program to identify and count the number of even and odd numbers in a given input
file.*/

#include<stdio.h>
int ecount,ocount=0;

%}

digit [0-9]

%%

{digit}+ {
	int num = atoi(yytext);
	if(num % 2 == 0) {
		printf("Even number: %d\n", num);
		ecount++;
	} else {
		printf("Odd number: %d\n", num);
		ocount++;
	}
}

%%

int yywrap(){
    return 1;
}

int main(){
    yyin=fopen("5_3_input.txt","r");

    yylex();

    printf("Even Count: %d\n",ecount);
    printf("Odd Count: %d\n",ocount);
    fclose(yyin);
    return 0;
}