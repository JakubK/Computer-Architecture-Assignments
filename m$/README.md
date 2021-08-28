# M$


## 1.

Write subroutine using x86 masm (without using 64-bit registers) ready to be called by C language, with the following prototype:

```c
void shl_128(__m128 * a, char n);
```

which is going to shift left logically 128-bit number by n bits. Subroutine cannot be using static data segment.

## 2.

Write subroutine using x86 masm (without using 64-bit registers) ready to be called by C language, with the following prototype:

```c
void mul_24(__m128 * in, __ml128 * out);

```
which has to multiply number residing in `in` by 24 and return it as `out`. The `in` number cannot be modified and the subroutine should not be using static data segment.
The subroutine from `#1 assignment` can be used.


## 3.

Write subroutine using x86 masm (without using 64-bit registers) ready to be called by C language, with the following prototype:

```c
unsigned int get_RPK(char * PK);
```

which transforms given PK to RPK. PK is made of 5 alphanumerical strings separated by `-` where each string consists of 5 characters, for example:

`FFFFF-GGGGG-HHHHH-JJJJJ-KKKKK`

Everything excluding `-` is making a number in base-24 encoding. Leftmost symbol `F` is least significant and rightmost - `K` is most significant. Each symbol has its own value as shown in the table:

<table>
    <tr>
        <th>B</th>
        <th>C</th>
        <th>D</th>
        <th>F</th>
        <th>G</th>
        <th>H</th>
        <th>J</th>
        <th>K</th>
        <th>M</th>
        <th>P</th>
        <th>Q</th>
        <th>R</th>
        <th>T</th>
        <th>V</th>
        <th>W</th>
        <th>X</th>
        <th>Y</th>
        <th>2</th>
        <th>3</th>
        <th>4</th>
        <th>6</th>
        <th>7</th>
        <th>8</th>
        <th>9</th>
    </tr>
    <tr>
        <td>0</td>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
        <td>6</td>
        <td>7</td>
        <td>8</td>
        <td>9</td>
        <td>10</td>
        <td>11</td>
        <td>12</td>
        <td>13</td>
        <td>14</td>
        <td>15</td>
        <td>16</td>
        <td>17</td>
        <td>18</td>
        <td>19</td>
        <td>20</td>
        <td>21</td>
        <td>22</td>
        <td>23</td>
    </tr>
</table>

The result of PK decoding is a number without sign that hold about 115 bits. Unused most significant bits should be set to zero.

Everything is stored in Little Endian 15 byte array. For example decoding given PK (FFFFF-...-KKKKK) produces:

0x6F 0xFA 0x95 0x45 0xFC 0x75 0xB5 0x52 0xBB 0xEF 0xB1 0x17 0xDA 0xCD 0x00 

where 0x6F is least significant. Out of these 15 bytes, bytes 8-5 in Big-Endian are making RPK that has to be returned by the function.