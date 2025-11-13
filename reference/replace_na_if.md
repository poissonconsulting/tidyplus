# Conditional replacement of NAs with specified values

Unlike
[`tidyr::replace_na()`](https://tidyr.tidyverse.org/reference/replace_na.html),
it is only defined for vectors.

## Usage

``` r
replace_na_if(x, condition, true)
```

## Arguments

- x:

  Vector with missing values to modify.

- condition:

  A logical vector

- true:

  The replacement values where condition is `TRUE`.

## Value

A modified version of x that replaces any missing values where condition
is `TRUE` with `true`.

## Details

`replace_na_if()` is a wrapper on
`if_else2(is.na(x) & condition, true, x)`

## See also

[`tidyr::replace_na()`](https://tidyr.tidyverse.org/reference/replace_na.html)
and
[`if_else2()`](https://poissonconsulting.github.io/tidyplus/reference/if_else2.md)

## Examples

``` r
data <- tibble::tibble(
  x = c(TRUE, FALSE, NA),
  y = c("x is false", NA, "x is false")
)

dplyr::mutate(data,
  x1 = tidyr::replace_na(x, FALSE),
  x3 = if_else2(is.na(x) & y == "x is false", FALSE, x),
  x4 = replace_na_if(x, y == "x is false", FALSE)
)
#> # A tibble: 3 × 5
#>   x     y          x1    x3    x4   
#>   <lgl> <chr>      <lgl> <lgl> <lgl>
#> 1 TRUE  x is false TRUE  TRUE  TRUE 
#> 2 FALSE NA         FALSE FALSE FALSE
#> 3 NA    x is false FALSE FALSE FALSE
```
