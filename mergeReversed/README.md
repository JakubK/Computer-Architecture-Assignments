## Merge reversed

Implement in x86 masm the following subroutine:

```c
int * merge_reversed(int tab1[], int tab2[], int n);
```

Subroutine is meant to merge 2 given ordered arrays of size n with assumption that tab2 is given in reversed order. Subroutine should return return new sorted array containting merged elements from both of them.

New array should be declared in data segment with maximum size of 2*32 Bytes. Subroutine should check if n is smaller than 32, if not then null pointer (0) should be returned.

Add client program in C.