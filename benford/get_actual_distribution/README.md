## Get actual distribution

Write subroutine in x86 masm with prototype matching following signature in C language:
```c
float * get_actual_distribution(wchar_t * data, unsigned int len);
```

which is going to build a table with distribution of occuring characters in `data` string. Distribution should mention all allowed digits from '1' to '9', which could occur in given data.
Length of string is stored in `len`.

You can use already implemented function matching C standard:
```c
void * build_table(unsigned int n);
```

Which allocated zeroed buffer of `n` bytes and returns address to it's beginning. Assume that this function always gets called without errors.

Sample data:

```c
wchar_t data[] = L"31231231,123123543,1231312,1231231,23423432,";
```