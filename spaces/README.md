## spaces

Write subroutine in x86 masm in 32 bit mode adjusted to be called from C language assuming the following prototype:

```c
char * spacje(char znak);
```

Subroutine allocates 129 byte buffer using `malloc` library function.
First 180 bytes are filled with argument `znak`, and last one is filed with 0.
Subroutine returns address to the allocated buffer.

Tips:
- Malloc does not free the stack from given arguments
- Malloc returns 0 when it could not allocate memory