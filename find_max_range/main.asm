.data
g dd 9.80
;...
_find_max_range PROC
  push ebp
  mov ebp, esp
  pusha

  fld dword ptr [ebp+8];v
  fld dword ptr [ebp+8];v
  ;st(0) = v
  ;st(1) = v
  fmul
  ;st(0) = v^2
  fld dword ptr [g]
  ;st(0) = g
  ;st(1) = v^2
  fdiv
  fld dword ptr [ebp+12];alpha
  ;st(0) = alpha
  ;st(1) = v^2/g
  mov ecx, 2
  push ecx
  fild dword ptr [esp]
  add esp, 4
  ;st(0) = 2
  ;st(1) = alpha
  ;st(2) = v^2/g
  fmul
  ;st(0) = 2alpha
  ;st(1) = v^2/g
  fsin
  ;st(0) = sin(2alpha)
  fmul
  popa
  pop ebp
  ret
_find_max_range ENDP