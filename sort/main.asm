_sortuj PROC
push ebp
mov ebp, esp
pusha
mov ecx, 0
mov eax, dword ptr [ebp+8];*tablica
outer:
  push ecx
  mov ecx, 0
  mov ebx, 1;to będzie offset dla liczników +1 +6 +11 ...
  inner:
    mov esi, dword ptr [eax + ebx]
    cmp esi, dword ptr [eax + ebx + 5]
    jae dalej
    mov edi, dword ptr [eax+ebx+5]
    mov [eax+ebx+5], esi
    mov [eax+ebx], edi
    mov dl, [eax+ebx-1]
    mov dh, [eax+ebx+4]
    mov [eax+ebx-1], dh
    mov [eax+ebx+4], dl
    dalej:
    inc ecx
    cmp ecx, dword ptr [ebp+12]
    jne inner
  pop ecx
  inc ecx
cmp ecx, dword ptr [ebp+12]
jne outer
popa
pop ebp
ret
_sortuj ENDP
