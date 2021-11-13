.686
.model flat
extern __read : PROC ; (dwa znaki podkreślenia)
extern __write : PROC ; (dwa znaki podkreślenia)
extern _ExitProcess@4 : PROC
.data
znaki db 12 dup (?)
magazyn db 80 dup (0)
.code
;Display number from EAX in terminal as base10
wyswietl_EAX PROC
    pusha
    mov esi, 10 ; indeks w tablicy 'znaki'
    mov ebx, 10 ; dzielnik równy 10
    konwersja:
    mov edx, 0 ; zerowanie starszej części dzielnej
    div ebx ; dzielenie przez 10, reszta w EDX,

    ; iloraz w EAX

    add dl, 30H ; zamiana reszty z dzielenia na kod

    ; ASCII

    mov znaki [esi], dl; zapisanie cyfry w kodzie ASCII
    dec esi ; zmniejszenie indeksu
    cmp eax, 0 ; sprawdzenie czy iloraz = 0
    jne konwersja ; skok, gdy iloraz niezerowy
    ; wypełnienie pozostałych bajtów spacjami i wpisanie
    ; znaków nowego wiersza
    wypeln:
    or esi, esi
    jz wyswietl ; skok, gdy ESI = 0
    mov byte PTR znaki [esi], 20H ; kod spacji
    dec esi ; zmniejszenie indeksu
    jmp wypeln
    wyswietl:
    mov byte PTR znaki [0], 0AH ; kod nowego wiersza
    mov byte PTR znaki [11], 0AH ; kod nowego wiersza
    ; wyświetlenie cyfr na ekranie
    push dword PTR 12 ; liczba wyświetlanych znaków
    push dword PTR OFFSET znaki ; adres wyśw. obszaru
    push dword PTR 1; numer urządzenia (ekran ma numer 1)
    call __write ; wyświetlenie liczby na ekranie
    add esp, 12 ; usunięcie parametrów ze stosu
    popa
    ret
wyswietl_EAX ENDP

;Read from magazyn base12 and store in EAX its base10
;ECX is used as extra pointer
;assuming [magazyn+ecx] points at start of number
wczytaj12_EAX PROC
    push edx
    push ebx

    mov edx, 0

    mov eax, 0
    petla:
    mov al, byte ptr [magazyn + ecx]
    inc edx

    cmp al, '0'
    jae wieksze0
    jmp koniec

    wieksze0:
        cmp al, '9'
        jbe cyfra
        sub al, 'A'
        add al, 10
        jmp przetworzonyznak
        cyfra:
            sub al, '0'
    przetworzonyznak:
        ;edx = 1 -> mnozymy 
        ;edx = 2 -> nie mnozymy
        cmp edx, 1
        jne bezZamiany
        mov ah, al
        bezZamiany:
        inc ecx
        cmp edx, 2
        jne petla

    ;jesli ah = 0 to liczymy tylko dla al
    mov edx, eax
    ;al przeliczone
    cmp ah, 0
    je koniec
    ;tutaj mnozymy ah*12 i dodajemy do al
    movzx eax, ah
    add eax, eax;2ah
    add eax, eax;4ah

    mov ebx, eax
    add eax, ebx;8ah
    add eax, ebx;12ah
    movzx edx, dl
    add eax, edx

    koniec:

    pop ebx
    pop edx
    ret
wczytaj12_EAX ENDP

_main PROC

push 80
push OFFSET magazyn
push 0
call __read
add esp, 12

mov ecx, 0
call wczytaj12_EAX
nop
;w eax znajduje sie pierwsza liczba
ptl:
    inc ecx
    cmp byte ptr [magazyn + ecx], 'A'
    je dalej
    cmp byte ptr [magazyn + ecx], 'B'
    je dalej
    cmp byte ptr [magazyn + ecx], '0'
    jb ptl
    cmp byte ptr [magazyn + ecx], '9'
    ja ptl
dalej:
    ;ecx jest ustawiony na kolejną liczbe
    mov ebx, eax
    call wczytaj12_EAX
    nop
    add eax, ebx
    call wyswietl_EAX

push 0
call _ExitProcess@4

_main ENDP

END