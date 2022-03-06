_quantise PROC
  push ebp
  mov ebp, esp
  push ebx
  mov bl, byte ptr [ebp+8]; pixel
  movzx bx, bl
  bt bx, 7
  setc al
  mov bl, 255
  mul bl
  pop ebx
  pop ebp
  ret
_quantise ENDP