

_avg_harm PROC
  push ebp
  mov ebp, esp
  pusha
  finit

  mov eax, dword ptr [ebp+8]; *tab
  mov ecx, 0
  fldz ;ST(0) - suma
  ptl:
  ;ST(0) - nowy składnik
  ;ST(1) - suma
  fld1
  fld dword ptr [eax + 4*ecx]
  ;ST(0) - składnik
  ;ST(1) - 1
  ;ST(2) - suma
  fdiv ; <=> ST(1) = ST(1) / ST(0) & POP 
  ;ST(0) - 1/składnik
  ;ST(1) - suma
  fadd
  inc ecx
  cmp ecx, dword ptr [ebp+12]
  jne ptl

  ;st(0) - suma
  fild dword ptr [ebp+12]
  ;st(0) - n
  ;st(1) - suma
  fxch
  fdiv
  ;st(0) = n/suma

  popa
  pop ebp
  ret
_avg_harm ENDP