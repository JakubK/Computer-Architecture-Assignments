push eax
push ecx
;10 bajtowa liczba
;sprawdzamy czy najstarszy bit = 1; jeśli tak to CLC
mov al, byte ptr [esp + 9]
movzx ax, al
bt ah, 7
jc koniecCLC
;teraz należy obliczyć faktyczny wykładnik
mov ax, word ptr [esp + 8]; znak na pewno jest zerowy
sub ax, 16383
cmp ax, 1
jne koniecCLC
cmp [esp + 7], byte ptr 10000000b;ten bajt musi zawierać ustawioną jedynkę
jne koniecCLC
;teraz trzeba sprawdzić czy reszta bajtów jest zerowa
;jeśli którykolwiek nie jest => CLC
mov ecx, 0
ptl:
cmp [esp + ecx],byte ptr 0
jne koniecCLC
inc ecx
cmp ecx, 7
jne ptl
jmp koniecSTC
koniecCLC:
clc
jmp koniec
koniecSTC:
koniec:
pop ecx
pop eax
