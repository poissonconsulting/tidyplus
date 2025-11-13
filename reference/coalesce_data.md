# Coalesce Data

Coalesce values in multiple columns by finding the first non-missing
value at each position. Coalesced columns are removed.

## Usage

``` r
coalesce_data(x, coalesce = list(), quiet = FALSE)
```

## Arguments

- x:

  A data frame.

- coalesce:

  A uniquely named list of character vectors where the names are the new
  column names and the values are the names of the columns to coalesce.
  If a single value is provided for a column it is treated as a regular
  expression.

- quiet:

  A flag specifying whether to provide messages.

## Value

The original data frame with one or more columns coalesced into a new
column.

## Details

Coalescence is performed in the order specified in the coalesce argument
such that a column produced by coalescence can be further coalesced.

## See also

[`dplyr::coalesce()`](https://dplyr.tidyverse.org/reference/coalesce.html)

## Examples

``` r
data <- data.frame(x = c(1, NA, NA), y = c(NA, 3, NA), z = c(7, 8, 9), a = c(4, 5, 6))
coalesce_data(data, list(b = c("x", "y")), quiet = TRUE)
#>   z a  b
#> 1 7 4  1
#> 2 8 5  3
#> 3 9 6 NA
coalesce_data(data, list(z = c("y", "x"), d = c("z", "a")))
#> Coalesced 'z' from: 'y' and 'x'
#> Coalesced 'd' from: 'z' and 'a'
#>   d
#> 1 1
#> 2 3
#> 3 6
```
