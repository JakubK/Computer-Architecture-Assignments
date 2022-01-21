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
  push 16
  ptl:
  ;posługujemy się twierdzeniem z pierwszej części ćwiczeń by wydobyć właściwą resztę bez przepełnienia
  mov edx, 0
  mov eax, dword ptr [esi+4];starsza część
  div dword ptr [esp]
  mov eax, dword ptr [esi];młodsza część
  div dword ptr [esp];w edx index do inkrementacji
  add [ebx + edx], 1
  add esi, 8
  inc ecx
  cmp ecx, dword ptr [ebp+12] ;n
  jne ptl
  add esp, 4; zdejmujemy dzielnik ze stosu
  mov eax, ebx
  pop esi
  pop edx
  pop ecx
  pop ebx
  pop ebp
  ret
_rozklad ENDP
