## NWD

Write subroutine in x86 masm adjusted to be called from C language.
Subroutine should match following prototype:

```c
unsigned int NWD(unsigned int a, unsigned int b);
```

Subroutine should compute greatest common divisor of given 2 numbers `a` and `b`. The computation should be done using recursive algorithm according to code in C given below:

```c
unsigned int NWD(unsigned int a, unsigned int b)
{
    unsigned int wyn;
    if (a == b)
        wyn = a;
    
    else if(a > b)
        wyn = NWD(a - b,b);
    else
        wyn = NWD(a,b-a);
    return wyn;
}
```