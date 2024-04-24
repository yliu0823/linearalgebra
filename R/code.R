library(pracma)
#'@title Check number of pivots of the matrix
#'
#'@description
#'Given a matrix object, this function calculates its rref form and counted the
#'number of pivots, this returns a sentence of information.
#'
#'@importFrom pracma rref
#'
#'@param matrix a matrix of your choice
#'
#'@return a sentence about the number of pivots of the given matrix
pivot_check <- function(matrix){
  rref_matrix <- rref(matrix)
  pivots <- apply(rref_matrix != 0,2, sum)

  total_pivots <- sum(pivots)

  return(cat("There are", total_pivots, "pivots in the matrix. \n"))
}



### WEB SCRAPING
# Doing web scraping of the definitions
library(rvest)
library(stringr)
library(dplyr)

url <- "https://www.math.ucdavis.edu/~daddel/MATH22AL/Resources/Glossary_Linear_Algebra_UMBC.html"
web <- read_html(url)


terms <- web |>
  html_nodes('.defnword') |>
  html_text()

definitions <- web |>
  html_nodes('dd') |>
  html_text()


clean_def <- function(definitions){
  cleaned_text <- str_replace(definitions, "Examples:.*", "")
  # Replace multiple spaces with a single space
  cleaned_text <- str_replace_all(cleaned_text, "\\s+", " ")
  # Replace escaped quotes with regular quotes
  cleaned_text <- str_replace_all(cleaned_text, "\\\"", "\"")
  return(cleaned_text)
}

cleaned_definitions <- clean_def(definitions)

glossary <- data.frame(
  Terms = terms,
  Definition = cleaned_definitions)


def <- function(term){
  row <- which(glossary$Terms == term)

  if(length(row) > 0){
    return(glossary$Definition[row])
  } else {
    return("Term not found")
  }
}

def("Codomain")

