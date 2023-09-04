%{
/* Write lex program for
   a. The set of all strings such that the 10th symbol from the right end is 1.
   b. The set of all four digits numbers whose sum is 9 */
%}

d [0-9]
d9 [1-9][0-9][0-9][0-9]

%%

(({d})*1{d}{9}) {printf("%s is a string having 10th symbol from right end is 1 \n",yytext);}
 

%%

// int sum(int n){
//     int s=0;
//     while(n>0){
//         s+=n%10;
//         n/=10;
//     }
//     return s;
// }

// int main(){
//     int num;
//     for(num=1000; num<=9999; num++){
//         if(sum(num)==9){
//             printf("%d ",num);
//         }
//     }
//     return 0;
// }

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}