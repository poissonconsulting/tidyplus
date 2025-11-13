# Detect the presence/absence of a match

Vectorised over `string` and `pattern`. Actually equivalent to
`grepl(pattern, x)` as returns FALSE for `NA`s (unlike
[`stringr::str_detect()`](https://stringr.tidyverse.org/reference/str_detect.html)).
This behavior is useful when searching comments many of which are NA to
indicate no comments present.

## Usage

``` r
str_detect2(string, pattern, negate = FALSE)
```

## Arguments

- string:

  Input vector. Either a character vector, or something coercible to
  one.

- pattern:

  Pattern to look for.

  The default interpretation is a regular expression, as described in
  `vignette("regular-expressions")`. Use
  [`regex()`](https://stringr.tidyverse.org/reference/modifiers.html)
  for finer control of the matching behaviour.

  Match a fixed string (i.e. by comparing only bytes), using
  [`fixed()`](https://stringr.tidyverse.org/reference/modifiers.html).
  This is fast, but approximate. Generally, for matching human text,
  you'll want
  [`coll()`](https://stringr.tidyverse.org/reference/modifiers.html)
  which respects character matching rules for the specified locale.

  You can not match boundaries, including `""`, with this function.

- negate:

  If `TRUE`, inverts the resulting boolean vector.

## Value

A logical vector the same length as `string`/`pattern`.

## See also

[`grepl()`](https://rdrr.io/r/base/grep.html) and
[`stringr::str_detect()`](https://stringr.tidyverse.org/reference/str_detect.html)

## Examples

``` r
x <- c("b", NA, "ab")
pattern <- "^a"
grepl(pattern, x)
#> [1] FALSE FALSE  TRUE
stringr::str_detect(x, pattern)
#> [1] FALSE    NA  TRUE
str_detect2(x, pattern)
#> [1] FALSE FALSE  TRUE
```
