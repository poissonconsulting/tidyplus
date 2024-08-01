test_that("returns only duplicated rows of selected columns", {
  tib <- dplyr::tibble(x = c(1, 2, 1), y = c(1, 1, 1))
  expect_identical(duplicates(tib), tib[c(1, 3), ])
  expect_identical(duplicates(as.data.frame(tib)), tib[c(1, 3), ])
  
  expect_identical(
    duplicates(data.frame(x = c(1, 2, 1), y = 1:3), x),
    dplyr::tibble(x = c(1, 1), y = c(1L, 3L))
  )
  
  expect_identical(
    duplicates(data.frame(x = c(1, 2, 1), y = 1:3), x, y),
    dplyr::tibble(x = double(0), y = integer(0))
  )
})

test_that("keep_all working", {
  data <- tibble::tibble(x = c(1,2,1,1), y = c(1,1,1,5))
  expect_identical(duplicates(data, y),
                   tibble::tibble(x = c(1,2,1), y = c(1,1,1)))
  expect_identical(duplicates(data, x, y),
                   tibble::tibble(x = c(1,1), y = c(1,1)))
  expect_identical(duplicates(data, y, x),
                   tibble::tibble(x = c(1,1), y = c(1,1)))
  expect_identical(duplicates(data),
                   tibble::tibble(x = c(1,1), y = c(1,1)))
  expect_identical(duplicates(data, y, .keep_all = FALSE),
                   tibble::tibble(y = c(1,1,1)))
})


test_that("handles data frame with no rows", {
  data <- dplyr::tibble(x = integer(), y = integer())

  expect_equal(
    duplicates(data),
    data
  )
  
  expect_equal(
    duplicates(data, x),
    data
  )
  
  expect_equal(
    duplicates(data, x, .keep_all = FALSE),
    dplyr::tibble(x = integer())
  )
})

test_that("handles data frame with no columns", {
  data <- dplyr::tibble()
  
  expect_identical(
    duplicates(data),
    data
  )

  expect_identical(
    duplicates(data, .keep_all = FALSE),
    data
  )
})

test_that("handles columns with missing values", {
  data <- tibble::tibble(x = c(1,2,NA,1,1), y = c(1,1,NA,NA,NA))
  
  expect_identical(
    duplicates(data),
    tibble::tibble(x = c(1, 1), y = as.double(c(NA, NA)))
  )
  
  expect_identical(
    duplicates(data, y),
    data
  )
  
  expect_identical(
    duplicates(data, y, .keep_all = FALSE),
    tibble::tibble(y = c(1, 1, NA, NA, NA))
  )
})

test_that("handles data set with no duplicates", {
  data <- tibble::tibble(x = c(1,2,NA), z = 1:3)
  expect_identical(duplicates(data), tibble::tibble(x = double(), z = integer()))
  expect_identical(duplicates(data, x), tibble::tibble(x = double(), z = integer()))
  expect_identical(duplicates(data, x, .keep_all = FALSE), tibble::tibble(x = double()))
})

test_that("errors when input argument is not a data.frame", {
  expect_error(duplicates("a"), "Data.frame must be a data.frame.")
  expect_error(duplicates(1), "Data.frame must be a data.frame.")
  expect_error(duplicates(1L), "Data.frame must be a data.frame.")
  expect_error(duplicates(TRUE), "Data.frame must be a data.frame.")
  expect_error(duplicates(NULL), "Data.frame must be a data.frame.")
  expect_error(duplicates(NA), "Data.frame must be a data.frame.")
})
