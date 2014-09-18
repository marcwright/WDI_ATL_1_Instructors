# Arrays (45mins)

- What are arrays?
  "an arrangement of items at equally spaced addresses in computer memory"

- In irb
  a = [1, 2, 3, 4]
  a
  a.size
  a.first
  a.last
  a[0]
  a[-1]

- Nested arrays
  a = [1, 2, 3, 4, [5, 6, 7]]
  - how many elements in the array?
  - how to access the nested array?
  - .flatten
  
- Manipulating arrays
  a.push
  a.pop
  a.shift
  a.unshift
  a[1] = 10
  a + [11, 12, 13]
  [1, 2, 3] | [3, 4, 5]
  
- Making Arrays
  []
  Array.new
  "The quick brown fox jumped over the lazy dog".split
  %w(the quick brown fox jumped over the lazy dog)
  # .split takes a parameter of a match to split on
  "The quick brown fox jumped over the lazy dog".split('') # eek!
  
- Handy array methods
  - .any? .all? .none? .include? .join
  - .flatten .compact .uniq  
  - .max .min
