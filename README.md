
# janeaustenr <img src="tools/logo.png" align="right"/>

<!-- badges: start -->
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/janeaustenr)](https://cran.r-project.org/package=janeaustenr)
[![R-CMD-check](https://github.com/juliasilge/janeaustenr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/juliasilge/janeaustenr/actions/workflows/R-CMD-check.yaml)
[![DOI](https://zenodo.org/badge/22224/juliasilge/janeaustenr.svg)](https://zenodo.org/badge/latestdoi/22224/juliasilge/janeaustenr)
<!-- badges: end -->

## An R Package for Jane Austen's Complete Novels

> “The person, be it gentleman or lady, who has not pleasure in a good novel, 
> must be intolerably stupid.”

(from Mr. Tilney in *Northanger Abbey*)

This package provides access to the full texts of Jane Austen's 6 completed, published novels. The UTF-8 plain text for each novel was sourced from [Project Gutenberg](https://www.gutenberg.org/), processed a bit, and is ready for text analysis. Each text is in a character vector with elements of about 70 characters. The package contains:

* `sensesensibility`:  *Sense and Sensibility*, published in 1811
* `prideprejudice`:  *Pride and Prejudice*, published in 1813
* `mansfieldpark`:  *Mansfield Park*, published in 1814
* `emma`:  *Emma*, published in 1815
* `northangerabbey`:  *Northanger Abbey*, published posthumously in 1818
* `persuasion`:  *Persuasion*, also published posthumously in 1818

There is also a function `austen_books()` that returns a tidy data frame of all 6 novels. 

Users should be aware that there are some differences in usage between the novels as made available by Project Gutenberg. For example, "anything" vs. "any thing", "Mr" vs. "Mr.", and using underscores vs. all caps to indicate italics/emphasis.

## Installation

You can install the released version of janeaustenr from
[CRAN](https://CRAN.R-project.org) with:

```r
install.packages("janeaustenr")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("juliasilge/janeaustenr")
```

## How to Use This Package

For some ideas on getting started with analyzing these texts, see my [blog post on sentiment analysis of Austen's novels](https://juliasilge.com/blog/if-i-loved-nlp-less/). For help within R, try `?persuasion` or similar for getting started with the data sets.

This project is released with a [Contributor Code of
Conduct](https://www.contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
