test_that("returns only duplicated rows of selected columns", {
  tib <- dplyr::tibble(x = c(1, 2, 1), y = c(1, 1, 1))
  expect_identical(duplicates(tib), tib[c(1, 3), ])
  expect_identical(duplicates(as.data.frame(tib)), tib[c(1, 3), ])
  
  expect_equal(
    duplicates(data.frame(x = c(1, 2, 1), y = 1:3), x),
    dplyr::tibble(x = c(1, 1), y = c(1, 3))
  )
  
  expect_equal(
    duplicates(data.frame(x = c(1, 2, 1), y = 1:3), x, y),
    dplyr::tibble(x = double(0), y = double(0))
  )
})

test_that("errors when no input argument is supplied", {
  expect_error(
    duplicates(),
    'argument ".data" is missing, with no default',
    fixed = TRUE
  )
})

test_that("errors when input argument is not a data.frame", {
  expect_error(duplicates("a"), "Data.frame must be a data.frame.")
  expect_error(duplicates(1), "Data.frame must be a data.frame.")
  expect_error(duplicates(1L), "Data.frame must be a data.frame.")
  expect_error(duplicates(TRUE), "Data.frame must be a data.frame.")
  expect_error(duplicates(NULL), "Data.frame must be a data.frame.")
  expect_error(duplicates(NA), "Data.frame must be a data.frame.")
})
