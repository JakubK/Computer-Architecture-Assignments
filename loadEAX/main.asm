; wczytywanie liczby dziesiętnej z klawiatury – po
; wprowadzeniu cyfr należy nacisnąć klawisz Enter
; liczba po konwersji na postać binarną zostaje wpisana
; do rejestru EAX
; deklaracja tablicy do przechowywania wprowadzanych cyfr
; (w obszarze danych)

.data
obszar db 12 dup (?)
dziesiec dd 10 ; mnożnik
.code
— — — — — — — — — — — —
wczytaj_do_EAX PROC
push eax
push ebx
push ecx
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
; wartość binarna wprowadzonej liczby znajduje się teraz w rejestrze EAX
push ecx
push ebx
push eax
wczytaj_do_EAX ENDP


main:
    call wczytaj_do_EAX;w eax znajduje się liczba do podniesienia do kwadratu
    mov edx, 0
    mul eax;w eax znajduje się kwadrat
    call wyswietl_EAX
END