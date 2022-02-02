## Subsequence

Write function in 32bit x86 masm meant to be called from C language assuming following prototype:

```c
int * podciag (int * t1, int * t2);
```

Function for 2 non empty arrays of integers `t1` and `t2` finds and returns as a result first found longest common subsequence. Every array ends with 0 element not taken in its count. If there is no subsequence longer than 1, return 0.