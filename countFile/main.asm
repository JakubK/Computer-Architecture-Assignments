

CountFile PROC
    push ebp
    mov ebp, esp

    ;[ebp+8] *tablicaPlikow
    mov ecx, 0;ecx do zliczania wystąpień
    mov eax, dword ptr [ebp+8]
    ptl:
        mov ebx, dword ptr [eax];adres na nazwe plików
        ;+0 nazwaPliku *
        ;+4 FileTime
        ;+12 rozmiar
        cmp ebx, 0
        je koniec
        ;jesli plik nie ma wskaznika na nazwePliku, to zakładamy że to koniec tablicy
        mov ebx, dword ptr[eax + 4]
        mov esi, dword ptr[eax + 8]
        ;esi:ebx to czas

        call Now;
        ;edx:eax to czas obecny
        ;esi;ebx odjąć
        sub eax, ebx
        sbb edx, esi

        ;3600 sekund
        ;w młodszej części - eax są jednostki 100 nanosekundowe
        ;1 nano = 10^(-9)
        ;jednostka nanosekundowa = 10^(-9)S * 10^2 = 10^(-7)S
        ;3600 * 10*7 = 36000000000
        ;teraz należy sprawdzić czy wynik jest mniejszy od tej liczby
        ;1000 0110 0001 1100 0100 0110 1000 0000 0000
        ;EDX |
        cmp edx, 1000b
        jb zwiekszLicznik
        cmp eax, 01100001110001000110100000000000
        jb zwiekszLicznik
        jmp dalej
        zwiekszLicznik:
            inc ecx
        dalej:
            jmp ptl
    koniec:


    mov eax, ecx

    pop ebp
    ret
CountFile ENDP