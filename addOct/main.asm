.686
.model flat
extern __read : PROC ; (dwa znaki podkreślenia)
extern __write : PROC ; (dwa znaki podkreślenia)
extern _ExitProcess@4 : PROC
.data
znaki db 12 dup (?)
magazyn db 80 dup (0)
magazyn1 db 80 dup (0)
magazyn2 db 80 dup (0)
minus db '-',0
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

;Wczytaj liczbę ósemkową z magazyn do EAX 
;IN:
;W ESI adres magazynu
;OUT
;w EBX znak liczby
wczytaj8_EAX PROC
    push ebp
    mov ebp, esp
    push ecx
    push edx

    mov ebx, 0; 
    mov ecx, 0; licznik cyfr + znak minus
    mov edx, 0; licznik cyfr
    push dword ptr 0
    cmp byte ptr [esi + ecx], '-'
    jne ptl
    pop ebx
    push dword ptr 1;zapamiętanie znaku -
    ;sete bl;bl == 1 => EAX < 0
    inc ecx

    ptl:

    mov bl, byte ptr [esi + ecx]
    cmp bl, 10
    je koniecptl


    sub bl, '0'
    push ebx

    inc edx
    inc ecx
    cmp byte ptr [esi + ecx], 0
    jne ptl
    koniecptl:
    mov eax, 0
    mov ecx, edx
    mov edx, 0
    dekodowanie:
        pop ebx

        cmp edx, 0
        je cyfra
            ;8
            movzx ebx, bl
            lea eax, [eax + 8*ebx];eax = eax + 8*eax
            jmp dalejdalej
            cyfra:
            lea eax, [eax + ebx];eax = eax * ebx

        dalejdalej:

        inc edx
        cmp edx, ecx
    jne dekodowanie 

    pop ebx; odtworzenie zapamiętanego znaku

    pop edx
    pop ecx
    pop ebp
    ret
wczytaj8_EAX ENDP


_main PROC

push 80
push OFFSET magazyn1
push 0
call __read
add esp, 12


mov esi, offset magazyn1
call wczytaj8_EAX

cmp ebx, 1
jne dalejczytaj
neg eax;ustaw znak na ujemny
dalejczytaj:

push eax

push 80
push offset magazyn2
push 0
call __read
add esp, 12

mov esi, offset magazyn2
call wczytaj8_EAX

cmp ebx, 1
jne dalejczytaj2
neg eax;ustaw znak na ujemny
dalejczytaj2:

mov edx, eax
pop eax
add eax, edx

;jeśli najstarszy bit eax=1, zaneguj eax i pokaż -
bt eax, 31
jnc wyswietl
neg eax
push dword PTR 1 ; liczba wyświetlanych znaków
push dword PTR OFFSET minus ; adres wyśw. obszaru
push dword PTR 1; numer urządzenia (ekran ma numer 1)
call __write ; wyświetlenie liczby na ekranie
add esp, 12

wyswietl:
call wyswietl_EAX


push 0
call _ExitProcess@4

_main ENDP

END