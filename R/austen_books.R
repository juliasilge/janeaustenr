#' Tidy data frame of Jane Austen's 6 completed, published novels
#' 
#' Returns a tidy data frame of Jane Austen's 6 completed, published novels with 
#' two columns: `text`, which contains the text of the novels divided into 
#' elements of up to about 70 characters each, and `book`, which contains the titles of
#' the novels as a factor in order of publication.
#' 
#' @details Users should be aware that there are some differences in usage 
#' between the novels as made available by Project Gutenberg. For example, 
#' "anything" vs. "any thing", "Mr" vs. "Mr.", and using underscores vs. all 
#' caps to indicate italics/emphasis.
#' 
#' @return A data frame with two columns: `text` and `book`
#' 
#' @name austen_books
#' 
#' @examplesIf requireNamespace("dplyr", quietly = TRUE)
#' 
#' library(dplyr)
#'
#' austen_books() %>% 
#'     group_by(book) %>%
#'     summarise(total_lines = n())
#'
#' @export
austen_books <- function(){
        books <- list(
                "Sense & Sensibility" = janeaustenr::sensesensibility,
                "Pride & Prejudice" = janeaustenr::prideprejudice,
                "Mansfield Park" = janeaustenr::mansfieldpark,
                "Emma" = janeaustenr::emma,
                "Northanger Abbey" = janeaustenr::northangerabbey,
                "Persuasion" = janeaustenr::persuasion
        )
       ret <- data.frame(text = unlist(books, use.names = FALSE), 
                         stringsAsFactors = FALSE)
       ret$book <- factor(rep(names(books), sapply(books, length)))
       ret$book <- factor(ret$book, levels = unique(ret$book))
       structure(ret, class = c("tbl_df", "tbl", "data.frame"))
}
