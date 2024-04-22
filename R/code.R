library(pracma)
#function1
#'Generate a random matrix for practice
#'
#'@description Given ncols, nrows, min, max, this method generates a random matrix
#'@importFrom stats runif
#'@importFrom base matrix
#'@param ncols the number of columns of the matrix
#'@param nrows number of rows of the matrix
#'@param min minimum of the random number included in the matrix
#'@param max maximum of the random number included in the matrix
#'@return x a random matrix generated
#'@examples
#'\dontrun{
#'random_matrix_generator(100,100,0,100)
#'}
#'@export
random_matrix_generator <- function(ncols,nrows,min,max){
  n <- nrows*ncols
  data <- runif(n, min=min, max=max)
  x <- matrix(data=data, nrow=nrows,ncol=ncols,byrow = FALSE)
  return(x)
}
A<-random_matrix_generator(100,100,0,100)
B<-matrix(c(1, 2, 3,
            4, 5, 6,
            7, 8, 9,
            1, 2, 3),  # Note: this row repeats the first row
          nrow=4, ncol=3, byrow=TRUE)
rref(A)
#function2
#'Given a matrix, this detect rows of zero of the matrix's rref form
#'
#'@param x a matrix
#'
#'@example
#'\dontrun{
#'B<-matrix(c(1, 2, 3,4, 5, 6,7, 8, 9,1, 2, 3),nrow=4, ncol=3, byrow=TRUE)
#'rows_of_zero_detector(B)
#'}
#'@importsFrom pracma rref
#'@importsFrom base which
#'@importsFrom base rowSums
#'@importsFrom base length
#'@export
rows_of_zero_detector <- function(x){
  x <- rref(x)
  zero_rows_indices <- which(rowSums(abs(x)) == 0)
  if (length(zero_rows_indices)!=0){
      print("This matrix has rows of zero in its rref form")
  }
  else{
    print("This matrix doesn't have rows of zero in its rref form ")
  }
}
rows_of_zero_detector(B)
#'
#' Given a matrix, this returns if the matrix is linearly dependent or not
#' @param x a matrix
#' @importFrom base qr
#' @importFrom base min
#' @importFrom base nrow
#' @importFrom base ncol
#'
#' @example
#' c<-matrix(c(1, 2, 3,
#'4, 5, 6,
#'7, 8, 9),  # Note: this row repeats the first row
#'nrow=4, ncol=3, byrow=TRUE)
#'linear_dependent_detector(c)
linear_dependent_detector <- function(x){
  matrix_rank <- qr(x)$rank
  min_dimension <- min(nrow(x), ncol(x))
  if (matrix_rank < min_dimension) {
    return(TRUE)  # Matrix is linearly dependent
  } else {
    return(FALSE)  # Matrix is linearly independent
  }
}
c<-matrix(c(1, 2, 3,
            4, 5, 6,
            7, 8, 9),  # Note: this row repeats the first row
          nrow=4, ncol=3, byrow=TRUE)
linear_dependent_detector(c)
#function4-check_subspace
#'Define the function to check subspace
#'@param vectors a list of vectors
#'
#'@importFrom
checkSubspace <- function(vectors) {
  # Number of vectors
  n <- length(vectors)

  # Check for zero vector
  zero_vector <- rep(0, length(vectors[[1]]))
  if (!any(sapply(vectors, function(v) all(v == zero_vector)))) {
    cat("The set does not contain the zero vector.\n")
    return(FALSE)
  }

  # Check closure under addition
  for (i in 1:n) {
    for (j in i:n) {
      sum_vector <- vectors[[i]] + vectors[[j]]
      if (!any(sapply(vectors, function(v) all(v == sum_vector)))) {
        cat(sprintf("The set is not closed under addition for vectors %d and %d.\n", i, j))
        return(FALSE)
      }
    }
  }

  # Check closure under scalar multiplication
  test_scalars <- c(-1, 0, 1, 2)  # A sample of scalars for testing
  for (scalar in test_scalars) {
    for (i in 1:n) {
      scaled_vector <- scalar * vectors[[i]]
      if (!any(sapply(vectors, function(v) all(v == scaled_vector)))) {
        cat(sprintf("The set is not closed under scalar multiplication for vector %d with scalar %d.\n", i, scalar))
        return(FALSE)
      }
    }
  }

  cat("The set is a subspace.\n")
  return(TRUE)
}

# Example usage
v1 <- c(1, 1)
v2 <- c(2, 2)
v3 <- c(3, 3)
vectors <- list(v1, v2, v3)
checkSubspace(vectors)
#find basis
findBasisFromList <- function(x) {
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

#dataframe-definitions
