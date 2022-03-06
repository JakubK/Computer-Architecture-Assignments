## Floyd-Steinberg

Floyd-Steinberg algorithm is used for palette reduction of given image.

Algorithm's pseudocode:

```pascal
for each y from top to bottom do
  for each x from left to right do
    oldpixel := pixels[x][y]
    newpixel := quantize_pixel(oldpixel)
    pixels[x][y] := newpixel
    error := oldpixel - newpixel
    if(x < width - 1 && y < height - 1) do
      pixels[x + 1][y] := pixels[x + 1][y] + error * 7 / 16
      pixels[x - 1][y] := pixels[x - 1][y] + error * 3 / 16
      pixels[x][y+1] := pixels[x][y+1] + error * 5 / 16
      pixels[x + 1][y+1] := pixels[x + 1][y+1] + error * 1 / 16
```

1. Write subroutine in x86 masm in C calling convention by given prototype:

```c
unsigned char quantise_bit(unsigned char pixel_value);
```

Function for values below 128 should return 0, otherwise 255. It's forbidden to use any jump instructions here.

2. Write subroutine in x86 masm with C calling convention in given prototype:

```c
void update_pixel(unsigned char * pixel, int error, int weight);
```

Function adds to given pixel (pointed by *pixe) error value multiplied by weight and divided by 16. The whole operation must be done in 32-bit domain with sign (error can be negative), and the resulting pixel value must be cut to the appropriate range of values (simulate the overflow arithmetics)

3. Write subroutine in x86 masm with calling convention from C and prototype:

```c
void dither_FloydSteinberg(unsigned char *picture, int height, int width);
```

Which is going to realize FS algorithm for given monochromatic picture pointed by *picture of height and width given as arguments.

You can use subroutines from 2 previous tasks and pseudocode given in the introduction. 