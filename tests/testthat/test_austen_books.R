# tests for austen_books function

all_books_in_order <- c(
  "Sense & Sensibility",
  "Pride & Prejudice",
  "Mansfield Park",
  "Emma",
  "Northanger Abbey",
  "Persuasion"
)

test_that("factor order is correct", {
  book_lines <- austen_books()
  expect_identical(levels(book_lines$book), all_books_in_order)
})

test_that("tidy frame for Austen books is right", {
  skip_if_not_installed("dplyr")
  lines_by_book <- austen_books() %>% 
    dplyr::group_by(book) %>%
    dplyr::summarise(total_lines = dplyr::n())
  expect_identical(nrow(lines_by_book), 6L)
  expect_identical(ncol(lines_by_book), 2L)
  # the factor levels still in the right order?
  expect_identical(
    as.character(lines_by_book$book),
    all_books_in_order
  )
  # Persuasion has fewer lines than Emma?
  expect_lt(
    lines_by_book$total_lines[[6]],
    lines_by_book$total_lines[[4]]
  )
})
