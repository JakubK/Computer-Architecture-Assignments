## quick_max

Write subroutine in x86 masm with client program in C language. Subroutine must match following prototype:

```c
__m128 quick_max(short int t1[], short int t2[]);
```

Which is going to greater elements from corresponding pairs of elements from both arrays `t1` and `t2`. Instruction from group PMAXxx should be used to solve this task. 


Tip:

Remember to add .xmm directive at the top of your asm file

__m128 type is an union, to read the result in C you have to use m128_i16 field from it.

Example calls:

```c
short int val1[8] = {1, -1, 2, -2, 3, -3, 4, -4};
short int val2[8] = {-4, -3, -2, -1, 0, 1, 2, 3};
__m128 t1 = quick_max(val1,val2); // -> t1.m128_i16 = {1,-1,2,-1,3,1,4,3};
```