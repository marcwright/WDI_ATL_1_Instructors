1.
```
a = 5
a = 6
```
What is `a`?
<<<<<<< HEAD
=======
a is 6
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

2.
```
a = 5
a + 2
```
What is `a`?
<<<<<<< HEAD
=======
a is 5
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
b is 7
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
c is 15
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

5.
```
a = 5
a = a + 2
```
What is `a`?
<<<<<<< HEAD
=======
a is 7
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
c is 25
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab

7.
```
a = 5
b = 10
c = a
a = b
```
What is `c`?
What is `a`?
<<<<<<< HEAD
=======
c is 5
a is 10
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
b is 10
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
b is 20
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
a is "B"
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
a is 'a'
b is 'a'
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
c is "bb"
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
d is '10Bcc'
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
a is 'b'
c is 'B'
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
a is 'aA105'
b is 100AA105
c is '105'
d is 110
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab
