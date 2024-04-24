library(pracma)
#function1
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

#function2
#'@title Rows of Zero detector
#'@description
#'Given a matrix, this detects rows of zero of the matrix's rref form.
#'@param x a matrix
#'
#'@examples
#'B<-matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3), nrow=4, ncol=3, byrow=TRUE)
#'rows_of_zero_detector(B)
#'
#'@importFrom pracma rref
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
#'@title find the basis of a set of vectors
#'@description
#'Given list of vectors, this identify the linearly independent vectors and
#'returns the basis of the vector.
#'
#' @param vectors a set of vectors
#' @return This returns the set of vectors that's the basis
#' @examples
#' vectors <- list(
#'a = c(1, 2, 3),
#'b = c(4, 5, 6),
#'c = c(7, 8, 9)
#')
#'findBasisFromList(vectors)

findBasisFromList <- function(vectors) {
  lengths <- sapply(vectors, length)
  if(min(lengths) != max(lengths)){
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
#dataframe-definitions
