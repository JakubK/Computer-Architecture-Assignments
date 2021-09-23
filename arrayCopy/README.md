## Array Copy

Library function from C language `malloc` of the following prototype:

```c
void * malloc(unsigned int k);
```

Assigns k-byte buffer of memory and returns an address assigned to it. If the required buffer could not be allocated, it returns 0.
Write subroutine in x86 masm, ready to be called from C language with the following prototype:

```c
int * kopia_tablicy(int tab1[], unsigned int n);
```

Subroutine `kopia_tablicy` creates new array with the same size as the given `tab1`, its `n`. New array should contain only even elements from the original, remaining elements have to be set to zero.
Address of new array should be returned (or 0 if failure)

Tips:
1. Create new array with `malloc`
2. Parity check can be easily done by checking least significat bit of number being tested.