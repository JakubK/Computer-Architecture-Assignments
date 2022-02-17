_ustaw_ij PROC
  push ebp
  mov ebp, esp
  pusha

  mov eax, dword ptr [ebp+16];i
  mov edx, 0
  mul dword ptr [ebp+24]; m
  shl eax, 2
  ;w eax 4 * m * i
  mov edx, dword ptr [ebp+20]
  shl edx, 2
  add edx, eax

  mov eax, dword ptr [ebp+8]
  add eax, edx;adres komórki [i,j]
  lea esi, [eax-4]
  mov esi, [esi]
  inc esi;wartość komórki po lewej
  mov edi, eax;teraz trzeba odjąć cały wiersz by się cofnąć
  push eax
  push edx
  mov edx, 0
  mov eax, dword ptr [ebp+24];m
  mul dword ptr [ebp+16];i
  shl eax, 2; * 4
  sub edi, eax
  mov ebx, edi
  mov edi, [edi]
  inc edi

  sub ebx, 4
  mov ebx, [ebx];wartość lewej górnej komórki
  inc ebx
  push eax ;teraz chcemy porównać litery
  mov ax, word ptr [ebp+12]; a
  cmp ax, word ptr [ebp+14]; b
  setne al
  movzx eax, al
  add ebx, eax
  pop eax

  ;pętla by znaleźć minimum bez gubienia się w rozgałęzieniach
  push esi
  push edi
  push ebx
  mov ecx, 0
  ptl:
    cmp [esp + 4 * ecx], esi
    jb zmn
    jmp dalej
    zmn:
      mov esi, dword ptr [esp + 4 * ecx]
    dalej:
      inc ecx
      cmp ecx, 3
  jne ptl;minimum znajduje się w esi
  mov [eax], esi
  add esp, 12
  popa
  pop ebp
  ret
_ustaw_ij ENDP