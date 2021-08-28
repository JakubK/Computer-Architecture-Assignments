## Text

In given 48-byte array resides text `Połączenia kolejowo - autobusowe` encoded in `UTF-8`. There are also symbols of locomotive and bus encoded in the string. Write a program in x86 assm which is going to display given text on the screen using `MessageBoxW` system function. In given array you can find UTF-8 series made of 1,2,3 or 4 bytes.

```x86asm
bufor        db    50H, 6FH, 0C5H, 82H, 0C4H, 85H, 63H, 7AH, 65H, 6EH, 69H, 61H, 20H 
        db    0F0H, 9FH, 9AH, 82H   ; locomotive
        db    20H, 20H, 6BH, 6FH, 6CH, 65H, 6AH, 6FH, 77H, 6FH, 20H
        db    0E2H, 80H, 93H ; -
        db    20H, 61H, 75H, 74H, 6FH, 62H, 75H, 73H, 6FH, 77H, 65H, 20H, 20H
        db    0F0H,  9FH,  9AH,  8CH ; bus
```