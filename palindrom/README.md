## Palindrom

Write function in x86 masm 32 bit mode prepared to be called from C language assuming the following prototype:

```c
void * palindrom(wchar_t * tekst);
```

Function palindrom has to find in `tekst` all palindroms of odd length (bigger than 1). And return address of array of pairs: (address of palindrom, length in 32 bits).
Palindrom is defined as a string which content is equal to its content read backwards (for example ('aja', 3), ('kajak',5)). Array may contain repeated contents but should not contain repeated addresses.

Type `wchar_t` represents 16-bit characters used in Unicode