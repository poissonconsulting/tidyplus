test_that("only errors no length", {
  expect_error(only(numeric(0)))
})

test_that("only errors list", {
  expect_error(only(list(1)))
})

test_that("only errors if only NA and exclude", {
  expect_error(only(NA, na_rm = TRUE))
})

test_that("only works scalar", {
  expect_identical(only(1), 1)
  expect_identical(only(NA), NA)
})

test_that("only works vector", {
  expect_identical(only(c(2L, 2L)), 2L)
  expect_identical(only(c(NA_character_, NA_character_)), NA_character_)
})

test_that("only errors mix of missing and non-missing unless na_rm = TRUE", {
  expect_error(only(c(1L, NA)))
  expect_identical(only(c(1L, NA), na_rm = TRUE), 1L)
})
