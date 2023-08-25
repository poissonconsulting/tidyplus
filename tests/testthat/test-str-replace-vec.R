test_that("str_replace_vec works", {
  data <- tibble::tibble(
    x = c("one", "two", "three", "four"),
    y = c("one apple", "two bananas", "three pear", "four oranges"))
  
  data <- dplyr::mutate(data,
                        x2 = str_replace_vec(x, c("one" = "1",
                                                  "two" = "2",
                                                  "three" = "3",
                                                  "four" = "4")))
  
  expect_identical(data$x2, c("1", "2", "3", "4"))
})

test_that("str_replace_vec with regex", {
  data <- tibble::tibble(
    x = c("REP_1", "REP1-2", "MR REP 2"))
  
  data <- dplyr::mutate(data,
                        x2 = str_replace_vec(x, c("(?<!(\\d|\\s))[:punct:]" = "-", # punctuation not preceded by a digit or space
                                                  "(?<=REP)\\s" = "-", # a space precded by REP
                                                  "REP(?=\\d)" = "REP-", # REP followed by a digit
                                                  "^[:alpha:]+\\s(?=REP)" = ""))) # Letters with space at start of string followed by REP
                         
  expect_identical(data$x2, c("REP-1", "REP-1-2", "REP-2"))
})

test_that("str_replace_vec with non character strings", {
  data <- tibble::tibble(
    x = c("one", "two", "three", "four"))
  
  data <- dplyr::mutate(data,
                        x2 = str_replace_vec(x, c("one" = "",
                                                  "two.*" = NA_character_,
                                                  "three" = TRUE,
                                                  "four" = 4L)))
  
  expect_identical(data$x2, c("", NA_character_, "TRUE", 4L))
  expect_type(data$x2, "character")
})
