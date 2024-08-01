test_that("drop_uninformative_columns works no rows", {
  data <- data.frame(x = integer(0))
  expect_equal(drop_uninformative_columns(data), data)
})

test_that("drop_uninformative_columns works no rows or columns", {
  data <- data.frame()
  expect_equal(drop_uninformative_columns(data), data)
})

test_that("drop_uninformative_columns works 1 row", {
  data <- data.frame(x = 1, y = NA)
  expect_equal(drop_uninformative_columns(data), data.frame())
})

test_that("drop_uninformative_columns works 2 no save rows", {
  data <- data.frame(x = c(1, 1), y = c(NA, NA))
  expect_equal(drop_uninformative_columns(data), data.frame())
})

test_that("drop_uninformative_columns works 2 save rows", {
  data <- data.frame(x = c(1, 1), y = c(NA, NA), a = c(1, NA))
  expect_equal(drop_uninformative_columns(data), data.frame(a = c(1, NA)))
})

test_that("drop_uninformative_columns works 2 save rows but drop", {
  data <- data.frame(x = c(1, 1), y = c(NA, NA), a = c(1, NA))
  expect_equal(drop_uninformative_columns(data, na_distinct = FALSE), data.frame())
})

test_that("drop_uninformative_columns preserves tibble", {
  data <- tibble::tibble(x = c(1, 1), y = c(NA, NA), a = c(1, NA))
  expect_equal(drop_uninformative_columns(data), tibble::tibble(a = c(1, NA)))
})

test_that("drop_uninformative_columns preserves col order", {
  data <- tibble::tibble(z = c(1, 2), x = c(1, 1), y = c(NA, NA), a = c(1, NA), b = c(3, 4))
  expect_equal(drop_uninformative_columns(data), tibble::tibble(z = c(1, 2), a = c(1, NA), b = c(3, 4)))
})
