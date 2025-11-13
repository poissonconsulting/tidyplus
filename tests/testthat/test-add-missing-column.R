test_that("add_missing_column same as add_column", {
  data <- tibble::tibble(x = 1:3, y = 3:1)

  expect_identical(
    add_missing_column(data, z = -1:1),
    tibble::add_column(data, z = -1:1)
  )
})

test_that("add_missing_column same as add_column with before", {
  data <- tibble::tibble(x = 1:3, y = 3:1)

  expect_identical(
    add_missing_column(data, z = -1:1, .before = "y"),
    tibble::add_column(data, z = -1:1, .before = "y")
  )
})

test_that("add_missing_column same as add_column with after", {
  data <- tibble::tibble(x = 1:3, y = 3:1)

  expect_identical(
    add_missing_column(data, z = -1:1, .after = "x"),
    tibble::add_column(data, z = -1:1, .after = "x")
  )
})

test_that("add_column errors if present", {
  data <- tibble::tibble(x = 1:3, y = 3:1)

  expect_error(tibble::add_column(data, x = 2:4))
})

test_that("add_missing_column ignores if present", {
  data <- tibble::tibble(x = 1:3, y = 3:1)

  expect_identical(add_missing_column(data, x = 2:4), data)
})

test_that("add_missing_column no problem with existing and new column", {
  data <- tibble::tibble(totalAssets = c(1,2))

  expect_identical(add_missing_column(data, totalAssets = NA_real_, other = 1), tibble::tibble(totalAssets = c(1,2), other = c(1, 1)))
})
