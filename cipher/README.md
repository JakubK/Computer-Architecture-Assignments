## Cipher

Subroutine ready to be called from C language with the following prototype:

```c
void szyfruj(char * tekst);
```

Ciphers each byte from `tekst` buffer by executing XOR operation, where second argument is a sequence of 8 bits. Sequence has different content for each byte and is equal to least significant 8 bits of 32-bit random number. First random number has value of 52525252H and every next value is calculated with the following algorithm:

a. Calculate sum modulo of 2 bits number 30 and 31<br>
b. Shift whole 32bit number by 1 position to left<br>
c. Bit number 0 has to be set with sum modulo 2 calculated earlier.<br>

Write code of `szyfruj` subroutine