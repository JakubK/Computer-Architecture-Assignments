## Sparse to Dense

Sparse matrix is used to represent a matrix containing large amount of zeros.
Sparse matrices are stored in so called CSR format (compressed sparse row) where 3 vectors (arrays) are used: A, IA and JA.

Array A contains next non-zero elements of matrix from dense matrix, read by rows from left to right.
Size of A is equal to number of non-zero elements in dense matrix.

IA array is constructed in following order:

$$ IA[0] = 0 $$
$$ IA[i] = IA[i-1] + k(i) $$
where $k(i)$ is number of non-zero elements in $i$ row of dense matrix.

JA array contains indices of columns from dense matrix under which resides given element in A array.

For example for matrix $M$ with size of 4x4, vectors A, IA and JA are represented as follows:

$$

M =
\begin{bmatrix}
0 & 0 & 0 & 0\\
5 & 8 & 0 & 0\\
0 & 0 & 3 & 0\\
0 & 6 & 0 & 0
\end{bmatrix}
$$

$$
A = [5,8,3,6],
IA = [0,0,2,3,4],
JA = [0,1,2,1]
$$

Write subroutine in x86 masm ready to be called from C language which is going to convert matrix from sparse format to dense. Prototype of such subroutine should match the following syntax in C:

```c
float * sparse_to_dense(int cols, int size_A, float * A, int size_IA, int * IA, int size_JA, int * JA);
```

Where `cols` param determines the amount of columns in $M$ matrix.
For memory allocation for result use `malloc` function from C.