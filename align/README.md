## Align

Write in x86 masm ready to be called from C language with the following prototype:

```c
__m128 * wyrownaj(__m128 * tabl, unsigned int n, unsigned int wyrownanie);
```

`tabl` contains `n` 128-bit numbers. Subroutine should create a copy of array `tabl` with identical elements. Elements in new array should be stored in memory with addressed aligned according to `wyrownanie` parameter. `wyrownanie` is multiplication of number 2 and is in range of <16,1024>.

For example call:

```c
wyrownaj(tablica,8,16);
```

Will create 8-element where each element is under the address divisible by 16


Tip: Memory should be allocated with `malloc` function with the following prototype:

```c
void * malloc(unsigned int k);
```

which returns address of k-byte buffer. Return address can have any value. Zeroing the assigned memory is not required.