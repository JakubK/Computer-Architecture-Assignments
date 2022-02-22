_termometer_read PROC
  push ebp
  mov ebp, esp
  pusha
  mov esi, dword ptr [ebp+8]
  mov ax, 0
  mov bx, 0
  mov ecx, 15
  ptl:
    shl bx, 1
    call _termometer_read_bit
    cmp ax, 1
    jne dalejptl
    or bx, 0001h
    dalejptl:
    dec ecx
    cmp ecx, 0
    jne ptl
  
  mov dx, 0
  mov ax, bx
  mov bx, 16
  div bx
  mov [esi], ax
  mov [esi+4], dx

  finit
  fld dword ptr [esi+4]
  push 16
  fild dword ptr [esp]
  add esp, 4
  fdiv
  fild dword ptr [esi]
  fadd
  popa
  pop ebp
  ret
_termometer_read ENDP