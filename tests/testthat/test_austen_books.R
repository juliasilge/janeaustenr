# tests for austen_books function

test_that("factor order is correct", {
  d <- austen_books()
  expect_identical(levels(d$book)[1], "Sense & Sensibility")
  expect_identical(levels(d$book)[6], "Persuasion")
})

test_that("tidy frame for Austen books is right", {
  skip_if_not_installed("dplyr")
  d <- austen_books() %>% 
    group_by(book) %>%
    summarise(total_lines = n())
  expect_identical(nrow(d), 6L)
  expect_identical(ncol(d), 2L)
  # the factor levels still in the right order?
  expect_identical(as.character(d$book[1]), "Sense & Sensibility")
  expect_identical(as.character(d$book[6]), "Persuasion")
  # Persuasion has fewer lines than Emma?
  expect_lt(d$total_lines[6], d$total_lines[4])
})
