%{
#include <stdio.h>
#include "symbol_table.h"   
#include "pif.h"        

extern int add_to_symbol_table(char *token);
extern void add_to_pif(const char *token, int index);
%}

%%

"int"         { add_to_pif("int", -1); }
"while"       { add_to_pif("while", -1); }
"string"      { add_to_pif("str", -1); }
"struct"      { add_to_pif("struct", -1); }
"cin"         { add_to_pif("cin", -1); }
"cout"        { add_to_pif("cout", -1); }
"main"        { add_to_pif("main", -1);}

"="           { add_to_pif("=", -1); }
"<"           { add_to_pif("<", -1); }
"+"           { add_to_pif("+", -1); }
";"           { add_to_pif(";", -1); }
"{"           { add_to_pif("{", -1); }
"}"           { add_to_pif("}", -1); }
"("           { add_to_pif("(", -1); }
")"           { add_to_pif(")", -1); }
"<<"          { add_to_pif("<<", -1); }
">>"          { add_to_pif(">>", -1); }

-?[1-9][0-9]*        {
                int index = add_to_symbol_table(yytext); 
                add_to_pif("int_c", index);
              }

\"[^\"]*\"    { 
                int index = add_to_symbol_table(yytext); 
                add_to_pif("str_c", index);
                // [^\"] sa nu fie "
              }

[a-zA-Z_][a-zA-Z0-9_]* {
                int index = add_to_symbol_table(yytext); 
                add_to_pif("ID", index);
              }

[ \t]+        { }
\n            { }

.             { printf("Lexical error at line %d: %s\n", yylineno, yytext); }

%%

int main(int argc, char *argv[]) {
    init_symbol_table();
    init_pif();

    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Could not open source file");
            return 1;
        }
        yyin = file;
    }
    
    yylex(); // Perform lexical analysis

    // Print PIF and Symbol Table
    print_pif();
    print_symbol_table();

    return 0;
}
