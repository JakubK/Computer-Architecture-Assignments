## Ascii to UTF-16

Write subroutine in x86 masm ready to be called from C language.
Subroutine should match following prototype:

```c
wchar_t * ASCII_na_UTF16(char * znaki, int n);
```

Subroutine should convert `n` characters in ascii (codes < 128) to corresponding utf-16. New characters need to be written in new array made using `malloc` function. On the end of the string there has to be 0 value on 16bits. Address of created buffer should be the return value of Subroutine.

`wchar_t` represents 16-bit characters in Unicode. Library function `malloc(k)` allocates k-byte buffer of memory and returns address to it. Content of allocated buffer is undefined.
