## Avg Wd

Write subroutine in x86 masm with the following prototype:

```c
float avg_wd(int n, void * tablica, void * wagi);
```

Subroutine should be using x87 instructions. 
Assuming that `tablica` and `wagi` are `n`-element arrays of float numbers, goal of the subroutine is to calculate weighted average of every element in `tablica`. Before ending the subroutine, only the result should remain on x87 stack.