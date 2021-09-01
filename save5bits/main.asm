save5bits PROC
    push ebx
    push ecx
    push edx

    movzx ecx, cl
    movzx edx, dl
    ;al 5 bitów
    ;alokacja całego słowa z bajtem sąsiednim
    mov bx, word ptr [edi-1]
    ;wyliczenie przesunięcia bitowego
    ;w cl numer bitu
    add cl, 8
    mov dl, 4
    ;przepisanie 5 bitów
    ptl:
    bt ax, dx
    jc dalejjeden
    ;do wpisania 0
        btr bx, cx
        jmp dalejptl
    dalejjeden:
        bts bx, cx
    dalejptl:

    dec dl
    cmp dl, -1
    jne ptl

    ;odstawienie słowa na miejsce
    mov word ptr[edi-1], bx
    
    pop edx
    pop ecx
    pop ebx
    ret
save5bits ENDP