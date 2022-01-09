_new_exp PROC
  push ebp
  mov ebp, esp
  pusha

  mov ecx, 1
  finit
  fld1
  fld1
  fld1
  ptl:
  ;st(0) = suma
  ;st(1) = mianownik
  ;st(2) = licznik
  fld dword ptr [ebp+8]
  ;st(0) = x
  ;st(1) = suma
  ;st(2) = mianownik
  ;st(3) = licznik
  fmulp st(3), st(0)
  ;st(0) = suma
  ;st(1) = mianownik
  ;st(2) = nowy_licznik
  push ecx
  fild dword ptr [esp]
  add esp, 4
  ;st(0) = mnoznik
  ;st(1) = suma
  ;st(2) = mianownik
  ;st(3) = nowy_licznik
  fmulp st(2), st(0)
  ;st(0) = suma
  ;st(1) = nowy_mianownik
  ;st(2) = nowy_licznik
  fld1
  ;st(0) = 1
  ;st(1) = suma
  ;st(2) = nowy_mianownik
  ;st(3) = nowy_licznik
  fmul st(0), st(3)
  fdiv st(0), st(2)
  faddp
  ;st(0) = nowa suma
  ;st(1) = nowy_mianownik
  ;st(2) = nowy_licznik

  inc ecx
  cmp ecx, 20
  jne ptl

  ;st(0) = nowa suma
  ;st(1) = nowy_mianownik
  ;st(2) = nowy_licznik
  fxch st(2)
  fstp st(0)
  fstp st(0)
  
  popa
  pop ebp
  ret
_new_exp ENDP