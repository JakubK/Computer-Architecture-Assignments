;typedef struct _SYSTEM_INFO {
;  union {
;    DWORD dwOemId;
;    struct {
;      WORD wProcessorArchitecture;
;      WORD wReserved;
;    } DUMMYSTRUCTNAME;
;  } DUMMYUNIONNAME;                        ;4 byte
;  DWORD     dwPageSize;                    ;4 byte
;  LPVOID    lpMinimumApplicationAddress;   ;4 byte
;  LPVOID    lpMaximumApplicationAddress;   ;4byte
;  DWORD_PTR dwActiveProcessorMask;         ;4byte
;  DWORD     dwNumberOfProcessors;          ;4byte
;  DWORD     dwProcessorType;               ;4byte
;  DWORD     dwAllocationGranularity;       ;4byte
;  WORD      wProcessorLevel;               ;2byte
;  WORD      wProcessorRevision;            ;2byte
;} SYSTEM_INFO,                             ;=36bytes
*LPSYSTEM_INFO;

.686
.model flat
extern _GetSystemInfo@4 : PROC
.code
_liczba_procesorow PROC
    push ebp
    mov ebp, esp

    sub esp, 36
    mov esi, esp
    push esi
    call _GetSystemInfo@4

    ;result in 'dwNumberOfProcessors'
    ;+20

    mov eax, dword ptr [esi+20]
    add esp, 36

    pop ebp
    ret
_liczba_procesorow ENDP

END