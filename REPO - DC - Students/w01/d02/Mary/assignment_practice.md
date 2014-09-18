1.
```
a = 5
a = 6
```
<<<<<<< HEAD
What is `a`?
=======
What is `a`? 6
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

2.
```
a = 5
a + 2
```
<<<<<<< HEAD
What is `a`?
=======
What is `a`? 5
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

3.
```
a = 5
b = 7
a = b + 2
```
<<<<<<< HEAD
What is `b`?
=======
What is `b`? 7
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

4.
```
a = 5
b = 10
c = a + b
```
<<<<<<< HEAD
What is `c`?
=======
What is `c`? 15
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

5.
```
a = 5
a = a + 2
```
<<<<<<< HEAD
What is `a`?
=======
What is `a`? 7
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

6.
```
a = 5
b = 10
c = a + b * 2
```
<<<<<<< HEAD
What is `c`?
=======
What is `c`? 25
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

7.
```
a = 5
b = 10
c = a
a = b
```
<<<<<<< HEAD
What is `c`?
What is `a`?
=======
What is `c`? 5
What is `a`? 10
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

8.
```
a = 5
b = 10
a = b
b = a
```
<<<<<<< HEAD
What is `b`?
=======
What is `b`? 10
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

9.
```
a = 5
b = 10
a = b
b = a + b
```
<<<<<<< HEAD
What is `b`?
=======
What is `b`? 20
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

10.
```
a = "a"
b = "b"
b.upcase!
a = b
```
<<<<<<< HEAD
What is `a`?
=======
What is `a`? "B"
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

11.
```
a = "a"
b = "b"
a.upcase!
b = a
a.downcase!
```
<<<<<<< HEAD
What is `a`? What is `b`?
=======
What is `a`? "a"
What is `b`? "a"
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
<<<<<<< HEAD
What is `c`?
=======
What is `c`? "bb"
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
<<<<<<< HEAD
What is `d`?
=======
What is `d`? "10Bcc"
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

14.
```
a = 10
b = "b"
a = b
b = b.upcase
c = b
```
<<<<<<< HEAD
What is `a`? What is `c`?
=======
What is `a`? "b"
What is `c`? "B"
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

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
<<<<<<< HEAD
What are `a`, `b`, `c`, and `d`?
=======
What are `a`, `b`, `c`, and `d`?
a = "AA105"
b = "110AA105"
c = "105"
d = 110
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab
