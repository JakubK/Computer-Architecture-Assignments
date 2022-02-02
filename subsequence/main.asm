_podciag PROC
  push ebp
  mov ebp, esp

  push dword ptr [ebp+12]
  push dword ptr [ebp+8]
  call _podciag
  add esp, 4
  cmp eax, 1
  jbe nieznaleziono
  ;przepisujemy eax elementów począwszy od esi z t1
  mov edx, eax
  lea eax, [4*eax + 4];doliczamy miejsce na wartownika (dword ptr 0)
  push eax
  call _malloc
  add esp, 4
  ;w eax adres
  mov edi, eax;esi to adres nowego bufora
  mov ecx, edx;ecx to liczba elementow 4bajtowych
  mov esi, dword ptr [ebp+8]
  mov esi, [esi + 4*ecx]
  cld
  rep movsw
  moc [edi + 4*edx + 4], dword ptr 0;ustawienie wartownika
  jmp koncz
  nieznaleziono:
  mov eax, 0
  koncz:
  pop ebp
  ret
_podciag ENDP

;IN:
;parametry to adresy pod którymi znajdują się liczby z t1 i t2
;OUT:
;EAX - długość ciągu
;ESI - adres od którego zaczynamy przepisywanie
LCS PROC 
  push ebp
  mov ebp, esp

  push ebx
  push edi
  push edx

  mov eax, 0
  mov ebx, dword ptr [ebp+8]
  cmp [ebx], dword ptr 0
  je koniec
  mov ebx, dword ptr [ebp+12]
  cmp [ebx], dword ptr 0
  je koniec

  mov esi, dword ptr [ebp+8]
  mov ebx, dword ptr [esi]
  mov edi, dword ptr [ebp+12]
  cmp ebx, dword ptr [edi]
  jne pt2
    add esi, 4
    push esi
    mov esi, dword ptr [ebp+12]
    push esi
    call LCS
    add esp, 8
    inc eax
    jmp koniec
  p2:
    add esi, 4
    push esi
    push dword ptr [ebp+12]
    call LCS
    add esp, 8
    mov edx, eax
    push dword ptr [ebp+8]
    mov esi, dword ptr [ebp+12]
    add esi, 4
    push esi
    call LCS
    cmp edx, eax
    jbe koniec
    mov eax, edx
    koniec:
  pop edx
  pop edi
  pop ebx
  ret
LCS ENDP