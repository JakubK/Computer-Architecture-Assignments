## Pi

Write subroutine in x86 masm prepared to be called from C language using the following prototype:

```c
float liczba_pi(unsigned int n);
```

Subroutine should calculate approximation of number PI by computing multiplication of `n` elements (n >= 1) of given series:

$
\pi = 2 * \frac{2}{1} * \frac{2}{3} * \frac{4}{3} * \frac{4}{5} * \frac{6}{5} * \frac{6}{7} * \frac{8}{7} * \frac{8}{9} * \frac{10}{9} * \frac{10}{11}
$