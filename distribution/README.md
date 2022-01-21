## distribution

Write subroutine in x86 masm prepared to be called from C language assuming the following form:

```c
void * rozklad(unsigned __int64 [] tab1, unsigned int n);
```

Subroutine is meant to calculate occurencies of numbers by taking in count division by 16. Array of input numbers is passed by `tab1` of size `n` elements.

Program is executed as 32bit and operates on 64bits meaning 64bit registers are not available.

Result is an where index is the reminder from division and value is number of such elements in `tab1`.

Tip:
You can allocate memory using `malloc` function:
```c
void * malloc(unsigned int bytesToAlloc);
```