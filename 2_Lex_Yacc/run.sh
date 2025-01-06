flex lex.l
yacc -Wcounterexamples -d minilang.y
gcc lex.yy.c y.tab.c -o minilang
./minilang < test.c