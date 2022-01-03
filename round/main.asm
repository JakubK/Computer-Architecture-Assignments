;jesli czesc ulamkowa jest mniejsza niz 1/2 to zerujemy wszystkie bity ulamkowe
;w przeciwnym razie ustawiamy je na 1
round PROC

bt edx, 6
jc roundUp
and dl, 07Fh
jmp koniec
roundUp:
or dl, 0FFh
koniec:

ret
round ENDP