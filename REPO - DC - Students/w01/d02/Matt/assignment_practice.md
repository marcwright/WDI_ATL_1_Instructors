1.
```
a = 5
a = 6
```
What is `a`?

a = 6

2.
```
a = 5
a + 2
```
What is `a`?

a = 7

3.
```
a = 5
b = 7
a = b + 2
```
What is `b`?

b = 7

4.
```
a = 5
b = 10
c = a + b
```
What is `c`?

c = 15

5.
```
a = 5
a = a + 2
```
What is `a`?

a = 7

6.
```
a = 5
b = 10
c = a + b * 2
```
What is `c`?

c = 25

7.
```
a = 5
b = 10
c = a
a = b
```
What is `c`?
What is `a`?

c = 5
a = 10

8.
```
a = 5
b = 10
a = b
b = a
```
What is `b`?

b = 10

9.
```
a = 5
b = 10
a = b
b = a + b
```
What is `b`?

b = 20

10.
```
a = "a"
b = "b"
b.upcase!
a = b
```
What is `a`?

a = "B"

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
b = "A"

12.
```
a = "a"
b = "b"
b.upcase! # b = "B"
a = b # a = "B"
b.downcase! # b = "B"
c = a + b # c = "B" + "B"
```
What is `c`?

c = "bb"

13.
```
a = 10
b = "b"
c = "c"
a = a + b.to_i # a = 10
b.upcase! # b = "B"
b = b + c # b = "B" + "c"
d = a.to_s + b + c # d = "10" + "B" + "c" + "c"```
What is `d`?

d = "10" + "B" + "c" + "c"

14.
```
a = 10
b = "b"
a = b # a = "b"
b = b.upcase # a/b = "B"
c = b
```
What is `a`? What is `c`?

a = "b"
c = "B"

15.
```
a = 10
b = "5"
c = a.to_s + b # "10" + "5" # c = "105"
a = "A"
b = b.to_i # b = 0
a = a.downcase + a + c  # a = "a" + "a" + "10" + "5"
d = b + c.to_i # d = 15
b = d.to_s + a.upcase!
```
What are `a`, `b`, `c`, and `d`?


