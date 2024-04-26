
<!-- README.md is generated from README.Rmd. Please edit that file -->

# linearalgebra

<!-- badges: start -->

[![R-CMD-check](https://github.com/yliu0823/linearalgebra/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/yliu0823/linearalgebra/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

‘linearalgebra’ aids with basic mathematics used in linear algebra. This
package also provides a dataframe with basic linear algebra functions.

## Installation

You can install the development version of linearalgebra from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("yliu0823/linearalgebra")
```

## Usage

To begin testing the various function, it is required to have a matrix.
We’ll use the random_matrix_generator to create a random matrix:

``` r
library(linearalgebra)

A <- random_matrix_generator(3,3,1,5)
A
#>      [,1] [,2] [,3]
#> [1,]    2    1    3
#> [2,]    4    4    4
#> [3,]    4    1    4
```

Above we have matrix A, to check if there is a row of 0’s, we can use
the function below:

``` r
rows_of_zero_detector(A)
#> [1] "This matrix doesn't have rows of zero in its rref form "
```

We can also check if the matrix is linearly dependent or independent.

``` r
linear_dependent_detector(A)
#> [1] FALSE
```

If we were wondering how many pivots there is, we can use the function
below:

``` r
pivot_check(A)
#> There are 3 pivots in the matrix.
```

If we have a list of vectors and want the basis of them, use the
function below:

``` r
# List of vectors
vectors <- list(a = c(1, 2, 3), b = c(4, 5, 6), c = c(7, 8, 9)
)

findBasisFromList(vectors)
#>      a b
#> [1,] 1 4
#> [2,] 2 5
#> [3,] 3 6
```

If you do not know what ‘basis’ is, you can use the function below:

``` r
def("basis")
#> [1] "Term not found"
```
