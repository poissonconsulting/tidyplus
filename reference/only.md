# Extract the only distinct value from a vector

Extracts the only distinct value from an atomic vector or throws an
informative error if no values or multiple distinct values.

## Usage

``` r
only(x, na_rm = FALSE)
```

## Arguments

- x:

  An atomic vector.

- na_rm:

  A flag indicating whether to exclude missing values.

## Value

The only distinct value from a vector otherwise throws an error.

## Details

`only()` is useful when summarizing a vector by group while checking the
assumption that it is constant within the group.

## See also

[`dplyr::first()`](https://dplyr.tidyverse.org/reference/nth.html)

## Examples

``` r
only(c(1, 1))
#> [1] 1
only(c(NA, NA))
#> [1] NA
only(c(1, 1, NA), na_rm = TRUE)
#> [1] 1
try(only(character(0)))
#> Error in only(character(0)) : `x` must have at least 1 element.
try(only(c(1, NA)))
#> Error in only(c(1, NA)) : `x` must only have 1 distinct value.
try(only(c(1, 2)))
#> Error in only(c(1, 2)) : `x` must only have 1 distinct value.
```
