_dither_FloydSteinberg PROC
  push ebp
  mov ebp, esp
  pusha

  mov ecx, 0;y
  forY:
    push ecx
    mov ecx, 0
    forX:
      ;ecx -> x, [esp] -> y
      ;y * width + x -> adres
      mov eax, dword ptr [ebp+16]
      mul dword ptr [esp]
      add eax, ecx; picture + eax -> [x][y]
      add eax, dword ptr [ebp+8]
      mov edx, eax
      mov al, byte ptr [eax]
      mov bl, al; <- oldpixel
      movzx eax, al
      push eax
      call _quantise
      add esp, 4
      ;al <- newpixel
      mov [edx], al; pixels[x][y] = newpixel
      sub bl, al; bl <-- error
      movzx esi, bl;error
      mov ebx, [ebp+16]
      dec ebx; width - 1
      cmp ecx, ebx
      setb al

      mov ebx, [ebp+12]
      dec ebx
      cmp [esp], ebx
      setb ah
      and ah, al
      cmp ah, 1
      jne dalej
        ;w edx znajduje się pixels[x][y]
        mov eax, edx
        inc eax;pixels[x+1][y]
        push 7 ;weight
        push esi
        push eax
        call _update_pixel
        add esp, 12

        sub eax, 2;pixels[x-1][y]
        add eax, dword ptr [ebp+16] ;pixels[x-1][y+1]
        push 3
        push esi
        push eax
        call _update_pixel
        add esp, 12

        inc eax;pixels[x][y+1]
        push 5
        push esi
        push eax
        call _update_pixel
        add esp, 12

        inc eax;pixels[x+1][y+1]
        push 1
        push esi
        push eax
        call _update_pixel
        add esp, 12

      dalej:
      inc ecx
      cmp ecx, dword ptr [ebp+16];width
      jne forX
    pop ecx
    inc ecx
    cmp ecx, dword ptr [ebp+12];height
    jne forY

  popa
  pop ebp
  ret
_dither_FloydSteinberg ENDP