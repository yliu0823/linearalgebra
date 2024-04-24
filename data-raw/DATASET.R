## code to prepare `DATASET` dataset goes here
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
usethis::use_data(DATASET, overwrite = TRUE)
