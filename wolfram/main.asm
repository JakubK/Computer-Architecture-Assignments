.data
starting_row db 0h, 0h, 80h, 0h
next_rows db 15*4 dup(?)
.code

mov ecx, 0; licznik wierszy


rows:
    mov eax, 31; eax to licznik bitów w wierszu
    mov esi, offset starting_row
    mov esi, dword ptr [esi + ecx*4]; w esi znajduje sie adres wiersza poprzedniego

    mov edi, offset next_rows
    mov edi, dword ptr [edi + ecx*4]; w edi znajduje się adres wiersza docelowego

    mov esi, dword ptr [esi]; w esi znajduje się wartość wiersza poprzedniego

    cols:

    ;musimy wyrównać 3 bity znaczące z esi do prawej
    push ecx
    movzx ecx, eax
    sub ecx, 2
    ;w ecx przesunięcie
    shr esi, ecx
    and esi, 00000008h
    ;w esi znajdują się 3 znaczące bity
    cmp esi, 1
    jb zero
    cmp esi, 4
    ja zero
        ;tutaj wpisujemy jedynkę
        mov ebx, dword ptr [edi] ;pobieramy wiersz
        bts ebx, eax ;aktualizujemy
        jmp dalej
    zero:
        ;tutaj wpisujemy zero
        mov ebx, dword ptr [edi] ;pobieramy wiersz
        btr ebx, eax ;aktualizujemy
    dalej:
    mov dword ptr[edi], ebx ;odsyłamy wiersz do pamięci
    pop ecx
    dec eax
    cmp eax, -1
    jne cols

    inc ecx
    cmp ecx, 15
    jne rows
