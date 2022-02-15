_levenshtein PROC
  push ebp
  mov ebp, esp
  push esi
  push ecx
  push edi

  push ebx
  push edx

  push dword ptr [ebp+8];a
  call _lstrlenW ;w eax m, nie trzeba sprzątać bo WinAPI
  mov esi, eax
  push dword ptr [ebp+12];b
  call _lstrlenW
  mov edi, eax

  push eax
  push esi
  call _utworz_i_zainicjuj
  add esp, 8

  mov ecx, 0;i
  ptl:
    push ecx
    mov ecx, 0
    ptl2:
      push esi
      push ecx;j
      push dword ptr [esp+8]; i
      ;teraz odkładamy znaki b i a
      mov ebx, [ebp + 8];adres ciągu
      mov edx, [esp+8]; i
      mov bx, [ebx + 4 * edx]
      sub esp, 2
      mov [esp], bx

      mov ebx, [ebp + 12]
      mov bx, [ebx + 4 * ecx]
      sub esp, 2
      mov [esp], bx

      ;...
      push eax; tablica
      call _ustaw_ij
      add esp, 20
      inc ecx
      cmp ecx, esi
      jne ptl2
    pop ecx
    inc ecx
    cmp ecx, edi
    jne ptl
  ;wszystko wypełnione, wystarczy przeczytać prawą dolną komórkę - ostatnią
  dec esi
  dec edi
  shl esi, 2
  shl edi, 2
  add esi, edi
  add eax, esi
  mov eax, [eax]

  pop edx
  pop ebx
  
  pop edi
  pop ecx
  pop esi
  pop ebp
  ret
_levenshtein ENDP

