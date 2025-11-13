# Vectorised if else.

Vectorised if else that if true returns first possibility otherwise
returns second possibility (even if the condition is a missing value).
When searching character vectors an alternative solution is to use
[`str_detect2()`](https://poissonconsulting.github.io/tidyplus/reference/str_detect2.md).

## Usage

``` r
if_else2(condition, true, false, error = FALSE)
```

## Arguments

- condition:

  A logical vector

- true, false:

  Vectors to use for `TRUE` and `FALSE` values of `condition`.

  Both `true` and `false` will be
  [recycled](https://vctrs.r-lib.org/reference/theory-faq-recycling.html)
  to the size of `condition`.

  `true`, `false`, and `missing` (if used) will be cast to their common
  type.

- error:

  A logical value. If `TRUE`, provides an informative error message if
  no matches are found.

## Value

Where condition is `TRUE`, the matching value from `true`, where it's
`FALSE` or `NA`, the matching value from `false`.

## See also

[`ifelse()`](https://rdrr.io/r/base/ifelse.html) and
[`dplyr::if_else()`](https://dplyr.tidyverse.org/reference/if_else.html).

## Examples

``` r
# consider the following data frame
data <- tibble::tibble(
  x = c(TRUE, FALSE, NA),
  y = c("x is false", NA, "hello")
)

# with a single vector if_else2() behaves the same as the default call to if_else().
dplyr::mutate(data,
  y1 = dplyr::if_else(y != "x is false", "x is true", y),
  y2 = if_else2(y != "x is false", "x is true", y)
)
#> # A tibble: 3 × 4
#>   x     y          y1         y2        
#>   <lgl> <chr>      <chr>      <chr>     
#> 1 TRUE  x is false x is false x is false
#> 2 FALSE NA         NA         NA        
#> 3 NA    hello      x is true  x is true 

# however in the case of a second vector the use of
# if_else2() does not introduce missing values
dplyr::mutate(data,
  x1 = dplyr::if_else(stringr::str_detect(y, "x is false"), FALSE, x),
  x2 = if_else2(stringr::str_detect(y, "x is false"), FALSE, x)
)
#> # A tibble: 3 × 4
#>   x     y          x1    x2   
#>   <lgl> <chr>      <lgl> <lgl>
#> 1 TRUE  x is false FALSE FALSE
#> 2 FALSE NA         NA    FALSE
#> 3 NA    hello      NA    NA   

# in the case of regular expression matching an alternative is to use
# str_detect2()
dplyr::mutate(data,
  x3 = dplyr::if_else(str_detect2(y, "x is false"), FALSE, x)
)
#> # A tibble: 3 × 3
#>   x     y          x3   
#>   <lgl> <chr>      <lgl>
#> 1 TRUE  x is false FALSE
#> 2 FALSE NA         FALSE
#> 3 NA    hello      NA   
```
