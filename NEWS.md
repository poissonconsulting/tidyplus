<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->

# tidyplus 0.2.1 (2026-07-18)

- Fixed bug in `add_missing_column()` where the function would error if one column was present and one was missing.
- Fixed bug in `str_to_snake_case()` so only a single underscore is added between words (#35).
- Updated documentation (#42).
- Added/corrected author ORCID(s) in DESCRIPTION (#37).
- Internal changes (#36, #39, #40).

# tidyplus 0.2.0

- Added `error = FALSE` argument to `if_else2()`.
- Added informative error message to `if_else2()` if no matches are found.
- Internal changes.
- `duplicates()` now preserves groups and attributes for "regular" and "sf" data frames.
- Added tests for `duplicates()`.

# tidyplus 0.1.0

- Added the `str_replace_vec()` function.
- Added the `duplicates()` function. 
- Added the `str_to_snake_case()` function. 
- Added the `summarise2()` function.


# tidyplus 0.0.2

- Make package compatible with the upcoming release of dplyr 1.1.0.
- Added repository and bug reports URLs.


# tidyplus 0.0.1

- Released on CRAN release.
