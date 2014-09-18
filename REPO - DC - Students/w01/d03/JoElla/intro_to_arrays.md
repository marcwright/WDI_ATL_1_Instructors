## Intro to Arrays

#### Learning Objectives

* What are arrays?
* Why are they useful?
* Where would you use an array?
	
---

#### Arrays

colors = ['red', 'green', 'blue']

#### Access

* colors[0]
* colors[0..1]
* colors.index('green')

#### Assignment

* colors[2] = 'purple'
* colors[20] = 'yellow'

#### To and from strings

* arry = '1,2,3'.split(',')
* str = arry.join(',')

#### Basic methods
* array.length
* array.push (<<)
* array.pop
* array.unshift
* array.shift
* array.first
* array.last
* array.insert
* array.delete
* array.delete_at

#### Comparison

* [1, 2, 3] == [1, 2, 3]

#### Multi-dimensional arrays

* colors = [['red', 'pink'], ['green', 'teal'], ['blue', 'indigo']]
* colors[0][1]
* [['red', 'pink']] == [['red', 'pink']] >> true
* [['red', 'pink']] == [['red', 'blue']] >> false

#### Shared references

```
* a = [1, 2, 3]
* b = a
* b.push 4
* puts a.length
```

```
* a = [1, 2, 3]
* b = a.dup
* b.push 4
* puts a.length
```
