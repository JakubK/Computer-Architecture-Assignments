_float2miesz PROC ;output as [edx:eax]
  push ebp
  mov ebp, esp
  push ecx
  mov eax, dword ptr [ebp+8]
  and eax, 7F800000h;wydobycie wykładnika
  shr eax, 23
  cmp eax, 127
  ja wGore
  ;w dol
  mov ecx, 127
  sub ecx, eax
  mov eax, dword ptr [ebp+8]
  and eax, 0007FFFFFh;wydobycie mantysy
  shr eax, cl
  mov edx, 0
  jmp koniec
  wGore:
  mov ecx, eax
  sub ecx, 127
  mov edx, 1;ustawienie niejawnej jedynki
  mov eax, dword ptr [ebp+8]
  and eax, 0007FFFFFh;wydobycie mantysy
  shl eax, 9;mantysa do lewej
  shld edx, eax, cl
  shl eax, cl
  koniec:
  pop ecx
  pop ebp
  ret
_float2miesz ENDP