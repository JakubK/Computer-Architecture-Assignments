_sprawdz_okresowosc PROC
    push ebp
    mov ebp, esp
    pusha
    mov eax, dword ptr [ebp+8];*dosprawdzenia
    mov ecx, 0
    ptl:
    cmp [eax + 4 * ecx], dword ptr 0;
    je poptl
    inc ecx
    cmp ecx, 256
    jne ptl
    poptl:
    ;w ecx liczba elementow
    ;jesli elementow mniej niż 100 to nie da sie policzyc
    cmp ecx, 100
    jae dalej
    finit
    fld1
    fchs
    jmp koniec
    dalej:
    ;najpierw chcemy obliczyc srednia
    ;short to 16b = 2B
    ;adres to 32b = 4B
    finit
    sub esp, 6
    mov [esp+4], cx
    mov [esp], eax
    call avg
    add esp, 6
    ;w st(0) srednia
    sub esp, 4
    fstp dword ptr [esp]
    mov ebx, esp ;ebx to adres sredniej
    mov edx, edx ;T
    mov ecx, 10
    ptl2:
    ;mianownik
    fldz
    push ecx
    mov ecx, 0
    mianownik: ;st(0) = dotychczasowa suma
        fld dword ptr [eax + 4*ecx] ;st(0) = element, st(1) = suma
        fld dword ptr [ebx] ;st(0) = srednia, st(1) = element, st(2) = suma
        fsubp ;st(0) - roznica, st(1) = suma
        fldz
        fadd st(0), st(1);powielona roznica
        fmulp;st(0) = kwadrat, st(1) suma
        faddp
        inc ecx
        cmp ecx, edx
        jne mianownik
    pop ecx
    ;st(0) = suma_mianownik
    push ecx
    inc ecx
    fldz
    licznik:; ecx = k + 1 ;st(0) = suma_licznik, st(1) = mianownik
        fld dword ptr [eax + 4 * ecx];st(0) = element, st(1) = suma_licznik, st(2) = mianownik
        fld dword ptr [ebx]
        fsubp ;st(0) = roznica1, st(1) = suma_licznik, st(2) = mianownik
        fld dword ptr [eax + 4 * ecx]
        push ecx
        dec ecx
        mov [esp], ecx
        fld dword ptr [esp]
        pop ecx
        ;st(0) = k, st(1) = element, st(2) = roznica1, st(3) = suma_l, st(4) = mianownik
        fsubp ;st(0) = roznica, st(1) = roznica1, st(2) = suma_2, st(3) = mianownik
        fld dword ptr [ebx]
        fsubp
        ;st(0) = roznica2, st(1) = roznica1, st(2) = suma_l, st(3) = mianownik
        fmulp
        faddp
        ;st(0) = suma_l, st(1) = mianownik
        inc ecx
        cmp ecx, edx
        jne licznik
    fdivp ;st(0) = rk
    fld dword ptr prog ;st(0) = prog, st(1) = rk
    fcomi st(0), st(1)
    jae dalejdalej
    ;nalezy ustawic rk na wierzchołku i zakonczyc
    fstp st(0)
    jmp koncz
    dalejdalej:
    pop ecx
    inc ecx
    cmp ecx, 100
    jne ptl
    koncz:
    add esp, 4
    koniec:
    popa
    pop ebp
    ret
    prog dd 0.2
_sprawdz_okresowosc ENDP