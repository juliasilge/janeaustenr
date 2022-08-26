# tests for austen_books function

context("Tidy dataframe for books")

test_that("factor order is correct", {
        d <- austen_books()
        expect_equal(levels(d$book)[1], "Sense & Sensibility")
        expect_equal(levels(d$book)[6], "Persuasion")
})

test_that("tidy frame for Austen books is right", {
        lines_by_book <- table(austen_books()$book)
        expect_length(lines_by_book, 6L)
        # the factor levels still in the right order?
        expect_equal(names(lines_by_book)[1L], "Sense & Sensibility")
        expect_equal(names(lines_by_book)[6L], "Persuasion")
        # Persuasion has fewer lines than Emma?
        expect_lt(lines_by_book[[6L]], lines_by_book[[4L]])
})
