roxygen2md::roxygen2md()

lintr::lint_package(
  linters = lintr::linters_with_defaults(
    line_length_linter = lintr::line_length_linter(1000),
    object_name_linter = lintr::object_name_linter(regexes = ".*")
  )
)

devtools::test()
devtools::document()

pkgdown::build_site()

devtools::check()
