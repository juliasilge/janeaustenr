#' Tidy data frame of Jane Austen's 6 completed, published novels
#' 
#' Returns a tidy data frame of Jane Austen's 6 completed, published novels with 
#' two columns: \code{text}, which contains the text of the novels divided into 
#' elements of up to about 70 characters each, and \code{book}, which contains the titles of
#' the novels as a factor in order of publication.
#' 
#' @details Users should be aware that there are some differences in usage 
#' between the novels as made available by Project Gutenberg. For example, 
#' "anything" vs. "any thing", "Mr" vs. "Mr.", and using underscores vs. all 
#' caps to indicate italics/emphasis.
#' 
#' @return A data frame with two columns: \code{text} and \code{book}
#' 
#' @name austen_books
#' 
#' @examples 
#' 
#' lines_by_book <- table(austen_books()$book)
#' lines_by_book
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
