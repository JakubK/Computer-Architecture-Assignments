
rol1024 PROC
    push eax
    push ecx
    ;pobranie najstarszego bitu najstarszego bajtu
    mov al,byte ptr [tablica + 1023]
    bt al, 7

    moc ecx, 0
    ptl:
    mov al, byte ptr [tablica + ecx]
    rcl al, 1
    inc ecx
    cmp ecx, 1024
    jne ptl

    mov al,byte ptr [tablica + 0]
    bt al, 0

    pop ecx
    pop eax
    ret
rol1024 ENDP