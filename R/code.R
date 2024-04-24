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
#'@export
pivot_check <- function(matrix){
  rref_matrix <- rref(matrix)
  pivots <- apply(rref_matrix != 0,2, sum)

  total_pivots <- sum(pivots)

  return(cat("There are", total_pivots, "pivots in the matrix. \n"))
}
#'@title Return definition of a term in linear algebra
#'
#'@description
#'This function returns the definition of the input term in linear algebra,
#'if the term doesn't exist in our glossory term, it will return "Term not found"
#'
#'@param term a term that's commonly used in linear algebra
#'
#'@return a sentence of definition corresponding to the term,
#'or "Term not found" if it's not included in our glossory.
#'@example
#'def("Codomain")
def <- function(term){
  row <- which(glossary$Terms == term)

  if(length(row) > 0){
    return(glossary$Definition[row])
  } else {
    return("Term not found")
  }
}


