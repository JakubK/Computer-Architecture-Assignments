

displayHolidays PROC
    push ebx
    push ecx
    push eax
    push edx

    mov eax, dword ptr [ebx + ecx - 1];w eax cały miesiąc
    ;bit [1] - dzień 1
    ;bit [31] - dzień 31
    mov ebx, 10;10 do dzielenia
    mov ecx, 31
    ptl:
    bt eax, ecx
    jnc dalejptl

    ;w ecx znajduje się dzień
    ;alokacja 4 bajtów na ascii
    sub esp, 4
    mov [esp], dword ptr 0;zerowanie obszaru
    mov edx, 0
    mov eax, ecx
    div ebx

    ;w edx reszta
    ;w eax wynik
    ;jesli w eax = 0, rzucamy samą resztę, 
    cmp eax, 0
    jne dwucyfrowy


    add edx, '0'
    mov byte ptr [esp], dl

    jmp wyswietl
    ;w przeciwnym wypadku rzucamy wynik a potem resztę
    dwucyfrowy:
    add edx, '0'
    add eax, '0'
    mov byte ptr [esp], al
    mov byte ptr [esp+1], al


    wyswietl:
    push 0
    push 0
    push dword ptr esp
    push 0
    call _MessageBoxA@16
    add esp, 16

    dalejptl:
        dec ecx
        cmp ecx, 0
        jne ptl

    pop edx
    pop eax
    pop ecx
    pop ebx
    ret
displayHolidays ENDP
