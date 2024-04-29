## code to prepare `DATASET` dataset goes here
library(rvest)
library(stringr)
library(dplyr)

url <- "https://www.math.ucdavis.edu/~daddel/MATH22AL/Resources/Glossary_Linear_Algebra_UMBC.html"
web <- read_html(url)


terms <- web |>
  html_nodes(".defnword") |>
  html_text()

definitions <- web |>
  html_nodes("dd") |>
  html_text()


clean_def <- function(definitions) {
  cleaned_text <- str_replace(definitions, "Examples:.*", "")
  # Replace multiple spaces with a single space
  cleaned_text <- str_replace_all(cleaned_text, "\\s+", " ")
  # Replace escaped quotes with regular quotes
  cleaned_text <- str_replace_all(cleaned_text, "\\\"", "\"")
  return(cleaned_text)
}

cleaned_definitions <- clean_def(definitions)

glossary <- data.frame(Terms = terms, Definition = cleaned_definitions)
# Filling in the missing definitions from a textbook manually.

missing_def <- c(
  "",
  "A linear combination of a set of vectors {v1, v2, ..., vm} is given by c1(v1) + c2(v2) + ... + cm(vm) for any choice of scalar multiples c1, c2,...,cm",
  "We say that a set of vectors is linearly dependent if one vector in the set belongs to the span of others.",
  "We say that a set of vectors is linearly dependent if one vector in the set belongs to the span of others. Otherwise, we say the set is linearly independent",
  "A matrix is in reduced row echelon form (RREF) if: 1 - The leftmost nonzero term of each row is 1. We call these terms pivots. 2 - Each pivot is to the right of every higher pivot. 3 - Each term that is either above or below a pivot is 0. 4 - All zero rows(rows whose terms are all 0) are at the bottom of the matrix.",
  "The span of a set of vectors is the collection of all linear combinations of that set",
  "A subset S of a vector space is called a subspace provided it is equal to the span of a set of vectors from that vector space.",
  ""
)

missing_rows <- c(8, 13, 14, 15, 22, 25, 26, 27)
glossary[missing_rows, "Definition"] <- missing_def
# getting rid of some useless rows
glossary <- glossary[-c(8, 27), ]
glossory <- as.data.frame(glossary)
usethis::use_data(glossary, overwrite = TRUE)
