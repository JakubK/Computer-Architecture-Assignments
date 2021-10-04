## Sorting

Write subroutine in x86 masm ready to be called from C language.
Subroutine should match the following prototype:

```c
unsigned __int64 sortowanie(unsigned __int64 * tab1, unsigned int n);
```

Subroutine should sort contents of n-element array `tab1` in ascending order and return value of highest element.
Elements of array are unsigned 64-bit integers, and the whole program is executed in 32bit mode, therefore 64bit registers are unavailable.

Tip:
 64 bit values can be expressed as edx:eax where edx is more significant part of number.