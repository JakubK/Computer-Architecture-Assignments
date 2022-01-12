## mul at once

Write subroutine in x86 masm adjusted to be called from C language. Subroutine should match the following prototype:

```c
__m128 mul_at_once(__m128 one, __m128 two);
```

Which is going to return the result of multiplying 4 values of integer types from variable `one` with those from `two`.

Present the result in client program in C language.
Use `PMULLD` instruction to solve this task.

Tip:

__m128 type is an union. In given task it's necessary to use array m128_i32 which is it's field. (Check docs for xmmintrin.h)

