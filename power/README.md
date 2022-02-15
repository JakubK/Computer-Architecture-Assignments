## Power

An alternate way for calculating nth power of given number (for natural exponent) is quick algorithm of $2log_2(n)$ complexity.
It assumes that eax power of number x for example 5.1<sup>10</sup> can be expressed as:

$
5.1^{10} = (5.1^{5})^2 = (5.1 *(5.1^{4}))^2 = (5.1 * (5.1^2)^2)^2
$

Write in 32bit masm function adjusted to be called from C language which is meant to compute **recursively** nth power of given 32bit number in float format. Prototype of such function should match the following:

```c
float potega(float x, unsigned int n);
```

Algorithm is based on three if statements.
<br>
If n = 0 then result is equal to 1
Else if least significant bit of n is set then result is equal to x * x<sup>n-1</sup>

Else result is equal to second power of x<sup>n/2</sup>

Tip:

Assume that the result will never exceed the precision range of float format and does not require to check it.