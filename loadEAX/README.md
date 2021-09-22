## loadEAX

1. Convert given x86 masm code to a subroutine `wczytaj_do_EAX` which reads number from keyboard and converts it to binary stored in EAX.

```x86asm
; wczytywanie liczby dziesiętnej z klawiatury – po
; wprowadzeniu cyfr należy nacisnąć klawisz Enter
; liczba po konwersji na postać binarną zostaje wpisana
; do rejestru EAX
; deklaracja tablicy do przechowywania wprowadzanych cyfr
; (w obszarze danych)

obszar db 12 dup (?)
dziesiec dd 10 ; mnożnik
— — — — — — — — — — — —
; max ilość znaków wczytywanej liczby
push dword PTR 12
push dword PTR OFFSET obszar ; adres obszaru pamięci
push dword PTR 0; numer urządzenia (0 dla klawiatury)
call __read ; odczytywanie znaków z klawiatury
; (dwa znaki podkreślenia przed read)
add esp, 12 ; usunięcie parametrów ze stosu

; bieżąca wartość przekształcanej liczby przechowywana jest
; w rejestrze EAX; przyjmujemy 0 jako wartość początkową
mov eax, 0
mov ebx, OFFSET obszar ; adres obszaru ze znakami
pobieraj_znaki:
mov cl, [ebx] ; pobranie kolejnej cyfry w kodzie

; ASCII

inc ebx ; zwiększenie indeksu
cmp cl,10 ; sprawdzenie czy naciśnięto Enter
je byl_enter ; skok, gdy naciśnięto Enter
sub cl, 30H ; zamiana kodu ASCII na wartość cyfry
movzx ecx, cl ; przechowanie wartości cyfry w

; rejestrze ECX

; mnożenie wcześniej obliczonej wartości razy 10
mul dword PTR dziesiec
add eax, ecx ; dodanie ostatnio odczytanej cyfry
jmp pobieraj_znaki ; skok na początek pętli
byl_enter:
; wartość binarna wprowadzonej liczby znajduje się teraz w
rejestrze EAX
```

2. Write a program in x86 masm which reads decimal number smaller than 60000 and prints its square. Program should be using `wczytaj_do_EAX` and `wyswietl_EAX` - which prints binary number in EAX as Decimal