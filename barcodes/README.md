## Barcodes

Bar codes are a way to display alphabet characters using lines and spaces between them. One of them is BC412 code.
Alphabet of BC412 is made of 0-9 digits, A-Z (excluding O) letters which is replaced by '0'.
Each line in BC412 is line. Encoding is made of variable length of empty-space distance between lines.

Regular character is encoded as code with witdh of 12 lines. Width is composed of 4-times combination (line + space) where spaced is set by column 2 in Table 1. 
Width of line is always equal to 1.

For example:

For '0' the encoded value is equal to 1,1,1,5. It means the interpretation is the following:

line, space, line, space, line, space, line, 5x space


In total it's 12-times combination of line width (4 lines + 8-times space with width of line)

Value of sign assigned to `control digit` is computed as a sum of char values given in table1 (Column 3) modulo 35.


Table 1

| Sign      | Encoding | Value |
| ----------- | ----------- | ----------- |
| 0      | 1, 1, 1, 5       | 0 |
| 1   | 1, 1, 2, 4         | 15 |
| 2      | 1, 1, 3, 3       | 17 |
| 3   | 1, 1, 4, 2        | 29 |
| 4   | 1, 1, 5, 1         | 11 |
| 5      | 1, 2, 1, 4       | 33 |
| 6   | 1, 2, 2, 3        | 19 |
| 7      | 1, 2, 3, 2       | 21 |
| 8   | 1, 2, 4, 1         | 8 |
| 9      | 1, 3, 1, 3       | 2 |
| A   | 1, 3, 2, 2         | 7 |
| B      | 1, 3, 3, 1       | 25 |
| C   | 1, 4, 1, 2        | 20 |
| D   | 1, 4, 2, 1        | 22 |
| E      | 1, 5, 1, 1       | 9 |
| F   | 2, 1, 1, 4        | 30 |
| G   | 2, 1, 2, 3        | 3 |
| H      | 2, 1, 3, 2        | 6 |
| I   | 2, 1, 4, 1        | 27 |
| J | 2, 2, 1, 3        | 16 |
| K      | 2, 2, 2, 2        | 24 |
| L   | 2, 2, 3, 1         | 4 |
| M   | 2, 3, 1, 2        | 34 |
| N      | 2, 3, 2, 1       | 12 |
| P   | 2, 4, 1, 1        | 32 |
| Q      | 3, 1, 1, 3       | 18 |
| R   | 3, 1, 2, 2        | 1 |
| S   | 3, 1, 2, 2         | 14 |
| T   | 3, 2, 1, 2         | 13 |
| U      | 3, 2, 2, 1        | 26 |
| V   | 3, 3, 1, 1        | 5 |
| W      | 4, 1, 1, 2        | 31 |
| X   | 4, 1, 2, 1         | 28 |
| Y   | 4, 2, 1, 1        | 23 |
| Z   | 5, 1, 1, 1         | 10 |


Assuming there's defined the following data buffer:

```x86asm
suma db ? ; place for control sum
znaki db 1,1,1,5 ;column 2 from table 1
      dw 0 ;column 3 from table 1
      db 1,1,2,4
      dw 15
      ;------------------;rest of the array
      db 5,1,1,1
      dw 10
```

1. Add to the code below your fragment of code in x86 masm which is going to take ASCII sign in `AL` from '0-9' and 'A-Z' alphabet without 'O' (35 characters in total), compute BC412 and place it in memory in address stored in `EDI`.
Most significant, unused bits should be zeroed. Line should be interpretted as bit set, Space as bit reset.
For example '0' sign would be '0000 1010 1010 0000'

2. Add to the code below your fragment of x86 masm which will calculate value for control sum of the string.

```x86asm
mov esi, OFFSET lancuch ;address of buffer containing string to encode
mov edi, OFFSET bufor;address of buffer for BC412 codes
mov ecx, 8 ;number of characters to be encoded
mov suma, 0;initial value for sum


nastepny_znak:
    ;place for your code
    loop nastepny_znak
```