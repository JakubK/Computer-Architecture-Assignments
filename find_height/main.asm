.data
dd g 9.80
;...

_find_height PROC ;(x, a, v)
  push ebp
  mov ebp, esp
  pusha

  fld dword ptr [ebp+12];a
  fptan
  fdiv
  ;st(0) = tan(a)
  fld dword ptr [ebp+8];x
  fmul
  ;st(0) = x * tan(a)
  fld1
  fld1
  ;st(0) = 1
  ;st(1) = 1
  ;st(2) = x * tan(a)

  fadd
  ;st(0) = 2
  ;st(1) = x * tan(a)
  fld dword ptr [ebp+16]
  fld dword ptr [ebp+16]
  ;st(0) = v, st(1) = v, st(2) = 2, st(3) = x* tan(a)
  fmul
  fmul
  ;st(0) = 2*(v^2);st(1) = x*tan(a)
  fld dword ptr [g]
  fxch
  fdiv
  ;st(0) = g/2*v0^2, st(1) = xtan(a)
  fchs
  fld dword ptr [ebp+8]
  fld dword ptr [ebp+8]
  fmul
  fmul
  fadd


  popa
  pop ebp
  ret
_find_height ENDP