1.
```
a = 5
a = 6
```
What is `a`?
6

2.
```
a = 5
a + 2
```
What is `a`?
5

3.
```
a = 5
b = 7
a = b + 2
```
What is `b`?
7

4.
```
a = 5
b = 10
c = a + b
```
What is `c`?
15

5.
```
a = 5
a = a + 2
```
What is `a`?
7

6.
```
a = 5
b = 10
c = a + b * 2
```
What is `c`?
25

7.
```
a = 5
b = 10
c = a
a = b
```
What is `c`?
5
What is `a`?
10

8.
```
a = 5
b = 10
a = b
b = a
```
What is `b`?
10

9.
```
a = 5
b = 10
a = b
b = a + b
```
What is `b`?
20

10.
```
a = "a"
b = "b"
b.upcase!
a = b
```
What is `a`?
"B"

11.
```
a = "a"
b = "b"
a.upcase!
b = a
a.downcase!
```
What is `a`? What is `b`?
a = "a"
b = "a"

12.
```
a = "a"
b = "b"
b.upcase!
a = b
b.downcase!
c = a + b
```
What is `c`?
"bb"

13.
```
a = 10
b = "b"
c = "c"
a = a + b.to_i
b.upcase!
b = b + c
d = a.to_s + b + c
```
What is `d`?
"10Bcc"

14.
```
a = 10
b = "b"
a = b
b = b.upcase
c = b
```
What is `a`? What is `c`?
a = "b"
c = "B"

15.
```
a = 10
b = "5"
c = a.to_s + b = "105"
a = "A"
b = b.to_i = 5
a = a.downcase + a + c = "aA105"
d = b + c.to_i = 110
b = d.to_s + a.upcase! = "110AA105"
```
What are `a`, `b`, `c`, and `d`?
a = "AA105"
b = "110AA105"
c = "105"
d = 110
