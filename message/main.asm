_komunikat PROC
  push ebp
  mov ebp, esp
  push ecx
  push esi
  push edi

  mov eax, dword ptr stale_rozmiar
  mov ecx, 0
  mov esi, dword ptr [ebp+8]
  zlicz:
    cmp byte ptr [esi + ecx], 0
    je dalej
    inc ecx
  jmp zlicz
  dalej:
  inc ecx; doliczamy bajt zero
  add ecx, eax; doliczamy rozmiar błędu
  push ecx
  call _malloc;w eax adres obszaru
  pop ecx ;tutaj łączy rozmiar
  push ecx
  cld
  mov ecx, dword ptr stale_rozmiar
  mov esi, offset stale
  mov edi, eax
  rep movsb;przepisujemy błąd
  pop ecx
  dec ecx
  sub ecx, dword ptr stale_rozmiar
  mov esi, dword ptr [ebp+8]
  rep movsb
  mov [edi], byte ptr 0

  pop edi
  pop esi
  pop ecx

  pop ebp
  ret
  stale db 'Błąd.'
  stale_rozmiar = $ - stale
_komunikat ENDP