_update_pixel PROC
  push ebp
  mov ebp, esp
  pusha
  mov eax, dword ptr [ebp+12]
  imul dword ptr [ebp+16] ;edx:eax
  push 16
  idiv dword ptr [esp] ;result -> eax
  add esp, 4
  mov ebx, dword ptr [ebp+8]
  movsx ebx, byte ptr [ebx]
  add eax, ebx
  mov ebx, dword ptr [ebp+8]
  mov [ebx], al
  popa
  pop ebp
  ret
_update_pixel ENDP