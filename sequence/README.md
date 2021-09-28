## Sequence

Write subroutine in x86 masm ready to be called from C language with the following prototype:

```c
float szereg(unsigned int n);
```

Subroutine should calculate sum of n elements from given sequence:

$$ \frac{1}{2} + \frac{1}{3} + \frac{1}{4} + \frac{1}{5} + ... + \frac{1}{n} $$



Tips and Requirements:

- Code subroutine cannot have any CALL instruction
- Make sure x87 stack won't get overflown for any n (8 registers)