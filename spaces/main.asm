
_spacje PROC
  push ebp
  mov ebp, esp
  push esi
  push edi
  push ecx

  push 129
  call _malloc
  add esp, 4

  mov esi, eax
  mov edi, eax

  mov al, byte ptr [esp+8]
  mov ecx, 128
  cld
  rep stosb
  mov [eax + 128], byte ptr 0
  mov eax, esi

  pop ecx
  pop edi
  pop esi
  pop ebp
  ret
_spacje ENDP