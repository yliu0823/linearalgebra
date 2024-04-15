library(pracma)
A <- matrix(c(1,4,5,6,7,8,3,6,4),3,3,byrow=TRUE)
rref(A)
linear_dependent_c <- function(x){
  x_ncol <- ncol(x)
  x_rref <- rref(x)

  for (i in 1:x_ncol){

  }
}
return_linear_dependent_
