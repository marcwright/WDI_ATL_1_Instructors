## Self-Improvement Homework

#####Step 1:
Review your self-assessment from last week. If you haven't filled it out yet, do so. This is mandatory.

#####Step 2:
Target 10 concepts or mechanics you feel unsure of, and write them into the numbered list below.

#####Step 3:
Research all of the items you listed, and write in either an explanation (if the item is a concept), or the necessary code snippet (if the item is a mechanical question).


1.uniq - Returns a new array by removing duplicate values in self.
			[array with some duplicate values].uniq --> 
			new rray with duplicate values removed

2.flatten - Returns a new array that is a one-dimensional 			flattening of self (recursively).

			That is, for every element that is an array, extract its 			elements into the new array.

3.map!- 	map! {|item| block } → new arry 
		
			Invokes the given block once for each element of self, 			REPLACING THE ACTUAL ELEMENTS  with the value returned by the 			block.	
	
4.reduce - # Sum some numbers
			(5..10).reduce(:+)                             #=> 45
			
			reduce { |memo, obj| block } → obj
			
			Multiply some numbers
		(5..10).reduce(1, :*)                          #=> 151200
		
			Combines all elements of enum by applying a binary 			operation, specified by a block or a symbol that names a 			method or operator.

			If you specify a block, then for each element in enum 			the block is passed an accumulator value (memo) and the 			element. If you specify a symbol instead, then each 			element in the collection will be passed to the named 			method of memo. In either case, the result becomes the 			new value for memo. At the end of the iteration, the 			final value of memo is the return value for the method.



5.inject - does about the same thing as 'reduce'

			# Same using a block and inject
			(5..10).inject { |sum, n| sum + n }            #=> 45

6. reject - reject { |obj| block } → array 
		
		(makes a LIST of rejects essentially)
		
		Returns an array for all elements of enum for which the 		given block returns false.

		If no block is given, an Enumerator is returned instead.

(1..10).reject { |i|  i % 3 == 0 }   #=>   [1, 2, 4, 5, 7, 8, 10]

[1, 2, 3, 4, 5].reject { |num| num.even? } #=>        [1, 3, 5]

7. select - select { |obj| block } → array 

	does the opposite of reject - selects only what you want.

		select → an_enumerator
		Returns an array containing all elements of enum for which 		the given block returns a true value.

8.to_a  - to an array:

to_a(*args) → array 
Returns an array containing the items in enum.

for example:

(1..7).to_a                       #=> [1, 2, 3, 4, 5, 6, 7]
{ 'a'=>1, 'b'=>2, 'c'=>3 }.to_a   #=> [["a", 1], ["b", 2], ["c", 3]]

sort of 'breaking apart' come hash/key pairs?


9.grep -   grep(pattern) → array 

grep(pattern) { |obj| block } → array

Returns an array of every element in enum for which Pattern === element. If the optional block is supplied, each matching element is passed to it, and the block’s result is stored in the output array.

(1..100).grep 38..44   #=> [38, 39, 40, 41, 42, 43, 44]
c = IO.constants
c.grep(/SEEK/)         #=> [:SEEK_SET, :SEEK_CUR, :SEEK_END]



10.include - include?(obj) → true or false 

Returns true if any member of enum equals obj. Equality is tested using ==.

IO.constants.include? :SEEK_SET          #=> true
IO.constants.include? :SEEK_NO_FURTHER   #=> false

UNCLEAR how the above examples can be applied.

like this? :

names = [array of names, "ben", "nick", "joe" etc]
names.include?("nick")==> true
YUP! this is what it does!




