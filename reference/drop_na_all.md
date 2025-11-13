# Drop rows containing all missing values

This is a convenient way to drop uninformative rows from a data frame.

## Usage

``` r
drop_na_all(data, ...)
```

## Arguments

- data:

  A data frame.

- ...:

  \<[`tidy-select`](https://tidyr.tidyverse.org/reference/tidyr_tidy_select.html)\>
  Columns to inspect for missing values. If empty, all columns are used.

## Value

The original data frame with rows for which all values are missing
dropped.

## See also

[`tidyr::drop_na`](https://tidyr.tidyverse.org/reference/drop_na.html)
and
[`drop_uninformative_columns`](https://poissonconsulting.github.io/tidyplus/reference/drop_uninformative_columns.md)

## Examples

``` r
data <- tibble::tibble(
  a = c(NA, NA, NA), b = c(1, 1, NA), c = c(2, NA, NA)
)

drop_na_all(data)
#> # A tibble: 2 × 3
#>   a         b     c
#>   <lgl> <dbl> <dbl>
#> 1 NA        1     2
#> 2 NA        1    NA
drop_na_all(data, a, c)
#> # A tibble: 1 × 3
#>   a         b     c
#>   <lgl> <dbl> <dbl>
#> 1 NA        1     2
```
