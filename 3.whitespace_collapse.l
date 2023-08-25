%{
// Write a LEX program that copies a file, replacing each nonempty sequence of white spaces
// by a single blank.
%}

s[ ]

%%

[ ]([ ])* { /* Pattern for recognizing multiple spaces */
fprintf(yyout," ");
}
([ ])*(\n)([ ])* { /* spaces followed by newline followed by
spaces */
fprintf(yyout," ");
}

%%

int main()
{
// Point yyin to a file with text, this acts as input to
// our program
yyin = fopen("text1.txt","r");
// Point yyout to output file.
yyout = fopen("text2.txt","w");
yylex();
return 0;
}