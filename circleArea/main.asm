

_pole_kola PROC
    push ebp
    mov ebp, esp
    push eax
    mov eax, dword ptr [ebp + 8]; * pr
    finit ;init x87
    fld dword ptr [eax]
    ;w ST(0) znajduje się r
    fmul dword ptr [eax]; ST(0) = r^2
    FLDPI; ST(0) = PI; ST(1) = r^2
    FMUL ST(0), ST(1)
    ;ST(0) = PI*r^2, ST(1) = r^2
    FXCH
    FSTP ST(0)
    ;ST(0) = PI*r^2, ST(1) = _
    FSTP dword ptr [eax]
    pop eax
    pop ebp
    ret
_pole_kola ENDP