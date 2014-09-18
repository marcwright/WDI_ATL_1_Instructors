# Binary, Octal, and Hexidecimal

## Radix/Base - what is it
In mathematics, the 'radix' or 'base' is the number of unique digits, including zero, uses to represent numbers.

For example, for the decimal system (the most common system in use today) the radix is ten, because it uses the ten digits from 0 through 9.

Binary uses only two digits (0 and 1)

* work through binary counting in grid/spreadsheet

Number | Binary
-----: | -----: 
0 | 0
1 | 1
2 | 10
3 | 11
4 | 100
5 | 101
6 | 110
7 | 111
8 | 1000
9 | 1001
10 | 1010
11 | 1011
12 | 1100
13 | 1101
14 | 1110
15 | 1111
16 | 10000
17 | 10001
18 | 10010
19 | 10011
20 | 10100
21 | 10101
22 | 10110
23 | 10111
24 | 11000
25 | 11001
26 | 11010
27 | 11011
28 | 11100
29 | 11101
30 | 11110
31 | 11111
32 | 100000


12th | 11th | 10th | 9th | 8th | 7th | 6th | 5th | 4th | 3rd | 2nd | 1st | 0th column | Radix
----: | ----: | ----: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ----------: | ----- 
12th | 11th | 10th | 9th | 8th | 7th | 1000000 | 100000 | 10000 | 1000 | 100 | 10 | 0 | decimal
4096 | 2048 | 1024 | 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 0 | binary


# Why is binary used in computing?
The two digits are "0" and "1", are espressed as switches displaying OFF and ON respectively. Used in most electric counters.

So it's easy for computers to count in binary - they just turn switches on an off.

But binary numbers are a bit of a pain for humans to read... why?

````
101011101 = 349
10001000100111 = 8743
````

They're long... so we could do with a way to abbreviate them.


# Alternatives to Binary

Look at the list of binary numbers - when do we get a '1' followed by all zeros?

2, 4, 8, 16, 32....

And some others in the middle, like 24, are quite "round" - that is, finishing in a row of zeros.

8, 16, 24, 32.... I'm seeing multiples of 8.

## Octal

Octal uses 8 digits to count

```
101011101 = 535
10001000100111 = 21047
```

## Hexidecimal

Instead of multiples of 8, how about 16

In hexidecimal, we can use the ten digits of decimal... but we need six more...

- We could make up some symbols.
- Or use symbols we know

The choice made was to use the letters a-f

```
10001000100111 = 2227
```


# Confusing numbers

    "There are 10 types of people in the world...
        ... those that understand binary, and those that don't"

What number is 1001?

- 1001?
- 9?
- 513?
- 4097?

So we represent numbers with their base subscript next to them.

Or Hex is often shown with '0x' in front. Or a '%' sign. Or some other notation... depending on the system.


# Converting binary to hex

Considering that any four digit binary number can be no more than 15, and 15 is the maximum value of a single digit in hex... we can map any binary number easily to hex by splitting it into sections of four, and converting each:

```
     10001000100111
0010 0010 0010 0111
   2    2    2    7
             0x2227

    101101000111100
0101 1010 0011 1100
   5    a    3    c
             0x5a3c
```

and you can double-check:

    "10001000100111".to_i(2).to_s(16)
    "101101000111100".to_i(2).to_s(16)


# Converting in Ruby

Integer#to_s and String#to_i take an optional "base" parameter.

Integer#to_s(base) converts a decimal number to a string representing the number in the base specified:

    9.to_s(2) #=> "1001"

while the reverse is obtained with String#to_i(base):

    "1001".to_i(2) #=> 9




