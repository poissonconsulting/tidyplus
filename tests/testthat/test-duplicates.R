test_that("can read multiple hobo csv file", {
  tib <- dplyr::tibble(x = c(1, 2, 1), y = c(1, 1, 1))
  expect_identical(ps_duplicates(tib), tib[c(1, 3), ])
  expect_identical(ps_duplicates(as.data.frame(tib)), tib[c(1, 3), ])
  
  expect_equal(
    ps_duplicates(data.frame(x = c(1, 2, 1), y = 1:3), "x"),
    dplyr::tibble(x = c(1, 1), y = c(1, 3))
  )
  expect_equal(
    ps_duplicates(data.frame(x = c(1, 2, 1), y = 1:3), c("x", "y")),
    dplyr::tibble(x = double(0), y = double(0))
  )
})
