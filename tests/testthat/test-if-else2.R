test_that("scalar true and false are vectorised", {
  x <- c(TRUE, TRUE, FALSE, FALSE)
  expect_identical(if_else2(x, 1, 2), c(1, 1, 2, 2))
})

test_that("vector true and false are ok", {
  x <- c(-1, 0, 1)

  expect_identical(if_else2(x < 0, x, 0), c(-1, 0, 0))
  expect_identical(if_else2(x > 0, x, 0), c(0, 0, 1))
})

test_that("missing values are preserved if x", {
  x <- c(TRUE, NA, FALSE)
  expect_identical(if_else2(x, FALSE, x), c(FALSE, NA, FALSE))
})

test_that("missing values are replaced", {
  expect_identical(if_else2(c(TRUE, NA, FALSE), -1, 1), c(-1, 1, 1))
})

test_that("works with lists", {
  x <- list(1, 2, 3)

  expect_equal(
    if_else2(c(TRUE, TRUE, FALSE), x, list(NULL)),
    list(1, 2, NULL)
  )
})

test_that("throws an informative error when error = TRUE and no matches are found", {
  x <- c(1, 2, 3, 4, 5)
  expect_error(
    if_else2(x < 0, 0, x, error = TRUE),
    "No matches found. Did not make any replacements."
  )
})

test_that("doesn't throws an informative error when error = TRUE and matches are found", {
  x <- c(-1, 2, 3, 4, 5)
  expect_equal(
    if_else2(x < 0, 0, x, error = TRUE),
    c(0, 2, 3, 4, 5)
  )
})

test_that("doesn't throw an informative error when error = FALSE (the default) and no matches are found", {
  x <- c(1, 2, 3, 4, 5)
  expect_equal(
    if_else2(x < 0, 0, x),
    x
  )
})
