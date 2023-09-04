%{
/*2. Write a LEX program to perform following operations.
Assume the file is containing a sequence of words (groups of letters) separated by white space. Every
time you encounter a word:
a. If the first letter is a consonant, move it to the end of the word and then add ay.
b. If the first letter is a vowel, just add ay to the end of the word. All non-letters are copied intact to
the output.*/
%}

c[a-zA-Z]
vowel[aeiouAEIOU]
cons[^aeiouAEIOU]

%%

{vowel}{c}* {
    //copy yytext to an array and append "ay" to it
    char s[100];
    strcpy(s,yytext);
    strcat(s,"ay");
    printf("%s",s);
    fprintf(yyout,"%s",s);
}

{cons}{c}* {
    // move first letter to the end of word and then add "ay"
    char s[100];
    strcpy(s,yytext+1);  // Copy everything except the first character
    strncat(s,yytext,1); //same as strcat(s,yytext[0]) i.e. append the first character
    strcat(s,"ay");
    printf("%s",s);         // Print the transformed word to the console
    fprintf(yyout,"%s",s);  // Print the transformed word to the output file
}

([^c]+) {
    /*Non-letter characters are copied as it is*/
    printf("%s",yytext);
    fprintf(yyout,"%s",yytext);
}

%%

int yywrap(){
    return 1;
}

int main(){
    yyin=fopen("pigLatinInput.txt","r");
    yyout=fopen("pigLatinOutput.txt","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}