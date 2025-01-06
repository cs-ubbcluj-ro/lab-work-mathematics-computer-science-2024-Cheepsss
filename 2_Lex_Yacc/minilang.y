%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
void yyerror(const char *s);
extern FILE *yyin;

int production_index = 1; // Track production index
%}

%union {
    int iVal;
    char* sVal;
}

%token <iVal> INTEGER_CONST
%token <sVal> STRING_CONST
%token <sVal> ID
%token INT STRING STRUCT MAIN
%token LBRACE RBRACE LPAREN RPAREN SEMICOLON ASSIGN
%token IF ELSE WHILE CIN COUT
%token EQ NE AND OR

%start Start

%left OR
%left AND
%left EQ NE
%left '<' '>'
%left '+' '-'
%left '*' '/' '%'

%%

Start:
    INT MAIN LPAREN RPAREN LBRACE code_block RBRACE {
        printf("Production %d: Program syntactic correct\n", production_index++);
    }
    ;

code_block:
    declaration_block code_block {
        printf("Production %d: Code block with declarations\n", production_index++);
    }
    | instruction code_block {
        printf("Production %d: Code block with instructions\n", production_index++);
    }
    | declaration_block {
        printf("Production %d: Single declaration block\n", production_index++);
    }
    | instruction {
        printf("Production %d: Single instruction block\n", production_index++);
    }
    ;

instruction:
    if_statement {
        printf("Production %d: If statement\n", production_index++);
    }
    | while_statement {
        printf("Production %d: While statement\n", production_index++);
    }
    | cin_statement {
        printf("Production %d: Cin statement\n", production_index++);
    }
    | cout_statement {
        printf("Production %d: Cout statement\n", production_index++);
    }
    | assignment {
        printf("Production %d: Assignment\n", production_index++);
    }
    ;

if_statement:
    IF LPAREN condition RPAREN LBRACE code_block RBRACE {
        printf("Production %d: If block\n", production_index++);
    }
    | IF LPAREN condition RPAREN LBRACE code_block RBRACE ELSE LBRACE code_block RBRACE {
        printf("Production %d: If-Else block\n", production_index++);
    }
    ;

while_statement:
    WHILE LPAREN condition RPAREN LBRACE code_block RBRACE {
        printf("Production %d: While loop\n", production_index++);
    }
    ;

cin_statement:
    CIN ID SEMICOLON {
        printf("Production %d: Cin statement for %s\n", production_index++, $2);
    }
    ;

cout_statement:
    COUT expression SEMICOLON {
        printf("Production %d: Cout statement\n", production_index++);
    }
    ;

declaration_block:
    decl_var SEMICOLON {
        printf("Production %d: Declaration block\n", production_index++);
    }
    ;

decl_var:
    INT ID {
        printf("Production %d: Declared int variable %s\n", production_index++, $2);
    }
    | STRING ID {
        printf("Production %d: Declared string variable %s\n", production_index++, $2);
    }
    | STRUCT ID LBRACE declaration_block RBRACE {
        printf("Production %d: Declared struct %s\n", production_index++, $2);
    }
    ;

assignment:
    ID ASSIGN expression SEMICOLON {
        printf("Production %d: Assignment to variable %s\n", production_index++, $1);
    }
    ;

expression:
    operand {
        printf("Production %d: Expression operand\n", production_index++);
    }
    | expression '+' expression {
        printf("Production %d: Expression addition\n", production_index++);
    }
    | expression '-' expression {
        printf("Production %d: Expression subtraction\n", production_index++);
    }
    | expression '%' expression {
        printf("Production %d: Expression modulo\n", production_index++);
    }
    ;

operand:
    ID {
        printf("Production %d: Operand variable %s\n", production_index++, $1);
    }
    | INTEGER_CONST {
        printf("Production %d: Operand constant %d\n", production_index++, $1);
    }
    | STRING_CONST {
        printf("Production %d: Operand constant %s\n", production_index++, $1);
    }
    ;

condition:
    expression '<' expression {
        printf("Production %d: Condition less than\n", production_index++);
    }
    | expression '>' expression {
        printf("Production %d: Condition greater than\n", production_index++);
    }
    | expression EQ expression {
        printf("Production %d: Condition equal\n", production_index++);
    }
    | expression NE expression {
        printf("Production %d: Condition not equal\n", production_index++);
    }
    | condition AND condition {
        printf("Production %d: Condition AND\n", production_index++);
    }
    | condition OR condition {
        printf("Production %d: Condition OR\n", production_index++);
    }
    | LPAREN condition RPAREN {
        printf("Production %d: Parenthesized condition\n", production_index++);
    }
    ;

%%

void yyerror(const char *s) {
    extern char *yytext;
    fprintf(stderr, "Error: %s at production %d, near token '%s'\n", s, production_index, yytext);
    exit(1);
}

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Could not open file");
            return 1;
        }
        yyin = file;
    } else {
        yyin = stdin;
    }
    if (!yyparse()) {
        printf("Program syntactic correct\n");
    }
    return 0;
}
