#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_ST_SIZE 1000

typedef struct {
    char symbol[50];
} SymbolTableEntry;

SymbolTableEntry symbol_table[MAX_ST_SIZE];
int st_count = 0;

void init_symbol_table() {
    st_count = 0;
}

int add_to_symbol_table(char *token) {
    for (int i = 0; i < st_count; i++) {
        if (strcmp(symbol_table[i].symbol, token) == 0) {
            return i;  
        }
    }
    if (st_count < MAX_ST_SIZE) {
        strcpy(symbol_table[st_count].symbol, token);
        return st_count++;
    } else {
        printf("Symbol Table is full!\n");
        return -1;
    }
}

void print_symbol_table() {
    printf("|^^^^^^^^^^^^^|\n");
    printf("|     ST      |\n");
    for (int i = 0; i < st_count; i++) {
        printf("|-------------|\n");
        printf("|%5d | %5s|\n", i, symbol_table[i].symbol);
    }
    printf("|vvvvvvvvvvvvv|\n");
}
