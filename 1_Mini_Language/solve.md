# Lab 1 mini-language \\(◦'⌣'◦)/
Model program: C++


Contains:
- 2 simple data types and a user-defined type : ``` (int, char, string, struct) ```
- statements
- assignment
- input/output ``` cin, cout ```
- conditional ``` if else ```
- loop ``` while ```
- some condition on the way the identifiers and constants can be formed

## a) Mini-language specification
### Language specification:
  Alphabet
  ```
    * <letter> := <lwr_letter> | <upr_letter>
    * <lwr_letter> := a | b | c | d | ... | z
    * <upr_letter> := A | B | C | D | ... | Z
    * <nonzero_digit> := 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 
    * <digit> := 0 | <nonzero_digit>
    * <underline_chr> := _
```
  Lexic
```
    <cond_operator> := < | <= | > | >= | == | != 
    <arithmetic_operator> := + | - | * | /
    <logic_operator> := ^ | | | << 
    <separators> := [ | ] | { | }  |( | ) | ; | space 
    <reserved_words> := int | string | struct | char | if | else | while
  
    <id> := <letter> | <letter><string>
```
  String & Char
```
    <string> := <char><string> | <char>
    <char> := <letter> | <digit> | <underline_chr>
```
  Integer
```
    <number> := <nonzero_digit><number_body> | <nonzero_digit>
    <number_body> := <digit><number_body> | <digit>
    <integer> := <number> | -<number> | +<number>
```
Declarations 
```
    <declaration> := <int_decl> | <str_decl> | <chr_decl> | <struct_decl>

    <int_var> := int <id>
    <int_const> := <integer>
    <int_decl> := <int_var>; | <int_var>=<int_const>; 

    <str_var> := string <id>
    <str_cont> := "<string>"
    <str_decl> := <str_var>; | <str_var>=<str_const>;

    <chr_var> := char <id>
    <chr_const> := '<char>'
    <chr_decl> := <chr_var>; | <chr_var>=<chr_const>;

    <const> := <int_const> | <str_const> | <chr_const>
    <assignment> := <id>=<assignment_val>;
    <assignment_val> := <const> | <operation>

    <struct_decl> := struct { <declaration_block> } <id>;

```
    Operations
```
    <operand> :=  <id> | <const> 
  
    <ari_operation> := <operand> | <arithmetic_operator><operation>

```

    
    


## b) small program

## DOCUMENTATION  
