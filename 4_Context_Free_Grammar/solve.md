# Lab 4

### Theory
Context Free Grammar is formal grammar, the syntax or structure of a formal language can be described using context-free grammar (CFG), a type of formal grammar. The grammar has four tuples: (V,T,P,S).
V - It is the collection of variables or non-terminal symbols.
T - It is a set of terminals. 
P - It is the production rules that consist of both terminals and non-terminals.
S - It is the starting symbol.

```
V = {
    <letter>, <lwr_letter>, <upr_letter>, <digit>, <nonzero_digit>, <underline_chr>, <enter>, 
    <cond_operator>, <if_operator>, <not_operator>, <ari_operator>, <logic_operator>, 
    <separators>, <reserved_words>, <id>, 
    <string>, <char>, 
    <number>, <number_body>, <integer>, 
    <operand>, <condition>, <add_cond_r>, <add_cond_l>, <enclose>, <add_enclose_r>, <add_enclose_l>, <if_statement>, <operation>, <add_operation>, 
    <declaration_block>, <int_var>, <int_const>, <str_var>, <str_cont>, <chr_var>, <chr_const>, <decl_var_no_array>, <const_no_array>, <array_access>, <array_var>, <array_const>, <array_const_body>, <array_assignment>, <decl_var>, <const>, <assignment>, <assignment_val>, <assignment_and_decl>, <assignment_existing>, <struct_decl>, <declaration>, 
    <cin>, <cout>, <cout_add>, <cout_val>, 
    <if>, 
    <while>, 
    <instruction>, <instruction_block>, 
    <code>, <code_block>, 
    <library_decl>, <namespace_decl>, 
    <Start>
}

T = {
    "a", "b", ..., "z", "A", "B", ..., "Z", 
    "0", "1", ..., "9",                   
    "_", "\n",                            
    "<", "<=", ">", ">=", "==", "!=",     
    "||", "&&",                           
    "!",                                  
    "+", "-", "*", "/", "%",             
    "^", "|", "<<",                      
    "[", "]", "{", "}", "(", ")", ";", " ", // Separators
    "int", "string", "struct", "char", "if", "else", "while", 
    "cin>>", "cout<<", "\"", "'", "="
}
S = <Start>

```


### Language specification and production rules:
  Alphabet
  ```
    <letter> → <lwr_letter> | <upr_letter>
    <lwr_letter> → "a" | "b" | "c" | "d" | ... | "z"
    <upr_letter> → "A" | "B" | "C" | "D" | ... | "Z"
    <nonzero_digit> → "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
    <digit> → "0" | <nonzero_digit>
    <underline_chr> → "_"
    <enter> → "\n"
```
  Lexic
```
    <cond_operator> → "<" | "<=" | ">" | ">=" | "==" | "!="
    <if_operator> → "||" | "&&"
    <not_operator> → "!"
    <ari_operator> → "+" | "-" | "*" | "/" | "%"
    <logic_operator> → "^" | "|" | "<<"
    <separators> → "[" | "]" | "{" | "}" | "(" | ")" | ";" | " "
    <reserved_words> → "int" | "string" | "struct" | "char" | "if" | "else" | "while"
    <id> → <letter> | <letter><string>

```
  String & Char
```
    <string> → <char><string> | <char>
    <char> → <letter> | <digit> | <underline_chr>
```
  Integer
```
    <number> → <nonzero_digit><number_body> | <nonzero_digit>
    <number_body> → <digit><number_body> | <digit>
    <integer> → <number> | "-" <number> | "+" <number>
```
  Operation
