_quick_max PROC
  push ebp
  mov ebp, esp

  pusha
  mov esi, [ebp+8]
  mov edi, [ebp+12]
  movups xmm0, [esi]
  movups xmm1, [edi]
  PMAXSW xmm0, xmm1
  popa

  pop ebp
  ret
_quick_max ENDP