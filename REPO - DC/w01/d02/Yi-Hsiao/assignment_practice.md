1.
```ruby
a = 5
a = 6
a == 6
=> true
```
What is `a`?

2.
```ruby
a = 5
a + 2
a == 5
=> true
```
What is `a`?

3.
```ruby
a = 5
b = 7
a = b + 2
b == 7
=> true
```
What is `b`?

4.
```ruby
a = 5
b = 10
c = a + b
c == 15
=> true
```
What is `c`?

5.
```ruby
a = 5
a = a + 2
a == 7
=> true
```
What is `a`?

6.
```ruby
a = 5
b = 10
c = a + b * 2
c == 25
=> true
```
What is `c`?

7.
```ruby
a = 5
b = 10
c = a
a = b
c == 5 && a == 10
=> true
```
What is `c`?
What is `a`?

8.
```ruby
a = 5
b = 10
a = b
b = a
b == 10
=> true
```
What is `b`?

9.
```ruby
a = 5
b = 10
a = b
b = a + b
b == 20
=> true
```
What is `b`?

10.
```ruby
a = "a"
b = "b"
b.upcase!
a = b
a == "B"
=> true
```
What is `a`?

11.
```ruby
a = "a"     
b = "b"     
a.upcase!   # a = "A"
b = a       # b = "A"
a.downcase! # a, b = "a", "a"
a == "a" && b == "a"
=> true
```
What is `a`? What is `b`?

12.
```ruby
a = "a"
b = "b"
b.upcase!   # b = "B"
a = b       # a = "B"
b.downcase! # a, b = "b", "b"
c = a + b   # c = "bb"
c == "bb"
=> true
```
What is `c`?

13.
```ruby
a = 10
b = "b"
c = "c"
a = a + b.to_i     # a = 10
b.upcase!          # b = "B"
b = b + c          # b = "Bc"
d = a.to_s + b + c
d == "10Bcc"
=> true
```
What is `d`?

14.
```ruby
a = 10
b = "b"
a = b        # a = "b"
b = b.upcase # b = "B"
c = b
a == "b" && c == "B"
=> true
```
What is `a`? What is `c`?

15.
```ruby
a = 10
b = "5"
c = a.to_s + b         # c = "105"
a = "A"                # a = "A"
b = b.to_i             # b = 5
a = a.downcase + a + c # a = "aA105"
d = b + c.to_i         # d = 110
b = d.to_s + a.upcase! # a, b = "AA105", "110AA105"
a == "AA105" && b == "110AA105" && c == "105" && d == 110
=> true
```
What are `a`, `b`, `c`, and `d`?
