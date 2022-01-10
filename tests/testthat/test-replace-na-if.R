test_that("replace_na_if works", {
  data <- tibble::tibble(
    x = c(TRUE, FALSE, NA, FALSE),
    y = c("x is false", NA, "x is false", "x is false"))
  
  data <- dplyr::mutate(data,
                        x2 = replace_na_if(x, y == "x is false", FALSE))
  
  expect_identical(data$x2, c(TRUE, FALSE, FALSE, FALSE))
  expect_snapshot_data(data, "works")
})


