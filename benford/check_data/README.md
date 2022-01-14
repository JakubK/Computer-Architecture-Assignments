## Check data

Write x86 subroutine prepared to be called from C language with the following prototype:

```c
unsigned int check_data(wchar_t * data);
```

Which is going to test if given list of payments was manipulated.
Subroutine should return 1 if the data is suspicious, in other case return 0.
The list is assumed as manipulated when the absolute value of difference between theoretical and actual distribution for any number it greater than 0.125.
Using static data segment is forbidden.

Tips:
Assume that remaining subroutines `create_benford_distribution_asm` and `get_actual_distribution` are already implemented and you are free to use them.