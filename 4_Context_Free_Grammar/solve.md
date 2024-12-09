# Lab 4

### Language specification:
  Alphabet
  ```
    * <letter> := <lwr_letter> | <upr_letter>
    * <lwr_letter> ::= "a" | "b" | "c" | "d" | ... | "z"
    * <upr_letter> ::= "A" | "B" | "C" | "D" | ... | "Z"
    * <nonzero_digit> ::= "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" 
    * <digit> ::= "0" | <nonzero_digit>
    * <underline_chr> ::= "_"
    * <enter> ::= ""\n""
```
  Lexic
```
    <cond_operator> ::= "<" | "<=" | ">" | ">=" | "==" | "!="
    <if_operator> ::= "||" | "&&"
    <not_operator> ::= "!"
    <ari_operator> ":= "+" | "-" | "*" | "/" | "%"
    <logic_operator> ::= "^" | "|" | "<<"
    <separators> ::= "[" | "]" | "{" | "}"  | "(" | ")" | ";" | " " 
    <reserved_words> ::= "int" | "string" | "struct" | "char" | "if" | "else" | "while"
  
    <id> ::= <letter> | <letter><string>
```
  String & Char
```
    <string> ::= <char><string> | <char>
    <char> ::= <letter> | <digit> | <underline_chr>
```
  Integer
```
    <number> ::= <nonzero_digit><number_body> | <nonzero_digit>
    <number_body> ::= <digit><number_body> | <digit>
    <integer> ::= <number> | "-"<number> | "+"<number>
```
  Operation
```
    <operand> ::= <id> | <const>

    <condition> ::= "("<operand><logic_operator><operand>")"


    <add_cond_r> ::= <if_operator><condition><add_cond>| ε
    <add_cond_l> ::= <condition><if_operator><add_cond>| ε
    <enclose> ::= "(<add_cond_l>"<enclose>"<add_cond_r>)" | <add_cond_l><condition><add_cond_r>
    ex enclose:((..(cond||...||cond)..)||cond||cond)..), ex cond: a<b

    <add_enclose_r> ::= <if_operator><enclose><add_enclose_r> | ε
    <add_enclose_l> ::=  <enclose><if_operator><add_enclose_l> | ε
    <if_statement> ::= "(<add_enclose_l>"<if_statement>"<add_enclose_r>)" | <condition><add_cond>
    
    la operatiile aritmetice ar fi fost aceeasi idee in cazul in care as fi vrut sa introduc parantezele, dar am ales sa le las simple :(
    <operation> ::= <operand><add_operation>
    <add_operation> ::= <operator><operand><add_operation> | ε
  
```
  Declarations & Variable assignments
```
    <declaration_block> ::= <declaration> | <declaration><declaration_block>
    
    <int_var> ::= "int "<id>
    <int_const> ::= <integer>

    <str_var> ::= "char * "<id>
    <str_cont> ::= """<string>"""

    <chr_var> ::= "char "<id>
    <chr_const> ::= "'"<char>"'"


    <decl_var_no_array> ::= <int_var> | <str_var> | <chr_var>
    <const_no_array> ::= <int_const> | <str_const> | <chr_const>

    <array_access> ::= "["<number>|<id>"]"
    <array_var> ::= <decl_var><array_accesss>
    <array_const> ::= "{"<array_const_body>"}"
    <array_const_body> ::= <const>","<array_const_body> | ε
    <array_assignment> ::= <array_var>"="array_const";


    <decl_var> ::= <array_var> | <decl_var_no_array>
    <const> ::= <const_no_array> | <array_body>

    <assignment> ::= <id>"="<assignment_val>";"

    <assignment_val> ::= <const> | <operation> | <array_assignment>
    <assignment_and_decl> ::= <decl_var>"="<assignment_val>";"
    <assignment_existing> ::= <id>"="<assignment_val>";"

    <struct_decl> ::= struct { <declaration_block> } <id>;

    <declaration> ::= <struct_decl> | <decl_var>";" | <assignment_existing> | <assignment_and_decl> |

```
  Cin/Cout
```
  <cin> ::= "cin>>"<id>";"
  <cout> ::= "cout<<"<cout_add>";"
  <cout_add> ::= <cout_val> | <cout_val>"<<"<cout_add>
  <cout_val> ::= <operation> | <id> | <const> | <if_statement> | <enter>
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
  <instruction> ::= <if> | <while> | <cin> | <cout>
  <instruction_block> ::= <instrucion> <instruction_block> | <instruction>

  <code> ::= <instruction_block> | <declaration_block>
  <code_block> ::= <code><code_block> | <code>
```
  Program
```
    <library_decl> ::= ... | ε
    <namespace_decl> ::= ... | ε
    ...
    <Start> ::= "int main(){"<code_block>"}"
```





