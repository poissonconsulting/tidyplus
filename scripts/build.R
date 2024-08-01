roxygen2md::roxygen2md()

styler::style_pkg(
  scope = "line_breaks",
  filetype = c("R", "Rmd")
)

lintr::lint_package(linters = lintr::linters_with_defaults(
  line_length_linter = lintr::line_length_linter(1000),
  object_name_linter = lintr::object_name_linter(regexes = ".*"))
)

devtools::test()
devtools::document()

pkgdown::build_site()

devtools::check()
