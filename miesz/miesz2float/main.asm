
_miesz2float PROC
  push ebp
  mov ebp, esp
  pusha
  finit

  ;zbieramy starszą część
  btr dword ptr [ebp+12], 31
  setc bl; resetujemy bit znaku
  fild qword ptr [ebp+8];ładujemy jako double
  mov ecx, 0
  dziel:
  fld dword ptr dwa
  fdivp
  inc ecx
  cmp ecx, 32
  jne dziel

  cmp bl, 1
  jne koniec

  ;teraz należy obliczyć 2^31 i zsumować
  fld dword ptr dwa
  mov ecx, 0
  ptl:
  fld dword ptr dwa
  fmulp
  inc ecx
  cmp ecx, 30
  faddp
  koniec:
  popa
  pop ebp
  ret
  dwa dd 2.0
_miesz2float ENDP