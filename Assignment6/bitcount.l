%{
    #include<stdio.h>
    #include "y.tab.h"
%}
%%

0 {return 0;}
1 {return 1;}
[\t]+ { }
"\n" {return EOL;}

%%
int yywrap(){
    return 1;
}