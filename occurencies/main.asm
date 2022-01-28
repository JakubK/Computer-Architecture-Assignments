_wystapienia PROC
  push ebp
  mov ebp, esp
  push ebx
  push ecx
  push esi
  mov ecx, 256
  lea ecx, [ecx + 4*ecx];1 bajt na znak, 4 na licznik = 5*256
  push ecx
  call _malloc
  add esp, 4
  cmp eax, -1
  je koniec
  push eax
  mov esi, eaxmov al, 0
  cld
  rep stosb
  pop eax
  mov ebx, 0
  mov ecx, 0
  znaki: ;w tej pętli wypełniamy bajtowe pola na znaki
  mov [eax + ebx], cl
  inc ecx
  add ebx, 5
  cmp ecx, 256
  jne znaki
  mov ebx, 0
  mov ecx, 0
  mov esi, dword ptr [ebp+8]
  ptl:
    mov bl, byte ptr [esi + ecx];bl jest indeksem do inkrementacji licznika
    push ecx
    lea ecx, [eax + 4*ebx]
    add ecx, ebx;w ten sposób chciałem osiągnąć coś w stylu niedozwolonego lea ecx,[eax + 5*ebx]
    add dword ptr [ecx + 1], 1;przeskakujemy bajt znaku i zwiększamy licznik
    pop ecx
    inc ecx
    cmp ecx, dword ptr [ebp+12]
    jne ptl
  koniec:
  pop esi
  pop ecx
  pop ebx
  pop ebp
  ret
_wystapienia ENDP