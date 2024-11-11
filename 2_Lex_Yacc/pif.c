#include <stdio.h>
#include <string.h>
#include "pif.h"

#define MAX_PIF_SIZE 1000

typedef struct {
    char token[20];
    int index;
} PIFEntry;

PIFEntry pif[MAX_PIF_SIZE];
int pif_count = 0;

void init_pif() {
    pif_count = 0;
}

void add_to_pif(const char *token, int index) {
    if (pif_count < MAX_PIF_SIZE) {
        strcpy(pif[pif_count].token, token);
        pif[pif_count].index = index;
        pif_count++;
    } else {
        printf("PIF is full!\n");
    }
}

void print_pif() {
    printf("|^^^^^^^^^^^^^^^^^|\n");
    printf("|     PIF         |\n");
    for (int i = 0; i < pif_count; i++) {
        printf("|-----------------|\n");
        printf("|%7s | %7d|\n", pif[i].token, pif[i].index);
    }
    printf("|vvvvvvvvvvvvvvvvv|\n");
}
