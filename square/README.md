## Square

Write subroutine in x86 masm which is going to calculate value of function `kwadrat` with recursion based on following formula:

a<sup>2</sup> = (a-2)<sup>2</sup> + 4*a - 4 for a > 1<br>
a<sup>2</sup> for a = 1<br>
a<sup>2</sup> for a = 0

where `a` param is 32-bit number in <1,65535>.
Subroutine should be callable from C language with following prototype:

```c
unsigned int kwadrat(unsigned int a);
```

Using Shifting or multiplying instructions is forbidden.