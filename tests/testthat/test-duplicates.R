test_that("returns only duplicated rows of selected columns", {
  tib <- tibble::tibble(x = c(1, 2, 1), y = c(1, 1, 1))
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
  data <- tibble::tibble(x = c(1, 2, 1, 1), y = c(1, 1, 1, 5))
  expect_identical(
    duplicates(data, y),
    tibble::tibble(x = c(1, 2, 1), y = c(1, 1, 1))
  )
  expect_identical(
    duplicates(data, x, y),
    tibble::tibble(x = c(1, 1), y = c(1, 1))
  )
  expect_identical(
    duplicates(data, y, x),
    tibble::tibble(x = c(1, 1), y = c(1, 1))
  )
  expect_identical(
    duplicates(data),
    tibble::tibble(x = c(1, 1), y = c(1, 1))
  )
  expect_identical(
    duplicates(data, y, .keep_all = FALSE),
    tibble::tibble(y = c(1, 1, 1))
  )
})


test_that("handles data frame with no rows", {
  data <- tibble::tibble(x = integer(), y = integer())
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
  data <- tibble::tibble()
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
  data <- tibble::tibble(x = c(1, 2, NA, 1, 1), y = c(1, 1, NA, NA, NA))
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
  data <- tibble::tibble(x = c(1, 2, NA), z = 1:3)
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

test_that("preserves groups", {
  data <- tibble::tibble(
    X = c(1, 2, 2, 3, 3, 4, 4),
    Y = c(11, 12, 13, 14, 14, 15, 15),
    a = c("red", "orange", "yellow", "green", "green", "blue", "blue"),
    b = c("white", "white", "white", "white", "white", "white", "white")
  )
  data <- dplyr::group_by(data, a, b)
  data <- duplicates(data)

  data_dup <- tibble::tibble(
    X = c(3, 3, 4, 4),
    Y = c(14, 14, 15, 15),
    a = c("green", "green", "blue", "blue"),
    b = c("white", "white", "white", "white")
  )
  data_dup <- dplyr::group_by(data_dup, a, b)

  expect_identical(data_dup, data)
})

test_that("preserves single active geometry column called geometry", {
  skip_if_not_installed("sf")

  data <- tibble::tibble(
    X = c(1, 2, 2, 3, 3, 4, 4),
    Y = c(11, 12, 13, 14, 14, 15, 15),
    a = c("red", "orange", "yellow", "green", "green", "blue", "blue"),
    b = c("white", "white", "white", "white", "white", "white", "white")
  )
  data <- sf::st_as_sf(data, coords = c("X", "Y"))
  data <- duplicates(data)

  data_dup <- tibble::tibble(
    X = c(3, 3, 4, 4),
    Y = c(14, 14, 15, 15),
    a = c("green", "green", "blue", "blue"),
    b = c("white", "white", "white", "white")
  )
  data_dup <- sf::st_as_sf(data_dup, coords = c("X", "Y"))

  expect_identical(data_dup, data)
})

test_that("preserves single active geometry column called map", {
  skip_if_not_installed("sf")

  data <- tibble::tibble(
    X = c(1, 2, 2, 3, 3, 4, 4),
    Y = c(11, 12, 13, 14, 14, 15, 15),
    a = c("red", "orange", "yellow", "green", "green", "blue", "blue"),
    b = c("white", "white", "white", "white", "white", "white", "white")
  )
  data <- sf::st_as_sf(data, coords = c("X", "Y"), sf_column_name = "map")
  data <- duplicates(data)

  data_dup <- tibble::tibble(
    X = c(3, 3, 4, 4),
    Y = c(14, 14, 15, 15),
    a = c("green", "green", "blue", "blue"),
    b = c("white", "white", "white", "white")
  )
  data_dup <- sf::st_as_sf(data_dup, coords = c("X", "Y"), sf_column_name = "map")

  expect_identical(data_dup, data)
})

test_that("deals with one active geometry column and one inactive geometry column", {
  skip_if_not_installed("sf")

  data <- tibble::tibble(
    X = c(1, 2, 2, 3, 3, 4, 4),
    Y = c(11, 12, 13, 14, 14, 15, 15),
    a = c("red", "orange", "yellow", "green", "green", "blue", "blue"),
    b = c("white", "white", "white", "white", "white", "white", "white"),
    I = c(101, 102, 102, 103, 103, 104, 104),
    J = c(1001, 1002, 1003, 1004, 1004, 1005, 1005)
  )
  data <- sf::st_as_sf(data, coords = c("X", "Y"))
  data <- tibble::as_tibble(data)
  data <- sf::st_as_sf(data, coords = c("I", "J"), sf_column_name = "map")
  data <- duplicates(data)

  data_dup <- tibble::tibble(
    X = c(3, 3, 4, 4),
    Y = c(14, 14, 15, 15),
    a = c("green", "green", "blue", "blue"),
    b = c("white", "white", "white", "white"),
    I = c(103, 103, 104, 104),
    J = c(1004, 1004, 1005, 1005)
  )
  data_dup <- sf::st_as_sf(data_dup, coords = c("X", "Y"))
  data_dup <- tibble::as_tibble(data_dup)
  data_dup <- sf::st_as_sf(data_dup, coords = c("I", "J"), sf_column_name = "map")

  expect_identical(data_dup, data)
})
