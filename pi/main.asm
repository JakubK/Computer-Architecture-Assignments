_liczba_pi PROC
  push ebp
  mov ebp, esp
  pusha
  finit
  mov ecx, 0
  mov ebx, 2
  push ebx
  fild dword ptr [esp]
  pop ebx
  licznik:
    push ebx
    fild dword ptr [esp]
    pop ebx
    fmul
    inc ecx
    cmp ecx, 3
    jb dalej_l
    bt ecx, 0
    jc dalej_l
    add ebx, 2
    dalej_l:
    cmp ecx, dword ptr [ebp+8]
    jne licznik
  mov ecx, 0
  mov ebx, 1
  fld1
  mianownik:
    push ebx
    fild dword ptr [esp]
    pop ebx
    inc ecx
    bt ecx, 0
    jc dalej_m
    add ebx, 2
    dalej_m:
    cmp ecx, dword ptr [ebp+8]
    jne mianownik ;st(0) = mianownik; st(1) = licznik
  fdiv
  popa
  pop ebp
  ret
_liczba_pi ENDP