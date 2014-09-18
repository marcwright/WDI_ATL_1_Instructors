# Floating Point Errors

## Example of floating point error

  > j=0.1
  => 0.1
  > j*10-1
  => 0.0
  > j+j+j+j+j+j+j+j+j+j-1
  => -1.1102230246251565e-16

WTF?

  > j+j
  => 0.2
  > j+j+j
  => 0.30000000000000004
  > j+j+j+j
  => 0.4
  > j+j+j+j+j
  => 0.5
  > j+j+j+j+j+j
  => 0.6
  > j+j+j+j+j+j+j
  => 0.7
  > j+j+j+j+j+j+j+j
  => 0.7999999999999999
  > j+j+j+j+j+j+j+j+j
  => 0.8999999999999999
  > j+j+j+j+j+j+j+j+j+j
  => 0.9999999999999999

## What causes these errors?

Because some fractions need a very large (or even infinite) amount of places to be expressed without rounding. This holds true for decimal notation as much as for binary or any other. If you would limit the amount of decimal places to use for your calculations (and avoid making calculations in fraction notation), you would have to round even a simple expression as 1/3 + 1/3. Instead of writing 2/3 as a result you would have to write 0.33333 + 0.33333 = 0.66666 which is not identical to 2/3.

In case of a computer the number of digits is limited by the technical nature of it's memory and CPU registers. The binary notation used internally adds some more difficulties. Computers normally can't express numbers in fraction notation, though some programming languages add this ability, which allows to avoid those problems to a certain degree.


## The standard

Nearly all hardware and programming languages use floating-point numbers in the same binary formats, which are defined in the IEEE 754 standard. The usual formats are 32 or 64 bits in total length:

| Format           | Total bits | Significand bits | Exponent bits | Smallest number  | Largest number  |
| Single precision | 32         | 23 + 1 sign      | 8             | ca. 1.2 ⋅ 10-38  | ca. 3.4 ⋅ 1038  |
| Double precision | 64         | 52 + 1 sign      | 11            | ca. 5.0 ⋅ 10-324 | ca. 1.8 ⋅ 10308 |

