## calcUserShadow

Write subroutine in x86 masm 32 bit mode adjusted to be called from C language assuming the following prototype:

```c
float * wyznaczCienUzytkownika(unsigned short * tablicaD, int index, int min, int max);
```

Which will return a pointer to array filled with pixels located in <min,max> distance from camera assigned to user with given id `index`. Input array is given in form of `tablicaD`. Resulting array with dimensions x = 640, y=480 should be prepared using `malloc` function. If a pixel belongs to user, then array should have its distance from camera given in milimeters. Rest of the pixels should have $+\inf$ value. The distribution of elements in array is just like in memory visualization for screen memory in 13H mode.
