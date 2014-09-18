1.
```
a = 5
a = 6
```
What is `a`?  6



2.
```
a = 5
a + 2
```
What is `a`?  7  :::5



3.
```
a = 5
b = 7
a = b + 2
```
What is `b`?  9  :::7

4.
```
a = 5
b = 10
c = a + b
```
What is `c`?  15


5.
```
a = 5
a = a + 2
```
What is `a`?  7

6.
```
a = 5
b = 10
c = a + b * 2
```
What is `c`?  25

7.
```
a = 5
b = 10
c = a
a = b
```
What is `c`?  5
What is `a`?  10

8.
```
a = 5
b = 10
a = b
b = a
```
What is `b`?  10

9.
```
a = 5
b = 10
a = b
b = a + b
```
What is `b`?  20

10.
```
a = "a"
b = "b"
b.upcase!
a = b
```
What is `a`?  B

11.
```
a = "a"
b = "b"
a.upcase!
b = a
a.downcase!
```
What is `a`? a
What is `b`? A :::a

12.
```
a = "a"
b = "b"
b.upcase!
a = b
b.downcase!
c = a + b
```
What is `c`?  Bb  :::bb

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
What is `d`?  "10Bcc"

14.
```
a = 10
b = "b"
a = b
b = b.upcase
c = b
```
What is `a`?  B  :::b
What is `c`?  B

15.
```
a = 10
b = "5"
c = a.to_s + b
a = "A"
b = b.to_i
a = a.downcase + a + c
d = b + c.to_i
b = d.to_s + a.upcase!
```
What are `a`,   "aA105"
`b`,  "110A"
`c`,  "105"
and `d`?  110
