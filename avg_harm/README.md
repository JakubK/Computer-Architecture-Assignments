## avg harm

Write subroutine in x86 masm matching following C function prototype:

```c
float avg_harm(float * tab, unsigned int n);
```

Subroutine is meant to calculate harmonic mean.

$
\frac{n}{\frac{1}{a_1} + \frac{1}{a_2} + \frac{1}{a_3} + ...  +\frac{1}{a_n}}
$

for `n` float values of `tab` array.
Write client program in C language which is going to demonstrate working subroutine.