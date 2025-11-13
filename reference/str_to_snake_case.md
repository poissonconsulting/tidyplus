# Converts strings to Snake Case

Converts strings to Snake Case

## Usage

``` r
str_to_snake_case(x)
```

## Arguments

- x:

  input string or multiple strings to be converted to snake case

## Value

string or strings converted to snake_case

## Examples

``` r
str_to_snake_case("string of words")
#> [1] "string_of_words"

str_to_snake_case("StringOfWords")
#> [1] "string_of_words"

str_to_snake_case("s!t$ring of %char^&act*ers")
#> [1] "string_of_characters"

str_to_snake_case(c("multiples of strings", "strings in multiple", "many strings"))
#> [1] "multiples_of_strings" "strings_in_multiple"  "many_strings"        
```
