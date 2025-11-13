# Remove whitespace from a string

`str_crush()`, which removes all whitespace from a string, is the
logical extension to
[`stringr::str_trim()`](https://stringr.tidyverse.org/reference/str_trim.html)
and
[`stringr::str_squish()`](https://stringr.tidyverse.org/reference/str_trim.html).

## Usage

``` r
str_crush(string)
```

## Arguments

- string:

  Input vector. Either a character vector, or something coercible to
  one.

## Value

A character vector the same length as `string`.

## Details

`str_crush()` is considered [too
specialized](https://github.com/tidyverse/stringr/pull/338) to be part
of stringr.

## See also

[`stringr::str_trim()`](https://stringr.tidyverse.org/reference/str_trim.html)
and
[`stringr::str_squish()`](https://stringr.tidyverse.org/reference/str_trim.html)

## Examples

``` r
str_crush("  String with trailing,  middle, and leading white space\t")
#> [1] "Stringwithtrailing,middle,andleadingwhitespace"
```
