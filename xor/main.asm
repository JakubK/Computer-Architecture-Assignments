mov edi, 5
mov esi, 1

;xor edi, esi

;a xor b <=> ~ab | a~b

push eax
push ebx

mov eax, edi;p
not eax ;~p
and eax, esi ;~pq

mov ebx, esi;q
not ebx;~q
and ebx, edi;p~q

or eax, ebx; ~pq | p~q
mov edi, eax

pop ebx
pop eax