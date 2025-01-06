%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT}|_)*
STRING      \"[^\"]*\"
WHITESPACE  [ \t\n]+

%%

"int"       { printf("Token: INT, Value: %s\n", yytext); return INT; }
"string"    { printf("Token: STRING, Value: %s\n", yytext); return STRING; }
"struct"    { printf("Token: STRUCT, Value: %s\n", yytext); return STRUCT; }
"main"      { printf("Token: MAIN, Value: %s\n", yytext); return MAIN; }
"if"        { printf("Token: IF, Value: %s\n", yytext); return IF; }
"else"      { printf("Token: ELSE, Value: %s\n", yytext); return ELSE; }
"while"     { printf("Token: WHILE, Value: %s\n", yytext); return WHILE; }
"cin>>"     { printf("Token: CIN, Value: %s\n", yytext); return CIN; }
"cout<<"    { printf("Token: COUT, Value: %s\n", yytext); return COUT; }

"{"         { printf("Token: LBRACE, Value: %s\n", yytext); return LBRACE; }
"}"         { printf("Token: RBRACE, Value: %s\n", yytext); return RBRACE; }
"("         { printf("Token: LPAREN, Value: %s\n", yytext); return LPAREN; }
")"         { printf("Token: RPAREN, Value: %s\n", yytext); return RPAREN; }
";"         { printf("Token: SEMICOLON, Value: %s\n", yytext); return SEMICOLON; }
"="         { printf("Token: ASSIGN, Value: %s\n", yytext); return ASSIGN; }
"+"         { printf("Token: '+', Value: %s\n", yytext); return '+'; }
"-"         { printf("Token: '-', Value: %s\n", yytext); return '-'; }
"*"         { printf("Token: '*', Value: %s\n", yytext); return '*'; }
"/"         { printf("Token: '/', Value: %s\n", yytext); return '/'; }
"%"         { printf("Token: '', Value: %s\n", yytext); return '%'; }
"<"         { printf("Token: '<', Value: %s\n", yytext); return '<'; }
">"         { printf("Token: '>', Value: %s\n", yytext); return '>'; }
"=="        { printf("Token: EQ, Value: %s\n", yytext); return EQ; }
"!="        { printf("Token: NE, Value: %s\n", yytext); return NE; }
"&&"        { printf("Token: AND, Value: %s\n", yytext); return AND; }
"||"        { printf("Token: OR, Value: %s\n", yytext); return OR; }

{DIGIT}+ {
    yylval.iVal = atoi(yytext);
    printf("Token: INTEGER_CONST, Value: %s\n", yytext);
    return INTEGER_CONST;
}

{STRING} {
    yylval.sVal = strdup(yytext);
    printf("Token: STRING_CONST, Value: %s\n", yytext);
    return STRING_CONST;
}

{ID} {
    yylval.sVal = strdup(yytext);
    printf("Token: ID, Value: %s\n", yytext);
    return ID;
}

{WHITESPACE} {
    // Ignore whitespaces
}

. {
    printf("Lexical error: unrecognized token %s\n", yytext);
}

%%

int yywrap() {
    return 1;
}
