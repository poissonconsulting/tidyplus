# Unite multiple character columns into one

Convenience function for combining character columns.

## Usage

``` r
unite_str(data, col, ..., sep = ". ", remove = TRUE)
```

## Arguments

- data:

  A data frame.

- col:

  The name of the new column, as a string or symbol.

  This argument is passed by expression and supports
  [quasiquotation](https://rlang.r-lib.org/reference/topic-inject.html)
  (you can unquote strings and symbols). The name is captured from the
  expression with
  [`rlang::ensym()`](https://rlang.r-lib.org/reference/defusing-advanced.html)
  (note that this kind of interface where symbols do not represent
  actual objects is now discouraged in the tidyverse; we support it here
  for backward compatibility).

- ...:

  \<[`tidy-select`](https://tidyr.tidyverse.org/reference/tidyr_tidy_select.html)\>
  Columns to unite

- sep:

  Separator to use between values.

- remove:

  If `TRUE`, remove input columns from output data frame.

## Value

The original data frame with the one or more columns combined as
character vectors separated by a period.

## Details

Blank values of "" are converted into missing values.

## See also

[`tidyr::unite()`](https://tidyr.tidyverse.org/reference/unite.html) and
[`collapse_comments()`](https://poissonconsulting.github.io/tidyplus/reference/collapse_comments.md)

## Examples

``` r
data <- tibble::tibble(x = c("good", "Saw fish.", "", NA), y = c("2021", NA, NA, NA))

# unite has poor handling of character vectors
tidyr::unite(data, "new", x, y, remove = FALSE)
#> # A tibble: 4 × 3
#>   new          x           y    
#>   <chr>        <chr>       <chr>
#> 1 good_2021    "good"      2021 
#> 2 Saw fish._NA "Saw fish." NA   
#> 3 _NA          ""          NA   
#> 4 NA_NA         NA         NA   

unite_str(data, "new", x, y, remove = FALSE)
#> # A tibble: 4 × 3
#>   new        x         y    
#>   <chr>      <chr>     <chr>
#> 1 good. 2021 good      2021 
#> 2 Saw fish.  Saw fish. NA   
#> 3 NA         NA        NA   
#> 4 NA         NA        NA   
```
