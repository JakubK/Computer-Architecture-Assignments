;jeśli część ułamkowa jest mniejsza od 1/2 to nic nie robimy poza zerowaniem jej
;w przeciwnym wypadku również zerujemy, ale zwiększamy część całkowitą o 1
round PROC

bt edx, 6
jc roundUp
and dl, 00h
jmp koniec
roundUp:
shr edx, 7
inc edx
shl edx, 7
koniec:

ret
round ENDP