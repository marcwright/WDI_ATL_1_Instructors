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

11.
=======
What is `a`? B

11.*
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab
```
a = "a"
b = "b"
a.upcase!
b = a
a.downcase!
```
<<<<<<< HEAD
What is `a`? What is `b`?

12.
=======
What is `a`? What is `b`? 
'a' = a
'b' = a

12.*
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab
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

13.
=======
What is `c`? bb

13.*
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab
```
a = 10
b = "b"
c = "c"
<<<<<<< HEAD
a = a + b.to_i
b.upcase!
b = b + c
d = a.to_s + b + c
```
What is `d`?

14.
=======
a = a + b.to_i ==> 10
b.upcase! ==> B
b = b + c ==> Bc
d = a.to_s + b + c
```
What is `d`? "10Bcc"

14.*
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab
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
'a' = b
'c' = b
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
c = a.to_s + b = "105"
a = "A"
b = b.to_i = 5
a = a.downcase + a + c = "aA105"
d = b + c.to_i = 110
b = d.to_s + a.upcase! = "110AA105"
```
What are `a`, `b`, `c`, and `d`?
'a' = "A"
'b' = "110AA105"
'c' = "105"
'd' = 110
>>>>>>> 878719316f647e3b7ed71f9a602e4c01443583ab
