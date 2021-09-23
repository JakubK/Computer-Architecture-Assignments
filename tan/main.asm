

_funkcja PROC
    push ebp
    mov ebp, esp
        finit
        fld qword ptr [ebp+8];x
        fld qword ptr [ebp+16];y
        ;st(0) = y
        ;st(1) = x
        fadd st(0), st(1) ;st(0) = x+y, st(1) = x
        fxch
        ;st(0) = x
        ;st(1) = x+y
        fld qword ptr [ebp+16];y
        ;st(0)=y
        ;st(1)=x
        ;st(2)=x+y
        fsub st(0), st(1)
        ;st(0)=x-y
        ;st(1)=x
        ;st(2)=x+y
        fxch
        fstp st(0)
        ;st(0) = x-y
        ;st(1) = x+y
        fdivp
        ;st(0) = (x+y)/(x-y)
        fptan
        ;st(1) = p
        ;st(0) = q
        fdivp
    pop ebp
    ret
_funkcja ENDP