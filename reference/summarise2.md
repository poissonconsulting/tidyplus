# Summarise Each Group Down to One Row

Wrapper on
[`dplyr::summarise`](https://dplyr.tidyverse.org/reference/summarise.html)
that sets the default for the .group variable to "keep". This means that
all the groups set in
[`dplyr::group_by`](https://dplyr.tidyverse.org/reference/group_by.html)
are retained, not just the first group.

## Usage

``` r
summarise2(.data, ..., .by = NULL, .groups = "keep")

summarize2(.data, ..., .by = NULL, .groups = "keep")
```

## Arguments

- .data:

  A data frame, data frame extension (e.g. a tibble), or a lazy data
  frame (e.g. from dbplyr or dtplyr). See *Methods*, below, for more
  details.

- ...:

  \<[`data-masking`](https://rlang.r-lib.org/reference/args_data_masking.html)\>
  Name-value pairs of summary functions. The name will be the name of
  the variable in the result.

  The value can be:

  - A vector of length 1, e.g. `min(x)`, `n()`, or `sum(is.na(y))`.

  - A data frame, to add multiple columns from a single expression.

  **\[deprecated\]** Returning values with size 0 or \>1 was deprecated
  as of 1.1.0. Please use
  [`reframe()`](https://dplyr.tidyverse.org/reference/reframe.html) for
  this instead.

- .by:

  **\[experimental\]**

  \<[`tidy-select`](https://dplyr.tidyverse.org/reference/dplyr_tidy_select.html)\>
  Optionally, a selection of columns to group by for just this
  operation, functioning as an alternative to
  [`group_by()`](https://dplyr.tidyverse.org/reference/group_by.html).
  For details and examples, see
  [?dplyr_by](https://dplyr.tidyverse.org/reference/dplyr_by.html).

- .groups:

  **\[experimental\]** Grouping structure of the result.

  - "drop_last": dropping the last level of grouping. This was the only
    supported option before version 1.0.0.

  - "drop": All levels of grouping are dropped.

  - "keep": Same grouping structure as `.data`.

  - "rowwise": Each row is its own group.

  When `.groups` is not specified, it is chosen based on the number of
  rows of the results:

  - If all the results have 1 row, you get "drop_last".

  - If the number of rows varies, you get "keep" (note that returning a
    variable number of rows was deprecated in favor of
    [`reframe()`](https://dplyr.tidyverse.org/reference/reframe.html),
    which also unconditionally drops all levels of grouping).

  In addition, a message informs you of that choice, unless the result
  is ungrouped, the option "dplyr.summarise.inform" is set to `FALSE`,
  or when `summarise()` is called from a function in a package.

## Value

An object *usually* of the same type as `.data`.

- The rows come from the underlying
  [`group_keys()`](https://dplyr.tidyverse.org/reference/group_data.html).

- The columns are a combination of the grouping keys and the summary
  expressions that you provide.

- The grouping structure is controlled by the `.groups=` argument, the
  output may be another
  [grouped_df](https://dplyr.tidyverse.org/reference/grouped_df.html), a
  [tibble](https://tibble.tidyverse.org/reference/tibble.html) or a
  [rowwise](https://dplyr.tidyverse.org/reference/rowwise.html) data
  frame.

- Data frame attributes are **not** preserved, because `summarise()`
  fundamentally creates a new data frame.

## Useful functions

- Center: [`mean()`](https://rdrr.io/r/base/mean.html),
  [`median()`](https://rdrr.io/r/stats/median.html)

- Spread: [`sd()`](https://rdrr.io/r/stats/sd.html),
  [`IQR()`](https://rdrr.io/r/stats/IQR.html),
  [`mad()`](https://rdrr.io/r/stats/mad.html)

- Range: [`min()`](https://rdrr.io/r/base/Extremes.html),
  [`max()`](https://rdrr.io/r/base/Extremes.html),

- Position: [`first()`](https://dplyr.tidyverse.org/reference/nth.html),
  [`last()`](https://dplyr.tidyverse.org/reference/nth.html),
  [`nth()`](https://dplyr.tidyverse.org/reference/nth.html),

- Count: [`n()`](https://dplyr.tidyverse.org/reference/context.html),
  [`n_distinct()`](https://dplyr.tidyverse.org/reference/n_distinct.html)

- Logical: [`any()`](https://rdrr.io/r/base/any.html),
  [`all()`](https://rdrr.io/r/base/all.html)

## Backend variations

The data frame backend supports creating a variable and using it in the
same summary. This means that previously created summary variables can
be further transformed or combined within the summary, as in
[`mutate()`](https://dplyr.tidyverse.org/reference/mutate.html).
However, it also means that summary variables with the same names as
previous variables overwrite them, making those variables unavailable to
later summary variables.

This behaviour may not be supported in other backends. To avoid
unexpected results, consider using new names for your summary variables,
especially when creating multiple summaries.

## Methods

This function is a **generic**, which means that packages can provide
implementations (methods) for other classes. See the documentation of
individual methods for extra arguments and differences in behaviour.

The following methods are currently available in loaded packages: no
methods found .

## See also

[`dplyr::summarise()`](https://dplyr.tidyverse.org/reference/summarise.html)
and
[`dplyr::summarize()`](https://dplyr.tidyverse.org/reference/summarise.html)

## Examples

``` r
df <- data.frame(
  group = c("A", "A", "B", "B"),
  id = c(1, 1, 2, 2),
  value = c(10, 4, 20, 6)
)
# summarise2 doesn't produce message about groups
df |>
  dplyr::group_by(group, id) |>
  summarise2(mean = mean(value))
#> # A tibble: 2 × 3
#> # Groups:   group, id [2]
#>   group    id  mean
#>   <chr> <dbl> <dbl>
#> 1 A         1     7
#> 2 B         2    13
# summarise doesn't retain all the groups set in `group_by`
df |>
  dplyr::group_by(group, id) |>
  dplyr::summarise(mean = mean(value))
#> `summarise()` has grouped output by 'group'. You can override using the
#> `.groups` argument.
#> # A tibble: 2 × 3
#> # Groups:   group [2]
#>   group    id  mean
#>   <chr> <dbl> <dbl>
#> 1 A         1     7
#> 2 B         2    13
```