```
    <operand> → <id> | <const>
    <condition> → "(" <operand> <logic_operator> <operand> ")"
    
    <add_cond_r> → <if_operator> <condition> <add_cond> | ε
    <add_cond_l> → <condition> <if_operator> <add_cond> | ε
    <enclose> → "(" <add_cond_l> <enclose> <add_cond_r> ")" 
              | <add_cond_l> <condition> <add_cond_r>
    
    <add_enclose_r> → <if_operator> <enclose> <add_enclose_r> | ε
    <add_enclose_l> → <enclose> <if_operator> <add_enclose_l> | ε
    
    <if_statement> → "(" <add_enclose_l> <if_statement> <add_enclose_r> ")" 
                   | <condition> <add_cond>
    
    <operation> → <operand> <add_operation>
    <add_operation> → <ari_operator> <operand> <add_operation> | ε
  
```
  Declarations & Variable assignments
```
     <declaration_block> → <declaration> | <declaration> <declaration_block>
      <int_var> → "int " <id>
      <int_const> → <integer>
      
      <str_var> → "char * " <id>
      <str_cont> → "\"" <string> "\""
      
      <chr_var> → "char " <id>
      <chr_const> → "'" <char> "'"
      
      <decl_var_no_array> → <int_var> | <str_var> | <chr_var>
      <const_no_array> → <int_const> | <str_const> | <chr_const>
      
      <array_access> → "[" <number> | <id> "]"
      <array_var> → <decl_var> <array_access>
      <array_const> → "{" <array_const_body> "}"
      <array_const_body> → <const> "," <array_const_body> | ε
      
      <array_assignment> → <array_var> "=" <array_const> ";"
      
      <decl_var> → <array_var> | <decl_var_no_array>
      <const> → <const_no_array> | <array_body>
      
      <assignment> → <id> "=" <assignment_val> ";"
      
      <assignment_val> → <const> | <operation> | <array_assignment>
      <assignment_and_decl> → <decl_var> "=" <assignment_val> ";"
      <assignment_existing> → <id> "=" <assignment_val> ";"
      
      <struct_decl> → "struct { " <declaration_block> " } " <id> ";"
      
      <declaration> → <struct_decl> 
                    | <decl_var> ";" 
                    | <assignment_existing> 
                    | <assignment_and_decl>

```
  Cin/Cout
```
  <cin> → "cin>>" <id> ";"
  <cout> → "cout<<" <cout_add> ";"
  <cout_add> → <cout_val> | <cout_val> "<<" <cout_add>
  <cout_val> → <operation> | <id> | <const> | <if_statement> | <enter>

```
  If-Else
```
    <if> ::= "if"<if_statement>"{"<code_block>"}" | "if"<if_statement>"{"<code_block>"}else{"<code_block>"}"
```
  While
```
  <while> ::= "while"<if_statement>"{"<code_block>"}"
```
  Code block
```
  <instruction> → <if> | <while> | <cin> | <cout>
  <instruction_block> → <instrucion> <instruction_block> | <instruction>

  <code> → <instruction_block> | <declaration_block>
  <code_block> → <code><code_block> | <code>
```
  Program
```
        <library_decl> ::= ... | ε
    <namespace_decl> ::= ... | ε
    ...
    <Start> ::= "int main(){"<code_block>"}"

```

# DOCUMENTATION

Overview: a simplified verion of c++

### Alphabet:

letters a-z
A-Z
digits
0-9
special charactes: "_", "\n"

### Lexical Rules:

operators: < <= > >= == != && || ! + - * / % ^ | <<
separators: [ ] { } ( ) ; " "
reserved words: int, string, struct, char, if, else, while
identifiers: start with a letter, followed by letters, digits, or underscores

### Data Types:

int - integer
char - single character string - sequence of characters
Constants:

integer: positive or negative whole numbers
string: with characters a-z, A-Z, 0-9, _
char: single character
array? array of integers, strings or characters of the form {e1, e2 .. }
Array: Declared with brackets int arr[10] Accessed with brackets arr[0]

### Operator:

arithmetic: +, -, *, /, %
conditionals: < <= > >= == !=
logical: &&, ||, !
bitwise: ^, |, <<

### Statements:

declaration: data type followed by identifier or direct assignment
assignment: var=value;
input: cin<<var; O
output: cout>>value;
conditional: if (condition) { ... } else { ... }
loop: while (condition) { ... }
Program Structure: int main() { code block }




