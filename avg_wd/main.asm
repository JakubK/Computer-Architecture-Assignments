

avg_wd PROC
    push ebp
    mov ebp, esp
    push eax
    push ebx
    push ecx
        mov eax, dword ptr [ebp+12]; *tablica
        mov edx, dword ptr [ebp+16];*wagi

        finit
        mov ecx, 0
        fld0
        ptl:
            ;najpierw obliczamy waga*skladnik
            fld dword ptr [eax + ecx]
            fld dword ptr [edx + ecx]

            ;st(0) = waga
            ;st(1) = skladnik
            ;st(2) = dotychczasowa suma
            fmulp
            ;st(0) = waga*skladnik
            ;st(1) = dotychczasowa suma
            faddp
            ;st(0) = nowa_suma

            inc ecx
            cmp ecx, dword ptr [ebp+8]
            jne ptl

        ;w st(0) znajduje się licznik
        mov ecx, 0
        fld0
        mianownik:
            ;st(0) mianownik_suma
            ;ST(1) = licznik
            fld dword ptr [edx + ecx]
            ;st(0) = waga
            ;st(1) = mianownik_suma
            ;st(2) = licznik
            faddp
            ;st(0) = mianownik_suma
            ;st(1) = licznik

            inc ecx
            cmp ecx, dword ptr [ebp+8]
            jne mianownik
        
        ;st(0) = mianownik
        ;st(1) = licznik
        fdivp
    pop ecx
    pop ebx
    pop eax
    pop ebp
    ret
avg_wd ENDP