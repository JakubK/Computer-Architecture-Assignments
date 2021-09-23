## Tan

Write subroutine in x86 masm ready to be called from C language.
Subroutine has the following prototype:

```c
double funkcja(double x, double y);
```

Subroutine should compute value of the following expression for given x and y arguments:

$$ tan(x+y/x-y) $$

Tip:

`FPTAN` instruction calculates value on tangent function for argument given on top of FPU stack. After completion, the argument is taken out of stack, `p` and `q` numbers are loaded on top.
Value on the function is equal to `p/q`, note that p will reside on `ST(1)` and q on `ST(0)`.