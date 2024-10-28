# Lab 1 mini-language :D
Model program: C++


Contains:
- 2 simple data types and a user-defined type
- statements
- assignment
- input/output
- conditional
- loop
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

    <string> := <char><string> | <char>
    <char> := <letter> | <digit> | <underline_chr>

    <number> := <nonzero_digit><number_body> | <nonzero_digit>
    <number_body> := <digit><number_body> | <digit>
    <integer> := <number> | -<number> | +<number>
    
    <int_var> := int <id>;
    <int_val> := <int_var>=<integer>;

    <str_var> := string <id>;
    <str_val> := <str_var>="<string>";

    <chr_var> := char <id>;
    <chr_val> := <chr_var>='<char>';

    <struct_var> := struct { <declaration_block> } id;
```

    
    


## b) small program

## DOCUMENTATION  
