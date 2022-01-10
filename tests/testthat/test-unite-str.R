test_that("unite_str works", {
  data <- tibble::tibble(x = c("good", "Saw fish.", NA), y = c("2021", NA, NA))
  data <- unite_str(data, "new", x, y)
  expect_s3_class(data, "tbl_df")
  expect_identical(colnames(data), "new")
  expect_identical(data$new, c("good. 2021", "Saw fish.", NA))
})

test_that("unite_str works no columns", {
  data <- tibble::tibble(x = c("good", "Saw fish.", NA), y = c("2021", NA, NA))
  data <- unite_str(data, "new")
  expect_s3_class(data, "tbl_df")
  expect_identical(colnames(data), "new")
  expect_identical(data$new, c("good. 2021", "Saw fish.", NA))
})

test_that("unite_str works no rows", {
  data <- tibble::tibble(x = character(0), y = character(0))
  data <- unite_str(data, "new")
  expect_s3_class(data, "tbl_df")
  expect_identical(colnames(data), "new")
  expect_identical(data$new, character(0))
})

test_that("unite_str works sep", {
  data <- tibble::tibble(x = c("good", "Saw fish.", NA), y = c("2021", NA, NA))
  data <- unite_str(data, "new", x, y, sep = "..")
  expect_s3_class(data, "tbl_df")
  expect_identical(colnames(data), "new")
  expect_identical(data$new, c("good..2021", "Saw fish.", NA))
})

test_that("unite_str works not remove", {
  data <- tibble::tibble(x = c("good", "Saw fish.", NA), y = c("2021", NA, NA))
  data <- unite_str(data, "new", x, y, remove = FALSE)
  expect_s3_class(data, "tbl_df")
  expect_identical(data$new, c("good. 2021", "Saw fish.", NA))
  expect_snapshot_data(data, "notremove")
})

test_that("unite_str works integer", {
  data <- tibble::tibble(x = c(1, 2, NA), y = c(3, NA, NA))
  data <- unite_str(data, "new", x, y)
  expect_s3_class(data, "tbl_df")
  expect_identical(colnames(data), "new")
  expect_identical(data$new, c("1. 3", "2", NA))
})

test_that("unite_str ", {
  data <- tibble::tibble(x = c("", "", NA), y = c("", NA, ""))
  data <- unite_str(data, "new", x, y)
  expect_s3_class(data, "tbl_df")
  expect_identical(colnames(data), "new")
  expect_identical(data$new, c(NA_character_, NA_character_, NA_character_))
})
