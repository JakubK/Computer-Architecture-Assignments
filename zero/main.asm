_zeruj PROC
  push ebp
  mov ebp, esp
  pusha
  finit
  push 037FH
  fldcw word ptr [esp]
  add esp, 4
  mov ecx, 0
  
  mov eax, dword ptr [ebp+8];liczby*
  ptl:
  ;należy przekształcić floata na liczbę całkowitą
  mov esi, dword ptr [ebp+12];tablica*

  fld dword ptr [esi + 4*ecx];
  sub esp, 4
  fist dword ptr [esp]
  mov ebx, dword ptr [esp]
  add esp, 4
  ;w ebx liczba całkowita
  ;256bitów to 8 rejestrów 32 bitowych
  ;jeśli którykolwiek z nich jest różny od zera to liczby[i] > tablica[i]
  ;niech edx będzie sumą logiczną 7 najstarszych 32 bitowych składowych liczby[i]
  mov edx, 0
  add eax, 4;zwiększamy eax o 4 żeby przeskoczyć najmłodszą składową
  push ecx
  mov ecx, 0
  wewnetrznaPetla:
    or edx, dword ptr [eax]
    add eax, 4
    inc ecx
    cmp ecx, 7
  jne wewnetrznaPetla
  pop ecx
  sub eax, 4

  ;edx != 0 => nie zerujemy
  cmp ecx, 0
  jne dalej

  cmp dword ptr [eax], ebx
  jae dalej
  ;tutaj zerujemy
  push ecx
  mov ecx, 0
  zero:
    mov dword ptr [eax], 0
    add eax, 4
    inc ecx
    cmp ecx, 8
  jne zero
  pop ecx
  jmp kontynuuj
  dalej:
  add eax, 32
  kontynuuj:
  inc ecx
  cmp ecx, dword ptr [ebp+16] ;n
  jne ptl

  popa
  pop ebp
  ret
_zeruj ENDP