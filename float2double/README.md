## float 2 double

In computer memory, starting from address stored in `ESI` there's 32bit number in `float` format. 

Write fragment of x86 masm which is going to convert it to 64-bit `double` format and store it in memory starting from address given in `EDI`. Using x87 instructions is forbidden.