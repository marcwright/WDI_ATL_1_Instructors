## Intro to Big-O

#### Learning Objectives

* What is Big-O? (Computational Complexity)
* How is O-cost measured for data access?
* Why do we care?

---

#### Which of these is more efficient:

colors = ['red', 'green', 'blue']

**Front/Back modification:**

* colors.unshift 'magenta'
* colors.push 'magenta'

**Positional or by-value access:**

* g = colors[1]
* g = colors.index('green')

#### What is Big-O?
* Big O notation describes the performance or complexity of an algorithm or data access.

Big O specifically describes the worst-case scenario, and can be used to describe the execution time required or the space used (e.g. in memory or on disk) by an algorithm.

---

#### Comparing data accessors

* array = ['a', 'b', 'c']
* hash = {a: true, b: true, c: true}

##### hash[:a]  
*O(1)* ... direct memory access.

##### array.index('b')  
*O(n)* … where N is the length of the array.

##### nested loops
*O(n2)* … N-squared, where N is the length of the array.

```
array.each do |i|
	array.each do |j|
		puts "#{i}, #{j}"
	end
end
```