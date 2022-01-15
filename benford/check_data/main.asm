_check_data PROC
  push ebp
  mov ebp, esp
  push ebx
  push ecx
  push edx
  push esi
  push edi

  ;najpierw należy zbudować tablicę z danymi teoretycznymi
  call _create_benford_distribution_asm
  ;w eax znajduje się wskaźnik na dane teoretyczne
  mov ebx, eax
  ;teraz można wydobyć faktyczne rozkłady dla danych
  mov esi, 0;tutaj przecinki
  mov ecx, 0;tutaj elementy
  mov edi, dword ptr [ebp+8]
  ptl:
    ;policzymy przecinki
    mov ax, word ptr [edi + 2*ecx]
    cmp ax, word ptr 0
    je dalej
    cmp ax, word ptr ','
    jne kontynuuj
    inc esi
    kontynuuj:
    inc ecx
    jmp ptl
  dalej:
  ;teraz możemy wydobyć dane faktyczne
  push esi
  push edi
  call _get_actual_distribution
  add esp, 8
  ;w eax dane faktyczne
  ;w ebx dane teoretyczne
  mov ecx, 0
  finit
  ;teraz obliczymy 0.125 = 1/8
  fld1
  mov edx, 8
  push edx
  fild dword ptr [esp]
  add esp, 4
  ;st(0) = 8
  ;st(1) = 1
  fdiv

  ptl3:
    ;st(0) = 0.125
    ;ładujemy teoretyczną daną
    fld dword ptr [ebx + 4*ecx]
    ;ładujemy daną faktyczną
    fld dword ptr [eax + 4*ecx]
    fsub
    fabs
    ;st(0) = różnica
    ;st(1) = 0.125
    fcomi st(0), st(1)
    ja falsz
    fstp st(0); pozbywamy sie wyliczonej roznicy 
    inc ecx
  cmp ecx, esi
  jne ptl3
  sukces:
    mov eax, 0
    jmp koniec
  falsz:
    mov eax, 1
  koniec:

  pop edi
  pop esi
  pop edx
  pop ecx
  pop ebx

  pop ebp
  ret
_check_data ENDP