library(pracma)

#'@title Generate a random matrix for practice
#'
#'@description Given ncols, nrows, min, max, this method generates a random matrix
#'@importFrom stats runif
#'@param ncols the number of columns of the matrix
#'@param nrows number of rows of the matrix
#'@param min minimum of the random number included in the matrix
#'@param max maximum of the random number included in the matrix
#'@return x a random matrix generated
#'@examples
#'random_matrix_generator(100,100,0,100)
#'
#'@export
random_matrix_generator <- function(ncols, nrows, min, max) {
  n <- nrows * ncols
  data <- floor(runif(n, min = min, max = max))
  x <- matrix(data = data, nrow = nrows, ncol = ncols, byrow = FALSE)
  return(x)
}

#'@title Rows of Zero detector
#'@description
#'Given a matrix, this detects rows of zero of the matrix's rref form.
#'@param x a matrix
#'@returns TRUE if there's rows of zero, FALSE if there isn't row of zero.
#'@examples
#'B<-matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3), nrow=4, ncol=3, byrow=TRUE)
#'rows_of_zero_detector(B)
#'
#'@importFrom pracma rref
#'
#'@export
rows_of_zero_detector <- function(x) {
  x <- rref(x)
  zero_rows_indices <- which(rowSums(abs(x)) == 0)
  if (length(zero_rows_indices) != 0) {
    print("This matrix has rows of zero in its rref form")
    return(TRUE)
  }else {
    return(FALSE)
    print("This matrix doesn't have rows of zero in its rref form")
  }
}

#'@title Linear dependency detector
#'@description
#'Given a matrix, this returns if the matrix is linearly dependent or not
#'
#' @param x a matrix
#' @return This returns TRUE or FALSE
#' @examples
#' c<-matrix(c(1, 2, 3,
#'4, 5, 6,
#'7, 8, 9),
#'nrow=4, ncol=3, byrow=TRUE)
#'linear_dependent_detector(c)
#'
#'@export
linear_dependent_detector <- function(x) {
  matrix_rank <- qr(x)$rank
  min_dimension <- min(nrow(x), ncol(x))
  if (matrix_rank < min_dimension) {
    return(TRUE)  # Matrix is linearly dependent
    print("This matrix contains linearly dependent vector")
  } else {
    return(FALSE)  # Matrix is linearly independent
    print("All vectors in this matrix are linearly independent")
  }
}

#'@title find the basis of a set of vectors
#'@description
#'Given list of vectors, this identify the linearly independent vectors and
#'returns the basis of the vector.
#'
#' @param vectors a list of vectors
#' @return This returns the subset of vectors that's the basis
#' @examples
#' vectors <- list(
#'a = c(1, 2, 3),
#'b = c(4, 5, 6),
#'c = c(7, 8, 9)
#')
#'find_basis_from_list(vectors)
#'
#'@export

find_basis_from_list <- function(vectors) {
  lengths <- sapply(vectors, length)
  if(min(lengths) != max(lengths)) {
    stop("The list of vectors need to be of the same length")
  }
  # Convert the list of vectors into a matrix
  matrix <- do.call(cbind, vectors)
  # Perform QR decomposition on the matrix
  qr.decomp <- qr(matrix)
  # Get the rank of the matrix
  rank <- qr.decomp$rank
  # Select the columns corresponding to the independent vectors
  basis <- matrix[, qr.decomp$pivot[1:rank]]
  return(basis)
}

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
#'
#'@export
pivot_check <- function(matrix) {
  rref_matrix <- pracma::rref(matrix)
  if(all(rref_matrix == 0)) {
    return("There are 0 pivots in the matrix")
  }
  pivots <-  sum(diag(rref_matrix) == 1)
  cat("There are", pivots, "pivots in the matrix. \n")
  return(pivots)
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
#'@examples
#'\dontrun{
#'def("Codomain")
#'}
#'@export
def <- function(term) {
  row <- which(glossary$Terms == term)
  if(length(row) > 0) {
    return(glossary$Definition[row])
  } else {
    return("Term not found")
  }
}
