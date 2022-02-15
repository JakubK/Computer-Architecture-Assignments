## Levenshtein

Levenshtein's algorithm is calculating editing distance between 2 given strings. Its the amount of simple changes (add new character, delete or replace sign) which are converting first string to the second. The whole idea of this algorithm is to build 2-dimensional array (m+1)x(n+1) where m and n are the sizes of given strings (without ending 0). First row and first column is filled with values from 0 to m and from 0 to n (lets call this method as `utworz_i_zainicjuj`) and zero the remaining cells.

For example lets show the table for 2 strings: "fakt" (m=4) and "ako" (n=3)

|0|1|2|3|4|
|---|--|---|---|--|
|1|0|0|0|0|
|2|0|0|0|0|
|3|0|0|0|0|

(`ustaw_ij`)
Next we iterate over remaining cells from left to right, top to bottom doing the following procedure:

We fill (i,j) cell of the array with the minimal of the 3 values:

  - Value of cell on top of the current cell, incremented by 1
  - Value of cell on the left of current cell, incremented by 1
  - Value of the cell on the top-left of current cell, It should be incremented by 1 if letters are different.

After filling the whole array, the target editing distance is stored at [m+1,n+1].

For given example the value is equal to 2

|0|1|2|3|4|
|---|--|---|---|--|
|1|1|1|2|3|
|2|2|2|1|2|
|3|3|3|2|**2**|


1. Write in 32bit asm a subroutine which is prepared to be called from C language which is meant to calculate the distance between a and b characters, located at i and j indices in their base strings (indexing from 1).
Its meant to put the distance at [i,j] cell in memory

```c
void ustaw_ij(void * tablica, wchar_t a, wchar_t b, unsigned int)
```

Subroutine should not be using static data segment

2. Write in 32bit asm a subroutine which is prepared to be called from C language which is meant to calculate the editing distance between 2 given strings in UTF-16 (only Unicode BMP characters).

```c
unsigned int levenshtein(wchar_t * napisA, wchar_t * napisB);
```

To do this you can use three following subroutines:

a. lstrlenW - returns the size of given string in UTF-16 (without ending 0) of address passed as an argument. It matches the WinAPI standard and has the following prototype:

```c
int lstrlenW(wchar_t * lpString);
```

b. utworz_i_zainicjuj - function matching the C standard which allocated array (m+1)x(n+1) and returns pointer to it. It also fills first row with 0..m and first column with 0...n values, the remaining cells are zeroed.

```c
void * utworz_i_zainicjuj(unsigned int m, unsigned int n);
```

c. ustaw_ij (from previous task) which sets the distance at given i and j in the array. Prototype is just like the one given in the previosu task.