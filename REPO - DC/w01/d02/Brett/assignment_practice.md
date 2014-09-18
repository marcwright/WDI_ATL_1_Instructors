1.
```
a = 5
a = 6
```
What is `a`?
<<<<<<< HEAD
=======
6
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

2.
```
a = 5
a + 2
```
What is `a`?
<<<<<<< HEAD
=======
5
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

3.
```
a = 5
b = 7
a = b + 2
```
What is `b`?
<<<<<<< HEAD
=======
7
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

4.
```
a = 5
b = 10
c = a + b
```
What is `c`?
<<<<<<< HEAD
=======
15
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

5.
```
a = 5
a = a + 2
```
What is `a`?
<<<<<<< HEAD
=======
7
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

6.
```
a = 5
b = 10
c = a + b * 2
```
What is `c`?
<<<<<<< HEAD
=======
30
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

7.
```
a = 5
b = 10
c = a
a = b
```
What is `c`?
<<<<<<< HEAD
What is `a`?
=======
5
What is `a`?
10
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

8.
```
a = 5
b = 10
a = b
b = a
```
What is `b`?
<<<<<<< HEAD
=======
10
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

9.
```
a = 5
b = 10
a = b
b = a + b
```
What is `b`?
<<<<<<< HEAD
=======
20
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

10.
```
a = "a"
b = "b"
b.upcase!
a = b
```
What is `a`?
<<<<<<< HEAD
=======
B
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

11.
```
a = "a"
b = "b"
a.upcase!
b = a
a.downcase!
```
What is `a`? What is `b`?
<<<<<<< HEAD
=======
a, a
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

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
<<<<<<< HEAD
=======
bb
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

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
<<<<<<< HEAD
=======
10Bcc
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

14.
```
a = 10
b = "b"
a = b
b = b.upcase
c = b
```
What is `a`? What is `c`?
<<<<<<< HEAD
=======
"b", "B"
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

15.
```
a = 10
b = "5"
<<<<<<< HEAD
c = a.to_s + b
a = "A"
b = b.to_i
a = a.downcase + a + c
d = b + c.to_i
b = d.to_s + a.upcase!
```
What are `a`, `b`, `c`, and `d`?
=======
c = a.to_s + b 105
a = "A"
b = b.to_i 5
a = a.downcase + a + c "aA105"
d = b + c.to_i 110
b = d.to_s + a.upcase! 110AA105
```
What are `a`, `b`, `c`, and `d`?
"AA105"
"110AA105"
"105"
110
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab
