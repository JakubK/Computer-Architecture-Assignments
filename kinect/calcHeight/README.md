## Calc height

Write subroutine in x86 masm for 32 bit mode prepared to be called from C language assuming the following prototype:

```c
float obliczWysokosc(unsigned short * tablicaD, int x, int y);
```

Which will return height `W` from the ground (in milimeters) for some point residing in `tablicaD` array. Height can be computed from following formula:

$
W = [R + d(1 - \frac{y}{y_{max}})]tg(\frac{\beta}{2})
$

`x` and `y` params are indices for column and row for pixel being analyzed in `tablicaD`, the `d` is a distance from point to camera which can be read from the array.

Assume that $\beta$ is equal to 54 degrees and the maximum range is equal to R=4000mm. Use FPTAN instruction which calculates the value in radians. Result is given in form of 2 numbers.

(x_max = 640, y_max = 480).
