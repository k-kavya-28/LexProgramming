%{
/* 2. Write a LEX program to perform the following operations.
   Assume the file contains a sequence of words (groups of letters) separated by white space. Every
   time you encounter a word:
   a. If the first letter is a consonant, move it to the end of the word and then add "ay."
   b. If the first letter is a vowel, just add "ay" to the end of the word. All non-letters are copied intact to
      the output.
*/
%}

c [a-zA-Z]
vowel [aeiouAEIOU]
cons [^aeiouAEIOU]

%%

{vowel}{c}* {
    // If the first letter is a vowel, just add "ay" to the end of the word
    printf("TOKEN_WORD: %s\n", yytext);
    fprintf(yyout, "TOKEN_WORD: %s\n", yytext);
    printf("ay");
    fprintf(yyout, "ay");
}

{cons}{c}* {
    // If the first letter is a consonant, move it to the end of the word and then add "ay"
    char s[100];
    strcpy(s, yytext + 1); // Copy everything except the first character
    strncat(s, yytext, 1); // Append the first character
    strcat(s, "ay");
    printf("TOKEN_WORD: %s\n", s);        // Print the transformed word to the console
    fprintf(yyout, "TOKEN_WORD: %s\n", s); // Print the transformed word to the output file
}

[ \t\n]+ {
    // Copy spaces, tabs, and newlines as they are
    printf("%s", yytext);
    fprintf(yyout, "%s", yytext);
}

([^a-zA-Z \t\n]+) {
    // Non-letter characters are copied as it is
    printf("%s", yytext);
    fprintf(yyout, "%s", yytext);
}

%%

int main(){
    yyin = fopen("pigLatinInput.txt", "r");
    yyout = fopen("pigLatinOutput.txt", "w");
    
    // Loop to process tokens until the end of the file is reached
    while (yylex() != 0) {}
    
    fclose(yyin);
    fclose(yyout);
    return 0;
}
