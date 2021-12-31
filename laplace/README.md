## Laplace

In image processing, one of the key operations in edge detection is gradient calculation.
Calculating gradient is about computing partial derivative from discrete function of each variable (direction) x and y. In digital images this operation is simplified to matrix multiplication for each pixel including it's neighbors (so called convolution). One of popular methods for gradient calculation is Laplasian (second order derivative) which in discrete functions has form of 3x3 matrix 
presented as below:

$$
\begin{bmatrix}
0 & 1 & 0\\
1 & -4 & 1\\
0 & 1 & 0
\end{bmatrix}
$$

Goal of this task is to write subroutine in x86 masm, adjusted to be called from C language with the following function prototype:

```c
void Laplasjan(unsigned char * obraz, unsigned int w, unsigned int h);
```

Subroutine `Laplasjan` should for an image in 8-bit gray scale (256 integral values without sign)
of $w$ x $h$ dimensions calculate its laplasian. Result should be stored in place of input image.

Tips:

- In memory elements of image are aligned by rows(just like characters in screen memory in text mode)
- For outer elements (on the edge of image) assume that missing elements are zeros.
