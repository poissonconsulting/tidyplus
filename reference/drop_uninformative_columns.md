# Drop uninformative columns from a data frame

This is a convenient way to drop columns which all have one value
(missing or not) or if `na_distinct = FALSE` also drop columns which all
have one value and/or missing values.

## Usage

``` r
drop_uninformative_columns(data, na_distinct = TRUE)
```

## Arguments

- data:

  A data frame.

- na_distinct:

  A flag specifying whether to treat missing values as distinct from
  other values.

## Value

The original data frame with only informative columns.

## Examples

``` r
data <- tibble::tibble(
  a = c(1, 1, 1), x = c(NA, NA, NA), b = c(1, 1, NA),
  z = c(1, 2, 2), e = c(1, 2, NA)
)

drop_uninformative_columns(data)
#> # A tibble: 3 × 3
#>       b     z     e
#>   <dbl> <dbl> <dbl>
#> 1     1     1     1
#> 2     1     2     2
#> 3    NA     2    NA
drop_uninformative_columns(data, na_distinct = FALSE)
#> # A tibble: 3 × 2
#>       z     e
#>   <dbl> <dbl>
#> 1     1     1
#> 2     2     2
#> 3     2    NA
```
