## Count Forgeries

Write subroutine in x86 masm read to be called from C language with the following prototype:

```c
unsigned int zlicz_falszerstwa(char * wejscie, char klucz);
```

Where `wejscie` points on string in asciiz defining any number of objects separated by semicolon. Object consists of two elements separated by comma and groupped by currly braces. Sample string:

```json
;{"tekst":sdasd,"szyfr":0x34};{"tekst":foo,"szyfr":0xFF};{"tekst":ssss,"szyfr":0x47};
```

`tekst` and `szyfr` fields can only contain alphanumerical characters (a-z, 0-9) excluding white characters such as enter or space.

`szyfr` contains contains 4 ascii sigs in which last 2 digits are defining xor of every byte every bytes from `tekst` (characters between `:` and `,`) and the key.

For example `0x10` defines (10)<sub>16</sub> = (16)<sub>10</sub>

`zlicz_falszerstwa` subroutine should count objects in which value of `szyfr` is invalid for given key and return this count as result.
