## occurencies

Write subroutine prepared to be called from C language assuming the following prototype:

```c
void * wystapienia(void * obszar, unsigned int n);
```

Function is meant to allocate an array for occurencies of characters in `obszar` buffer. This buffer has length on `n` bytes which is passed as the second argument. Source buffer consists of bytes with values from range of <0,255>. Each row from the resulting array should contain 8 bit for input character and 32bit counter. Function should return pointer to the allocated buffer. Characters that do not occur are also placed in the array.

Tip:

To allocate array you can use `malloc` function which has following prototype:

```c
void * malloc(unsigned int k);
```

It assigns k-byte buffer and returns pointer to it. 
It returns -1 value if something went wrong and buffer cannot be allocated.
Because it's fitting the C standard, malloc does not clear the stack from it's argument.