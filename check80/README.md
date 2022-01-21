## check80

Write fragment of program in x86 masm which is going to check if 80-bit float point number located on top of a regular stack is equal to 2.0.
If so, then program sets carry flag, else resets it.
In 80bit format the exponent and sign are taking oldest 2 bytes, mantissa takes the remaining 8 bytes with lower addresses.
Fragment cannot be using x87 FPU instructions. Integral part of mantissa is visible.
Exponent bias is equal to 16383 (2<sup>14</sup>-1)
