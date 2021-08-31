mov ebx, -2
bt ebx, 31
jnc koniec
;ebx < 0
neg ebx
bts ebx, 31
clc
koniec: