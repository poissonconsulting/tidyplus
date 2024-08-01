test_that("str_replace_vec works with mutate", {
  data <- tibble::tibble(
    x = c("one", "two", "three", "four"),
    y = c("one apple", "two bananas", "three pear", "four oranges")
  )

  data <- dplyr::mutate(data,
    x2 = str_replace_vec(x, c(
      "one" = "1",
      "two" = "2",
      "three" = "3",
      "four" = "4"
    ))
  )

  expect_identical(data$x2, c("1", "2", "3", "4"))
  expect_identical(data$y, c("one apple", "two bananas", "three pear", "four oranges"))
})

test_that("str_replace_vec with regex", {
  x <- c("REP_1", "REP1-2", "MR REP 2")

  x2 <- str_replace_vec(x, c(
    "(?<!(\\d|\\s))[:punct:]" = "-", # punctuation not preceded by a digit or space
    "(?<=REP)\\s" = "-", # a space precded by REP
    "REP(?=\\d)" = "REP-", # REP followed by a digit
    "^[:alpha:]+\\s(?=REP)" = ""
  )) # Letters with space at start of string followed by REP

  expect_identical(x2, c("REP-1", "REP-1-2", "REP-2"))
})

test_that("str_replace_vec with non character strings", {
  x <- c("one", "two", "three", "four", "five")

  x2 <- str_replace_vec(x, c(
    "one" = NULL,
    "two.*" = NA_character_,
    "three" = TRUE,
    "four" = character(0),
    "five" = 5L
  ))

  expect_identical(x2, c("one", NA_character_, "TRUE", "four", 5L))
  expect_type(x2, "character")
})

test_that("str_replace_vec with x no length", {
  x <- c(character(0))
  expect_length(x, 0)
  x2 <- str_replace_vec(x, c("one" = "1"))

  expect_identical(x2, character(0))

  x <- c()
  expect_length(x, 0)
  replace <- c("one" = "1")

  expect_error(str_replace_vec(x, replace))
})

test_that("str_replace_vec with replace no length", {
  x <- c("one", "two", "three", "four")
  replace <- c()
  expect_error(str_replace_vec(x, replace))

  replace <- c(character(0))
  expect_error(str_replace_vec(x, replace))
})
