
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

A <- random_matrix_generator(3, 3, 1, 5)
A
#>      [,1] [,2] [,3]
<<<<<<< HEAD
#> [1,]    2    3    1
#> [2,]    4    1    4
#> [3,]    3    3    2
=======
#> [1,]    1    4    1
#> [2,]    3    2    4
#> [3,]    1    4    3
>>>>>>> 3e2a06689002134030e08de516e22a49864f1442
```

Above we have matrix A, to check if there is a row of 0’s, we can use
the function below:

``` r
rows_of_zero_detector(A)
#> [1] FALSE
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
#> [1] 3
```

If we have a list of vectors and want the basis of them, use the
function below:

``` r
# List of vectors
vectors <- list(a = c(1, 2, 3), b = c(4, 5, 6), c = c(7, 8, 9)
)

find_basis_from_list(vectors)
#>      a b
#> [1,] 1 4
#> [2,] 2 5
#> [3,] 3 6
```

If you do not know what ‘basis’ is, you can use the function below:

``` r
def("Basis")
#> [1] "A basis of a vector space is an ordered set of vectors which is linearly independent and spans the vector space. Note that every basis of a vector space has the same number of vectors, which is called the dimension of the vector space. and {[2;1;0],[1;1;1],[1;2;1]} P3 has bases {1,x,x2,x3} (the standard basis) and {1,x,2x2-1,4x3-3x} (the Tchebicheff basis) "
```

If you want to view the glossary data frame, you can use the code below:

``` r
linearalgebra::glossary
#>                   Terms
#> 1                1-to-1
#> 2                 Basis
#> 3              Codomain
#> 4          Column Space
#> 5            Consistent
#> 6             Dimension
#> 7                Domain
#> 9                 Field
#> 10      Gauss Reduction
#> 11          Homogeneous
#> 12                Image
#> 13   Linear Combination
#> 14   Linearly Dependent
#> 15 Linearly Independent
#> 16              Nullity
#> 17           Null Space
#> 18                 onto
#> 19                Pivot
#> 20                Range
#> 21                 Rank
#> 22 Reduced Echelon Form
#> 23            Row Space
#> 24               Scalar
#> 25                 Span
#> 26             Subspace
#> 28         Vector Space
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Definition
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                A linear transformation, T, is 1-to-1 if each vector in the range of T has at most a single preimage. Thus, for any vector w, the equation T(x) = w can be solved by at most a single value of x. The linear transformation T is 1-to-1 if and only if the null space of its corresponding matrix has only the zero vector in its null space. Equivalently, a linear transformation is 1-to-1 if and only if its corresponding matrix has no non-pivot columns. • 
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           A basis of a vector space is an ordered set of vectors which is linearly independent and spans the vector space. Note that every basis of a vector space has the same number of vectors, which is called the dimension of the vector space. and {[2;1;0],[1;1;1],[1;2;1]} P3 has bases {1,x,x2,x3} (the standard basis) and {1,x,2x2-1,4x3-3x} (the Tchebicheff basis) 
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                The codomain of a linear transformation is the vector space which contains the vectors resulting from the transformation's action. Thus, if T(v) = w, then v is a vector in the domain and w is a vector in the range, which in turn is contained in the codomain.
#> 4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     The column space of a matrix is the subspace of the codomain which is spanned by the columns of the matrix. The dimension of the column space is called the rank of the matrix, and is equal to the dimension of the column space.Synonyms: If a linear transformation T is represented by a matrix A, then the range of T is equal to the column space of A.
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         A system of linear equations is consistent if it has a solution. Note that a homogeneous system Ax=0 will always be consistent as it always has the solution x=0 (the trivial solution). 
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             The dimension of a vector space is the number of vectors in any basis of the space. P3 has dimension 4 (with basis {1,x,x2,x3}) C has dimension 1 when viewed as a vector space with complex scalars, but it has dimension 2 if it is viewed as a vector space with real scalars (with basis {1,i}). 
#> 7                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       The domain of a linear transformation is the vector space on which the transformation acts. Thus, if T(v) = w, then v is a vector in the domain and w is a vector in the range, which in turn is contained in the codomain.
#> 9                                                                                    A field is an algebraic structure with addition, "+", and multiplication, "·", (and subtraction and division) with certain rules. A vector space is defined with scalars chosen from a particular field. The rules which define a field F are: For all a, b and c∈F a+b ∈ F (Closure of Addition) a+b = b+a (Commutativity of Addition) a+(b+c) = (a+b)+c (Associativity of Addition) There is some 0∈F such that 0+a=a (Additive Identity) For any a∈F there is some b∈F such that a+b=0 (Additive Inverse) [We call this element -a] a·b ∈ F (Closure of Multiplication) a·b = b·a (Commutativity of Multiplication) a·(b·c) = (a·b)·c (Associativity of Multiplication) For any non-zero a∈F there is some b∈F such that a·b = 1 (Multiplicative Inverse) [We call this element a-1] a·(b+c) = a·b + a·c and (a+b)·c = a·c + b·c (Distributive Laws) Z2, the set {0,1} with addition and multiplication mod 2 (i.e. 1+1=0) is a field. (For any prime integer p, the set {0,1,...,p-1} with addition and multiplication mod p is also a field, called Zp.) 
#> 10                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Synonyms: Gauss Reduction is also known as row reduction or just reduction.Related:
#> 11                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      A homogeneous system of linear equations is a system of linear equations without constant terms. A homogeneous matrix vector equation has form Ax=0. Note that a homogeneous linear system is always consistent, as it always has the solution x=0 (the trivial solution). 
#> 12                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         The image of a vector, v under a given linear transformation, T, is the result of applying the linear transformation to the vector, T(v). The set of the images of all vectors in the domain is called the range of T, which in turn is contained in the codomain. The image of the vector [1;2] under the matrix A=[1,2;2,1;1,1] is the vector [5;4;3] The image of the polynomial x2+3x+5∈P3R[x] under the linear operator D (differentiation) is the polynomial 2x+3 
#> 13                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           A linear combination of a set of vectors {v1, v2, ..., vm} is given by c1(v1) + c2(v2) + ... + cm(vm) for any choice of scalar multiples c1, c2,...,cm
#> 14                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       We say that a set of vectors is linearly dependent if one vector in the set belongs to the span of others.
#> 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     We say that a set of vectors is linearly dependent if one vector in the set belongs to the span of others. Otherwise, we say the set is linearly independent
#> 16                                                                                                                                                                                                                                                          The nullity of a matrix A is the dimension of the null space or kernel. More generally, this applies to linear maps as well as matrices. The rank-nullity theorem is that the sum of the rank and the nullity of a matrix is equal to the number of columns in the matrix (the dimension of the codomain of the matrix.) The null space of the matrix B=[0,0;0,0] (the 2x2 zero matrix) is all of the domain: null(B) = R2, so B has nullity 2 = dim(R2). The null space of the 2x2 matrix C=[1,1;1,1] is the 1-dim subspace of R2 generated by the vector [1;-1]: null(C) = {[a;-a]}. Thus the nullity of C is 1. The kernel (aka null space) the linear operator D (differentiation) when applied to the space of cubic polynomials P3[x] is the set of all constant polynomials. The dimension of the space of all constant polynomials is 1, so the nullity of D:P3[x]→P2[x] is 1. 
#> 17                                                                                                                                                                                                                                                                                                         The null space of a matrix A is the set of solutions to the homogeneous equation Ax=0. The zero vector is always in the null space and the null space is a subspace of the domain space. More generally, the null space of any linear map T is the space of all inputs x such that T(x)=0. The dimension of the null space is sometimes called the nullity of the matrix or linear map. The null space of the matrix B=[0,0;0,0] (the 2x2 zero matrix) is all of the domain: null(B) = R2. The null space of the 2x2 matrix C=[1,1;1,1] is the 1-dim subspace of R2 generated by the vector [1;-1]: null(C) = {[a;-a]}. The null space of the 2x4 matrix D=[1,1,1,1;1,2,3,4] is the 2-dim subspace of R4 generated by the vectors [1;-2;1;0] and [2;-3;0;1]: null(D) = {[z+2w;-2z-3w;z;w]} = 〈[1;-2;1;0],[2;-3;0;1]〉. Synonyms: kernel
#> 18                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        A linear transformation, T, is onto if its range is all of its codomain, not merely a subspace. Thus, for any vector w, the equation T(x) = w has at least one solution x (is consistent). The linear transformation T is 1-to-1 if and only if the null space of its corresponding matrix has only the zero vector in its null space. Equivalently, a linear transformation is 1-to-1 if and only if its corresponding matrix has no non-pivot columns. 
#> 19                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Pivot has two meanings: A pivot of a matrix which has been reduced to echelon form is the leading non-zero element in each row. (We also refer to the pivots of a matrix which has not been reduced, referring implicitly to its echelon form.) When performing Gaussian Reduction on a matrix, reducing it to echelon form or reduced echelon form, the act of pivoting is to perform a row swap (partial pivoting) or both a row and a column swap (total pivoting), in order to bring as large an element as possible into the pivot position. This can reduce accumulated error when performing numerical operations on large matrices. Synonyms:Related:
#> 20                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      The range of a linear transformation, T, is the set of all possible values of T(v). Thus, if T(v) = w, then v is a vector in the domain and w is its image in the range, which in turn is a subspace of the codomain. The matrix A=[1,2;2,1;1,1] (three rows and two columns) induces a linear map from R2 to R3, with domain R2Synonyms: If a linear transformation T is represented by a matrix A, then the range of T is equal to the column space of A.
#> 21                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  The rank of a matrix is the dimension of the row space, which is equal to the dimension of the column space. The rank of a linear transformation is the dimension of the range. The rank of a matrix is the number of pivots in that matrix. The rank-nullity theorem is that the sum of the rank and the nullity of a matrix is equal to the number of columns in the matrix (the dimension of the codomain of the matrix.) Synonyms: Related:
#> 22                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    A matrix is in reduced row echelon form (RREF) if: 1 - The leftmost nonzero term of each row is 1. We call these terms pivots. 2 - Each pivot is to the right of every higher pivot. 3 - Each term that is either above or below a pivot is 0. 4 - All zero rows(rows whose terms are all 0) are at the bottom of the matrix.
#> 23                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 The row space of a matrix is the subspace of the domain which is spanned by the rows of the matrix. The dimension of the row space is called the rank of the matrix, and is equal to the dimension of the column space.Synonyms:
#> 24                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           A scalar is an element of the field of scalars for a vector space. The specification of a vector space includes specifying a field of scalars. The rules of scalar multiplication for that vector space apply to scalars from that field. C has complex numbers for scalars when viewed as a vector space over the complexes, but it can also be defined as a vector space with real scalars (a vector space "over the reals") in which case a basis would be {1,i}. Synonyms:Related:
#> 25                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            The span of a set of vectors is the collection of all linear combinations of that set
#> 26                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   A subset S of a vector space is called a subspace provided it is equal to the span of a set of vectors from that vector space.
#> 28 A vector space is a set, V, together with a choice of a field of scalars, F, and operations of addition of vectors and multiplication by a scalar such that for any vectors u, v and w ∈ V and scalars s and t ∈ F the following properties hold: v+w = w+v (Commutativity of Addition) u+(v+w) = (u+v)+w (Associativity of Addition) There is a vector 0∈V such that v + 0 = v for all v∈V (Additive Identity) For any vector v∈V there is some vector w∈V such that v+w=0 (Additive Inverse) [We call this element -v] (s·t)v = s(tv) (Associativity of Scalar Multiplication) For 1∈F (the multiplicative identity of F) we have 1v = v (Multiplicative Identity) s(v+w) = sv+sw and (s+t)v = sv+tv (Distributive Laws) C2 is the set {[a;b;c] where a,b∈C} with scalar multiplication by complex numbers. M2,2(R) is the set of 2x2 matrices with real entries, with matrix addition and scalar multiplication by real numbers. P3R[x] is the set of cubic (or less) degree polynomials in x with real coefficients, {a+bx+cx2+dx3, where a,b,c∈R} with addition of polynomials and scalar multiplication by real numbers. Synonyms:Related:
```
