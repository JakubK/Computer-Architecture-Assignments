## Count File

Write subroutine in x86 masm ready to be called from C language.
Subroutine should match the following prototype:

```c
int CountFile(void * tablicaPlikow);
```

The task of function is to calculate number of files which where created in last hour (3600 seconds).
Data about files related to searching are stored in `tablicaPlikow` array.
Last element of this array has every values equal to 0.
Elements of mentioned array have the following structure:

```c
struct FileAttr
{
    char nazwaPliku[255]; //file name
    FILETIME czasUtworzenia; //time of file creation (8 bytes)
    int rozmiar;size of file in bytes (4bytes)
}
```

FILETIME type (64bit) states number of units 100-nanosecond which elapsed since 1 jan 1601

Winapi function can be used to give current time:

```c
FILETIME Now(void);
```

Tip: 64-bit values in 32bit mode are passed as pair of (edx:eax)