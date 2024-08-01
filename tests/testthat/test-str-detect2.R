test_that("special cases are correct", {
  expect_equal(str_detect2(character(), "x"), logical())

  expect_equal(str_detect2(NA, "x"), FALSE)
  expect_equal(str_detect2(NA, "x", negate = TRUE), TRUE)
})

test_that("vectorised patterns work", {
  expect_equal(
    str_detect2("ab", c("a", "b", "c")),
    c(TRUE, TRUE, FALSE)
  )
  expect_equal(
    str_detect2(c("ca", "ab"), c("a", "c")),
    c(TRUE, FALSE)
  )

  expect_equal(
    str_detect2("ab", c("a", "b", "c"), negate = TRUE),
    c(FALSE, FALSE, TRUE)
  )
})
