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
