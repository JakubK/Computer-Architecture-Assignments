## Series

Write subroutine in x86 masm callable from C language using following prototype:

```c
float szereg(unsigned int n);
```

Subroutine should be able to calculate sum of n elements of series in form of:

$$ \frac{1}{2} + \frac{1}{3} + \frac{1}{4} + \frac{1}{5} + ... + \frac{1}{n} $$

Computation has to bed one using recursive formula:

$ \frac{1}{2} $ for n = 1<br>

$ \frac{1}{n+1} + szereg(n-1) $ for n > 1

Tip: Make sure x87 stack won't be overflown.