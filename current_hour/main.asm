_aktualna_godzina PROC
  push ebp
  mov ebp, esp
  pusha
  ;alokacja przestrzeni na strukturę
  sub esp, 16
  push esp
  call _GetSystemTime@4 ;WinAPI - nie trzeba sprzątać stosu
  ;teraz można odczytać word
  mov ax, word ptr [esp + 8];wHour
  cmp ax, 9
  ja dwucyfrowe
  ;jednocyfrowe
  mov edx, 0
  mov ebx, 10
  movzx eax, ax
  div ebx
  mov ebx, dword ptr [ebp + 8]
  add dl, '0'
  mov byte ptr [ebx], dl
  mov byte ptr [ebx+1],0
  jmp koniec
  dwucyfrowe:
  mov edx, 0
  mov ebx, 10
  movzx eax, ax
  div ebx
  push edx
  mov edx, 0
  div ebx

  mov ebx, dword ptr [ebp + 8]
  add dl, '0'
  mov byte ptr [ebx], dl
  pop edx
  add dl,'0'
  mov byte ptr [ebx + 1], dl
  mov byte ptr [ebx + 2], 0

  koniec:
  add esp, 16
  popa
  pop ebp
  ret
_aktualna_godzina ENDP