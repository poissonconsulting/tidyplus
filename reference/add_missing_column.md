# Add missing columns to a data frame

This is a convenient way to add one more columns (if not already
present) to an existing data frame. It is useful to ensure that all
required columns are present in a data frame.

## Usage

``` r
add_missing_column(
  .data,
  ...,
  .before = NULL,
  .after = NULL,
  .name_repair = c("check_unique", "unique", "universal", "minimal")
)
```

## Arguments

- .data:

  Data frame to append to.

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  Name-value pairs, passed on to
  [`tibble()`](https://tibble.tidyverse.org/reference/tibble.html). All
  values must have the same size of `.data` or size 1.

- .before, .after:

  One-based column index or column name where to add the new columns,
  default: after last column.

- .name_repair:

  Treatment of problematic column names:

  - `"minimal"`: No name repair or checks, beyond basic existence,

  - `"unique"`: Make sure names are unique and not empty,

  - `"check_unique"`: (default value), no name repair, but check they
    are `unique`,

  - `"universal"`: Make the names `unique` and syntactic

  - `"unique_quiet"`: Same as `"unique"`, but "quiet"

  - `"universal_quiet"`: Same as `"universal"`, but "quiet"

  - a function: apply custom name repair (e.g.,
    `.name_repair = make.names` for names in the style of base R).

  - A purrr-style anonymous function, see
    [`rlang::as_function()`](https://rlang.r-lib.org/reference/as_function.html)

  This argument is passed on as `repair` to
  [`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html).
  See there for more details on these terms and the strategies used to
  enforce them.

## Value

The original data frame with missing columns added if not already
present.

## Details

It is wrapper on
[`tibble::add_column()`](https://tibble.tidyverse.org/reference/add_column.html)
that doesn't error if the column is already present.

## See also

[`tibble::add_column()`](https://tibble.tidyverse.org/reference/add_column.html)

## Examples

``` r
data <- tibble::tibble(x = 1:3, y = 3:1)

tibble::add_column(data, z = -1:1, w = 0)
#> # A tibble: 3 × 4
#>       x     y     z     w
#>   <int> <int> <int> <dbl>
#> 1     1     3    -1     0
#> 2     2     2     0     0
#> 3     3     1     1     0
add_missing_column(data, z = -1:1, .before = "y")
#> # A tibble: 3 × 3
#>       x     z     y
#>   <int> <int> <int>
#> 1     1    -1     3
#> 2     2     0     2
#> 3     3     1     1

# add_column errors if already present
try(tibble::add_column(data, x = 4:6))
#> Error in tibble::add_column(data, x = 4:6) : 
#>   Column name `x` must not be duplicated.
#> Use `.name_repair` to specify repair.
#> Caused by error in `repaired_names()`:
#> ! Names must be unique.
#> ✖ These names are duplicated:
#>   * "x" at locations 1 and 3.

# add_missing_column silently ignores
add_missing_column(data, x = 4:6)
#> # A tibble: 3 × 2
#>       x     y
#>   <int> <int>
#> 1     1     3
#> 2     2     2
#> 3     3     1
```
