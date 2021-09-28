## Float 2 Half

Write subroutine in x86 masm ready to be called from C language.
Subroutine should match the following prototype:

```c
HALF float_to_half(float a);
```

Subroutine should convert number `a` which is in float, to 16-bit number in HALF format (known also as binary16). Result should be stored in `AX` register.

HALF format is working just like float, but:

mantissa takes 10 bits, exponent takes 5 bits and 1 bit is for sign.


Tip:
In float format, mantissa contains 23 bits, exponent takes 8 bits.