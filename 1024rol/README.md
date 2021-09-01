## 1024 rol

In some program there's 1024-bit register simulated by array `tablica1024`, containing 128 bytes

Write subroutine in x86 asm that will rotate by 1 position whole register, setting Carry Flag to most significant bit (like ROL)

Assume that `tablica1024` was initialized earlier in data section as 128 byte array
Use SHL and RCL
Be aware that most of instructions affect CF unlike MOV, LOOP, INC or DEC