## sort

Write subroutine in x86 masm which is should match the following prototype in C language:

```c
void sortuj(void * tablica, unsigned int n);
```

Subroutine should sort elements from array of n rows.
Each row consists of 1 byte of input character and 32 bit occurency counter.

Rows should be sorted in descending order by value of counter.