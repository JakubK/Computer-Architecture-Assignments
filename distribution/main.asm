_rozklad PROC
  push ebp
  mov ebp, esp

  push 16
  call _malloc
  add esp, 4
  cmp eax, 0
  jne sukces
  pop ebp
  ret ;nie udało sie zaalokować pamięci

  sukces:
  push ebx
  push ecx
  push edx
  push esi
  mov ecx, 0
  mov esi, eax
  mov ebx, eax;tutaj zachowamy wynik do zwrócenia
  ptl:
  ;posługujemy się twierdzeniem z pierwszej części ćwiczeń by wydobyć właściwą resztę bez przepełnienia
  pusha
  mov edx, 0
  mov eax, dword ptr [esi+4];starsza część
  div dword ptr dzielnik
  mov eax, dword ptr [esi];młodsza część
  div dword ptr dzielnik
  mul dword ptr dzielnik
  sub eax, dword ptr [esi]
  mov edx, eax
  add [ebx + edx], 1
  popa
  add esi, 8
  inc ecx
  cmp ecx, dword ptr [ebp+12] ;n
  jne ptl
  mov eax, ebx
  pop esi
  pop edx
  pop ecx
  pop ebx
  pop ebp
  ret
  dzielnik dd 16
_rozklad ENDP
