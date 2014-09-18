## Intro to Enumerations

#### Learning Objectives

* What is an Enumerable?
* What is Enumeration?
* What are common enumeration methods?

---

#### Enumerables are…

* Arrays: ["a", "b", "c"]
* Hashes: {a: true, b: true, c: false}


#### Syntaxes…

Block:  

```
array.each do |i|
	puts i
end
```

Inline:  

```
array.each { |i| puts i }
```

#### Common enumeration methods

**Arrays**

* array.each
* array.map
* array.select
* array.reject
* array.each_index
* array.each_with_index
* array.max

**Hashes**

* hash.each
* hash.each_pair
* hash.select
* hash.reject

#### Bang! Methods

* array.shuffle
* array.shuffle!

```
the_array = [1, 2, 3, 4, 5]

puts "\nShuffled: "+ the_array.shuffle.join(', ')
puts "After shuffle: "+ the_array.join(', ')

puts "\nShuffled!: "+ the_array.shuffle!.join(', ')
puts "After shuffle!: "+ the_array.join(', ')
```