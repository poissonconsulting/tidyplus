test_that("drop_na_all returns data frame with no columns or rows", {
  expect_identical(drop_na_all(data.frame()), data.frame())
  expect_identical(drop_na_all(tibble::tibble()), tibble::tibble())
})

test_that("drop_na_all returns data frame with no rows", {
  expect_identical(drop_na_all(data.frame(x = numeric(0))), data.frame(x = numeric(0)))
  expect_identical(drop_na_all(tibble::tibble(x = numeric(0))), tibble::tibble(x = numeric(0)))
})

test_that("drop_na_all drops rows all missing", {
  data <- tibble::tibble(
    a = c(NA, NA, NA), b = c(1, 1, NA), c = c(2, NA, NA)
  )

  expect_identical(drop_na_all(data), tibble::tibble(
    a = c(NA, NA), b = c(1, 1), c = c(2, NA)
  ))
})

test_that("drop_na_all drops rows works subset", {
  data <- tibble::tibble(
    a = c(NA, NA, NA), b = c(1, 1, NA), c = c(2, NA, NA)
  )

  expect_identical(drop_na_all(data, c(c, a)), tibble::tibble(
    a = c(NA), b = c(1), c = c(2)
  ))
})

test_that("drop_na_all can drop all rows", {
  data <- tibble::tibble(
    a = c(NA, NA, NA),
    b = c(1, 1, NA), c = c(2, NA, NA)
  )

  expect_identical(drop_na_all(data, a), tibble::tibble(
    a = logical(0), b = numeric(0), c = numeric(0)
  ))
})
