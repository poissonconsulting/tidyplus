# Collapse Comments

Collapse comments coercing each element to a string (character scalar)
and then collapsing into a single string using the '. ' separator.

## Usage

``` r
collapse_comments(...)
```

## Arguments

- ...:

  objects to be collapsed into a string.

## Value

A string of the collapsed comments.

## See also

[`unite_str()`](https://poissonconsulting.github.io/tidyplus/reference/unite_str.md)

## Examples

``` r
collapse_comments("Saw fish", character(0), "Nice. .", NA_character_)
#> [1] "Saw fish. Nice."

data <- data.frame(
  visit = c(1, 1, 2, 2),
  fish = 1:4,
  comment = c("Sunny day.  ", "Skinny fish", "Lost boot", NA)
)

if (FALSE) { # \dontrun{
data |>
  dplyr::group_by(visit) |>
  dplyr::summarise(comment = collapse_comments(comment)) |>
  dplyr::ungroup()
} # }
```
