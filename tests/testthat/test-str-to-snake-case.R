test_that("removes spaces from strings", {
  input <- "string of words"
  output <- str_to_snake_case(input)
  expect_equal(output, "string_of_words")
  })

test_that("underscores already present not replaced",{
  input <- "string_of words"
  output <- str_to_snake_case(input)
  expect_equal(output, "string_of_words")
})

test_that("converts CamelCase to snake_case",{
  input <- "StringOfWords"
  output <- str_to_snake_case(input)
  expect_equal(output, "string_of_words")
})

test_that("special characters are removed",{
  input <- "s!t$r@ing of %char^&act*ers"
  output <- str_to_snake_case(input)
  expect_equal(output, "string_of_characters")
})

test_that("removes trailing and starting underscores",{
  input <- "_string_of_words_"
  output <- str_to_snake_case(input)
  expect_equal(output, "string_of_words")
})

test_that("can input a multiple strings",{
  input <- c("list of strings", "strings in a list", "many strings in a list")
    output <- str_to_snake_case(input)
  expect_equal(output, c("list_of_strings", "strings_in_a_list", "many_strings_in_a_list"))
})
