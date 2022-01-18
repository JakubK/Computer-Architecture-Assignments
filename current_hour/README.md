## current hour

Write subroutine in x86 masm prepared to be called from C language with the following prototype:

```c
void aktualna_godzina(char * godzina);
```

Subroutine should get information about the current hour using `GetSystemTime` function of Windows system. Argument for this function is a struct of type `SYSTEMTIME`

```c
typedef struct _SYSTEMTIME {
  WORD wYear;
  WORD wMonth;
  WORD wDayOfWeek;
  WORD wDay;
  WORD wHour;
  WORD wMinute;
  WORD wSecond;
  WORD wMiliseconds;
} SYSTEMTIME;
```

`wHour` field of this structure will be filled with current hour that needs to be converted to string in 24h format.
