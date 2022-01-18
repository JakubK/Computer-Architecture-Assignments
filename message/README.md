## Message

Write subroutine to be called from C language matching the following protoype:
```c
char * komunikat(char * tekst);
```

Which is going to allocate a memory buffer (using malloc function). Rewrites `tekst` contents to it with prepended `Błąd.` string. Subroutine returns address to the allocated memory.

Tip:
String is finished with byte 0