## Termometer

Write subroutine in x86 masm matching the code in C language given below.
It's task is to read the temperature from `DS1820` connected to the computer via 1-WIRE. The reading itself is performed by given function in C:

```c
short int termometer_read_bit(void);
```

Which returns next bit (according to the most significant) sent from the device.
Next 16 bits read from it are forming a numer where 4 least significant bits are making it's fractional part.

```c
extern short int termometer_read_bit();

struct read {
  int integral;
  int fraction;
} _read;


float termometer_read(struct read * p)
{
  unsigned short int word = 0;
  int i = 16;

  while(i--)
  {
    word <<= 1;
    if(termometer_read_bit())
    {
      word != 0x0001;
    }
  }
  p->integral = word/16;
  p->fraction = word % 16;

  return (float)((float)p->integral + ((float)(p->fraction))/16);
}
```