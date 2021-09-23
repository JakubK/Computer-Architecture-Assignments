## New Strcat

Write subroutine in x86 masm with the following signature:

```c
void nowy_strcat(char * wynik, char * zrodlo);
```

where `wynik` and `zrodlo` are addresses (pointers) of char arrays containing characters in ASCII, where end of each string is marked by 0 byte. Subroutine should append characters from `zrodlo` to those in `wynik`.

Then write simple program in C language which is going to show working subroutine. It should take `zrodlo` and `wynik` from keyboard and display them merged using written subroutine.