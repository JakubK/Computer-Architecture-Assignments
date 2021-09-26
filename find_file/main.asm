.code

find_file PROC
    push ebp
    mov ebp, esp

        mov esi, dword ptr [ebp+8] ;*root
        mov edi, dword ptr [ebp+12];*file_name

        push dword ptr [ebp+8]
        call _SetCurrentDirectory@4;Winapi - no need to clean esp

        ;search for file
        sub esp, 10
        mov eax, esp
        push eax
        push dword ptr [ebp+8]
        call FindFirstFileA;Winapi - no need to clean esp

        cmp eax, -1
        je notfound:
        cmp eax, 0
        je notfound

        ;znaleziono plik w korzeniu
        mov eax, 1
        jmp koniec

        notfound:;nie znaleziono pliku w korzeniu
            sub esp, 2
            mov word ptr [esp], 'pa'
            mov eax, esp
            push eax
            call _SetCurrentDirectory@4
            ;w eax 1 lub 0; 1 to sukces
            cmp eax, 0
            je koniec

            ;1 więc udało się znaleźć pa
            ;search for file
            sub esp, 10
            mov eax, esp
            push eax
            push dword ptr [ebp+8]
            call FindFirstFileA;Winapi - no need to clean esp
            cmp eax, -1
            je notfound
            cmp eax, 0
            je notfound
            mov eax, 1
    koniec:        
    pop ebp
    ret
find_file ENDP


END