test_that("random matrix generator generates the required matrix", {
  # the object generated should be a matrix
  expect_true(is.matrix(random_matrix_generator(3, 4, 0, 4)))
  # the matrix has the correct ncol
  expect_true(ncol(random_matrix_generator(3, 4, 0, 4)) == 3)
  # the matrix has the correct nrow
  expect_true(nrow(random_matrix_generator(3, 4, 0, 4)) == 4)
})

A <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3),
            nrow = 4, ncol = 3, byrow = TRUE)
B <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, ncol = 3, byrow = TRUE)
test_that("this detects rows of zero", {
  expect_true(rows_of_zero_detector(A))
  expect_true(rows_of_zero_detector(B))
})

C<-matrix(c(1,0,0,0,1,0,0,0,1), nrow=3,ncol=3,byrow=TRUE)
test_that("this detects linearly dependent vector", {
  expect_true(linear_dependent_detector(B))
  expect_false(linear_dependent_detector(C))
})

test_that("this counts number of pivots", {
  expect_equal(pivot_check(A), 2)
  expect_equal(pivot_check(B), 2)
  expect_equal(pivot_check(C), 3)
})

vector_list1 <- list(c(1,4,7),c(2,5,8),c(3,6,9))
vector_list2 <- list(c(1,0,0),c(0,0,0),c(2,3,4))
test_that("This returns the basis of set of vectors",{
  expect_equal(findBasisFromList(vector_list1), matrix(c(1,2,4,5,7,8),nrow=3,ncol=2,byrow=TRUE))
  expect_equal(findBasisFromList(vector_list2), matrix(c(1,2,0,3,0,4),nrow=3,ncol=2,byrow=TRUE))
})

test_that("this glossary searcher works", {
  expect_equal(def("Injection"), "Term not found")
  expect_equal(def("Span"), "The span of a set of vectors is the collection of all linear combinations of that set")
})








