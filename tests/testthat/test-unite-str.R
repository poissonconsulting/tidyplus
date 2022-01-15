test_that("unite_str works character", {
  data <- tibble::tibble(x = c("good", "Saw fish.", NA), y = c("2021", NA, NA))
  data <- unite_str(data, "new", x, y)
  expect_s3_class(data, "tbl_df")
  expect_identical(colnames(data), "new")
  expect_identical(data$new, c("good. 2021", "Saw fish.", NA))
})

test_that("unite_str works symbol", {
  data <- tibble::tibble(x = c("good", "Saw fish.", NA), y = c("2021", NA, NA))
  skip("get unite_str working with symbol!")
  data <- unite_str(data, new, x, y)
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

test_that("unite_str missing values", {
  data <- tibble::tibble(x = c("", "", NA), y = c("", NA, ""))
  data <- unite_str(data, "new", x, y)
  expect_s3_class(data, "tbl_df")
  expect_identical(colnames(data), "new")
  expect_identical(data$new, c(NA_character_, NA_character_, NA_character_))
})

test_that("unite_str matches same", {
  data <- tibble::tibble(comment = c("", "", NA), comment.x = c("text", NA, "text3"))
  data <- unite_str(data, "comment", tidyr::matches("comment"))
  expect_s3_class(data, "tbl_df")
  expect_identical(colnames(data), "comment")
  expect_identical(data$comment, c("text", NA_character_, "text3"))
})

test_that("unite_str matches new sf as string", {
  data <- dplyr::tribble(
    ~comment, ~comment.x,  ~x, ~y,
    "text",   NA, 0, 0,
    NA,   "", 1, 0,
    "",   "text3", 2, 0) |>
    sf::st_as_sf(coords = c("x", "y"), dim = "XY")
  
  data <- unite_str(data, "comment2", tidyr::matches("comment"))
  expect_s3_class(data, "tbl_df")
  expect_s3_class(data, "sf")
  expect_identical(colnames(data), c("comment2", "geometry"))
  expect_identical(data$comment2, c("text", NA_character_, "text3"))
})
