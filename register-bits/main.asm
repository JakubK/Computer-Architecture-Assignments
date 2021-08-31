mov eax, 0F000000Ah
push ebx
mov ebx, 0
mov ecx, 31
ptl:

bt eax, ecx
jnc dalejptl
inc ebx
dalejptl:
dec ecx
cmp ecx, -1
jne ptl

mov ecx, ebx

pop ebx