# String replace multiple strings

String replace multiple strings in a vector.

## Usage

``` r
str_replace_vec(string, replace)
```

## Arguments

- string:

  Input vector. Either a character vector, or something coercible to
  one.

- replace:

  A character vector where the names are the patterns to look for and
  the values are the replacement values `(c(pattern1 = replacement1))`

## Value

A character vector the same length as `string`/`pattern`/`replacement`.

## Details

`str_replace_vec()` is a vectorized form of
[`stringr::str_replace()`](https://stringr.tidyverse.org/reference/str_replace.html).

This is different from passing a named vector to
[`stringr::str_replace_all`](https://stringr.tidyverse.org/reference/str_replace.html),
which performs multiple replacements but to all pattern matches in a
string.

## See also

[`stringr::str_replace()`](https://stringr.tidyverse.org/reference/str_replace.html)
and
[`stringr::str_replace_all()`](https://stringr.tidyverse.org/reference/str_replace.html)

## Examples

``` r
fruits <- c("two apples", "nine pears")
str_replace_vec(fruits, c("two" = "three", "nine" = "ten"))
#> [1] "three apples" "ten pears"   
```
