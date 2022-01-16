## Zero

Write subroutine in x86 masm with the prototype matching the following signature in C language:

```c
void zeruj(__m256 liczby[], float tablica[], int n);
```

Subroutine should fill with zero only those elements of `liczby` array which are smaller than their corresponding elements from `tablica` array. Both arrays are of size `n`.

Array `liczby` contains 256-bit integral elements without sign. Subroutine should not be using 64bit registers nor static data segment.