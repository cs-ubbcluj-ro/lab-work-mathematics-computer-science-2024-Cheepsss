#!/bin/sh

#pt instalare: sudo apt install flex
lex lex.l
gcc lex.yy.c pif.c symbol_table.c -o scanner -ll
chmod +x scanner
./scanner test.cpp