## Display IEEE754

Floating point numbers can be easily displayed on screen if converted to BCD format.
x87 instruction `FBSTP` removes number from top of the coprocessor stack  and converts it to BCD. Argument of such instruction must be a 10-byte buffer of memory which can be declared using `DT` directive. Before saving, number is rounded to closest integral number.
For example: number 1000 * PI gets written in 10-byte buffer (hex):

42 31 00 00 00 00 00 00 00 00

Write subroutine in x86 masm which is going to take number present on top of coprocessor stack and display it.
Number of digits after dot is placed in `CL` register.
Assume that number to be displayed is always positive.

Tip:
Before calling `FBSTP` execute multiplication by 10<sup>a</sup>, where `a` is the number in `CL`. Multiplier should be represented as normal number in binary and the multiplication itself should be done with `FIMUL` instruction. Remember to place the dot between the integral and the fractional part.