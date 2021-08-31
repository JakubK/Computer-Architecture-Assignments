push esi
push ebx
mov esi, 0
mov ecx, 0
ptl:

    mov bl, byte ptr [znaki + esi]
    cmp bl, 0
    je koniec

    cmp bl, 08Fh
    ja niebajtowy

    ;kod bajtowy
    add esi, 1
    jmp dalejptl

    niebajtowy: 

    cmp bl, 0DFh
    ja trybajtowy
    add esi, 2
    jmp dalejptl
    trybajtowy:
    add esi, 3


    dalejptl:
    add ecx, 2
    jmp ptl
koniec:
pop ebx
pop esi