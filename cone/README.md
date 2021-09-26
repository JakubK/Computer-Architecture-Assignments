## Cone

Write subroutine in x86 masm ready to be called by C language matching the following prototype:

```c
float obj_stozka_sc(float r, float R, float h);
```

Subroutine should calculate volume `V` of cut cone with height `h`, radius of the bottom base `R`, and top `r` using given formula:

$$V = \frac{\pi}{3}h(R^2 + Rr + r^2) $$