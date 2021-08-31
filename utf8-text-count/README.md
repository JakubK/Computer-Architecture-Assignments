## UTF-8 text count

In `znaki` array there's a text encoded in UTF-8. Array ends with byte 0. Write fragment of program in x86 asm that calculates the number of bytes of the text in that array after transforming it to utf-16. Result should be stored in `ecx`. Assume that only codes with size of 1,2 or 3 bytes are located in the array. 