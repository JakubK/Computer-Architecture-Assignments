## Find Min Element

Below is a fragment of program in C language:

```c
int pomiary[7], * wsk;
wsk = szukaj_elem_min(pomiary,7);
printf("\nElement minimalny = %d\n", *wsk);
```

Write subroutine in x86 masm ready to be called from given C program with the following prototype:

```c
int * szukaj_elem_min(int tablica[], int n);
```

Subroutine should find smallest number in array and return a pointer to it. Number of elements is stored in `n`.