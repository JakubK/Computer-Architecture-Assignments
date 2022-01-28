## float_to_fp24

GPUs are using 24-bit format for floating point numbers with FP24 symbol.
Sign takes 1 bit, exponent 7 bits and mantissa 16 bits.
Bias for this format is equal to 63
For example -2 in FP24 is encoded as C00000

Write subroutine in x86 masm which is going to be called from C language with the following prototype:

```c
FP24 float_to_FP24(float x);
```

Subroutine is meant to convert 32-bit number x in float format to FP24

Tips:
1. Assume that x is in range of numbers able to encode in FP24
2. Assume that x is not a special value 