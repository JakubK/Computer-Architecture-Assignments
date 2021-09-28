

float_to_half PROC
    push ebp
    mov ebp, esp
    push ebx
        mov ebx, dword ptr [ebp+8] ; a
        ;znak pozostaje bez zmian
        ;31 ebx stanie się 15 ax
        ;różnica między biasem musi się zgadzać

        ;we float bias to (2^7)-1 = 127
        ;w halfie będzie to (2^4)-1 = 15

        mov ax, 0
        ;0000 0000 0000 0000
        ;SEEE EEMM MMMM MMMM
        btr ebx, 31;zerujemy znak
        shr ebx, 23;wykładnik floata do prawej
        sub ebx, 127
        ;to co w ebx należy ustawić w dobre miejsce na ax i dodać bias=15
        shr ebx, 10
        or ax, bx
        and ax, 0111111110000000b;wykładnik jest poprawny
        mov ebx, dword ptr [ebp+8];odtwarzamy floata

        ;teraz należy przepisać mantysę
        btr ebx, 31
        shr ebx, 13;23 bit mantysy staje się dziesiątym
        or ax, bx;sklejamy wykładnik i mantysę

        ;teraz pozostaje skopiować znak
        mov ebx, dword ptr [ebp+8]
        and ebx, 80000000h
        ;32 bit ma się stać bitem 16
        shr ebx, 16
        or ax, bx


    pop ebx
    pop ebp
    ret
float_to_half ENDP