

_create_benford_distribution_asm PROC
    push ebp
    mov ebp, esp
    push ecx
    ;od 1 do 9 to 9 floatów
    mov eax, 9
    lea eax, [4*eax];tyle bajtów potrzeba na 9 floatów
    push dword ptr 1
    push dword ptr 1000h
    push eax
    push dword ptr 0
    call VirtualAlloc
    ;winapi więc nie musimy zdejmować parametrów ze stosu
    ;w eax znajduje się adres

    finit
    mov ecx, 1
    ptl:
        push ecx
        fild dword ptr [esp] ;st(0) = k
        add esp, 4
        fld1 ;st(0) = 1; st(1) = k
        fadd st(0),st(1);st(0)=1+k,st(1)=k
        fxch
        fdivp
        ;st(0) = liczba logarytmowana wyniku
        fld1 ;st(0) = 1;st(1) = liczba
        fxch
        ;st(0) = liczba
        ;st(1) = 1
        fyl2x
        ;st(0) = log2(liczba)
        fldl2t; log2(10)

        ;st(0) = log2(10)
        ;st(1) = log2(liczba)

        fdivp
        ;w st(0) znajduje się wynik
        fstp dword ptr [eax + 4*ecx]
        inc ecx
        cmp ecx, 10
        jne ptl

    pop ecx
    pop ebp
    ret
_create_benford_distribution_asm ENDP