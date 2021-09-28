## Convert to base12

To write numbers in base12 format (duodecimal), following digits were proposed:

0123456789↊↋

In Unicode 8.0 these digits have got their own code-points with values:

0030H, 0031H,0031H...0039H,218AH,218BH.

Write subroutine in x86 masm ready to be called from C language with the following prototype:

```c
wchar_t * zamien_na_base12(unsigned int liczba);
```

`wchar_t` type is 16-bit version of `char` type.
Subroutine should do the conversion of unsigned positive 32 bit number `liczba` to sequence of digits in base12 format. Digits should be encoded as 16bit UTF-16 characters with assignment mentioned earlier. Sequence should end with 0 on 16 bits. Digits should be stored in memory buffer to which address should be returned by the subroutine.

Library function from C language of prototype:

```c
void * malloc(unsigned int k);
```
Assigns k-byte memory buffer and returns address to it.
If the required buffer could not be allocated, it returns 0.
Content of given buffer is undefined.