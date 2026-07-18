# Changelog

## tidyplus 0.2.1 (2026-07-18)

- Fixed bug in
  [`add_missing_column()`](https://poissonconsulting.github.io/tidyplus/reference/add_missing_column.md)
  where the function would error if one column was present and one was
  missing.
- Fixed bug in
  [`str_to_snake_case()`](https://poissonconsulting.github.io/tidyplus/reference/str_to_snake_case.md)
  so only a single underscore is added between words
  ([\#35](https://github.com/poissonconsulting/tidyplus/issues/35)).
- Updated documentation
  ([\#42](https://github.com/poissonconsulting/tidyplus/issues/42)).
- Added/corrected author ORCID(s) in DESCRIPTION
  ([\#37](https://github.com/poissonconsulting/tidyplus/issues/37)).
- Internal changes
  ([\#36](https://github.com/poissonconsulting/tidyplus/issues/36),
  [\#39](https://github.com/poissonconsulting/tidyplus/issues/39),
  [\#40](https://github.com/poissonconsulting/tidyplus/issues/40)).

## tidyplus 0.2.0

CRAN release: 2025-01-24

- Added `error = FALSE` argument to
  [`if_else2()`](https://poissonconsulting.github.io/tidyplus/reference/if_else2.md).
- Added informative error message to
  [`if_else2()`](https://poissonconsulting.github.io/tidyplus/reference/if_else2.md)
  if no matches are found.
- Internal changes.
- [`duplicates()`](https://poissonconsulting.github.io/tidyplus/reference/duplicates.md)
  now preserves groups and attributes for “regular” and “sf” data
  frames.
- Added tests for
  [`duplicates()`](https://poissonconsulting.github.io/tidyplus/reference/duplicates.md).

## tidyplus 0.1.0

- Added the
  [`str_replace_vec()`](https://poissonconsulting.github.io/tidyplus/reference/str_replace_vec.md)
  function.
- Added the
  [`duplicates()`](https://poissonconsulting.github.io/tidyplus/reference/duplicates.md)
  function.
- Added the
  [`str_to_snake_case()`](https://poissonconsulting.github.io/tidyplus/reference/str_to_snake_case.md)
  function.
- Added the
  [`summarise2()`](https://poissonconsulting.github.io/tidyplus/reference/summarise2.md)
  function.

## tidyplus 0.0.2

CRAN release: 2022-12-16

- Make package compatible with the upcoming release of dplyr 1.1.0.
- Added repository and bug reports URLs.

## tidyplus 0.0.1

CRAN release: 2022-08-29

- Released on CRAN release.
