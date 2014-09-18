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

a = 5
#because a is not being reassigned

3.
```
a = 5
b = 7
a = b + 2
```
What is `b`?

b = 7
#becuase b was not reassigned

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
#order of operations

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
b = "a"
# same values because b was reassigned to a in 113

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

c = "BB"
# again, a was reassigned to b

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

d = "10Bcc"

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
c = a.to_s + b
a = "A"
b = b.to_i
a = a.downcase + a + c
d = b + c.to_i
b = d.to_s + a.upcase!
```
What are `a`, `b`, `c`, and `d`?

c = "105"
a = "aA105"
# only one "a" was made to downcase. an exclamation mark would have yielded 2 lower case "a's"
d = 110
b = "110AA105"