library(pracma)
#function1
#'
#'@title
#'@description
#'@importFrom
#'@param
#'@return
#'@examples
#'@export/exportS3method
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
#function3
linear_dependent_detector <- function(x){
  matrix_rank <- qr(x)$rank
  min_dimension <- min(nrow(x), ncol(x))
  if (matrix_rank < min_dimension) {
    print("The set of vectors is linearly dependent")
    return(TRUE)  # Matrix is linearly dependent
  } else {
    print("The set of vectors is linearly independent ")
    return(FALSE)  # Matrix is linearly independent
  }
}
c<-matrix(c(1, 2, 3,
            4, 5, 6,
            7, 8, 9),  # Note: this row repeats the first row
          nrow=4, ncol=3, byrow=TRUE)
linear_dependent_detector(c)
#function4-check_subspace
#function5-identify-basis
#function6-linear transformation or not
#function7-standard matrix
#function8-image&kernel
#function9-check bijectivity
#function10-bijectivity

