.data
trzy dd 3
.code
obj_stozka_sc PROC
    push ebp
    mov ebp, esp

    finit

    fld dword ptr [ebp+8] ;st(0) = r
    fld dword ptr [ebp+8] ;st(0) = r
    fmulp
    ;st(0)=r^2
    fld dword ptr [ebp+8] ;st(0) = r
    fld dword ptr [ebp+12] ;st(0) = R

    ;st(0) = R; st(1)=r; st(2)=r^2

    fmulp

    ;st(0)=Rr; st(1)=r^2

    fld dword ptr [ebp+12] ;st(0) = R
    fld dword ptr [ebp+12] ;st(0) = R

    fmulp

    ;st(0)=RR, st(1)=Rr, st(2)=rr
    faddp
    faddp
    ;st(0)=RR + Rr + rr

    fld dword ptr [ebp+16];st(0) = h, st(1) = wynik
    fldpi;st(0)=pi,st(1)=h,st(2)=wynik
    fmulp

    fdiv dword ptr trzy
    ;st(0)=pi*h/3;st(1)=wynik
    fmulp

    pop ebp
    ret
obj_stozka_sc ENDP
END