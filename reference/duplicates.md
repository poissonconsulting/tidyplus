# Keep non-unique rows in a data frame

Keeps only non-unique rows within a data frame.

## Usage

``` r
duplicates(.data, ..., .keep_all = TRUE)
```

## Arguments

- .data:

  A data.frame.

- ...:

  Optional variables to use when determining non-uniqueness. If omitted,
  will use all variables in the data frame.

- .keep_all:

  A flag specifying whether to keep all variables in .data.

## Value

The original data frame with only non-unique rows.

## Examples

``` r
data <- tibble::tibble(x = c(1, 2, 1, 1), y = c(1, 1, 1, 5))

duplicates(data)
#> # A tibble: 2 × 2
#>       x     y
#>   <dbl> <dbl>
#> 1     1     1
#> 2     1     1
duplicates(data, x)
#> # A tibble: 3 × 2
#>       x     y
#>   <dbl> <dbl>
#> 1     1     1
#> 2     1     1
#> 3     1     5
duplicates(data, y)
#> # A tibble: 3 × 2
#>       x     y
#>   <dbl> <dbl>
#> 1     1     1
#> 2     2     1
#> 3     1     1
duplicates(data, x, y)
#> # A tibble: 2 × 2
#>       x     y
#>   <dbl> <dbl>
#> 1     1     1
#> 2     1     1
duplicates(data, y, .keep_all = FALSE)
#> # A tibble: 3 × 1
#>       y
#>   <dbl>
#> 1     1
#> 2     1
#> 3     1
```
