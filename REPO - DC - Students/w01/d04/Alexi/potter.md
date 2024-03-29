# Book 8: Harry Potter and the Comma-Separated Value

Included is a `potter.csv` file with a bunch of Harry Potter data. Each line contains the number of times a certain character was mentioned in the Harry Potter series, along with their name and---in some cases---the house they are associated with. Your job will be to slice and dice the data in a variety of ways using File I/O, Arrays & Hashes, Enumeration, and String Manipulation.

### Learning Objectives:

* Practice thinking about how to structure data
* Get some exposure to File I/O in Ruby by grabbing data from the `potter.csv` file.

Write a method that does each of the following:

1. Return an array with just the names of all the characters
* Return an array with all the characters with more than 500 mentions. Each entry in the array should contain all information about that character. (ie `{:mentions=>18956, :name=>"Harry Potter", :house=>"Gryffindor"}`)
* Return an array with the names of all the houses. `["Gryffindor", "Slytherin", "Ravenclaw", "Hufflepuff"]`
* Return an array with all the characters with one word names. Each entry in the array should contain all information about that character. (ie `{:mentions=>1797, :name=>"Voldemort", :house=>"Slytherin"}`)
* Return the number of characters from Hufflepuff (Hint: It should be 3)
* Return an array with all of the character names, but for the characters from Slytherin, reverse their names (ie "Draco Malfoy" becomes "yoflaM ocarD")
* Return an array with the unique last names of all the characters from Gryffindor (ie, print Weasley only 1 one time)
* Return an array with the names of all the Weasleys, but give each of them a middle name of "Badger"
* Return an array with the first names of characters whose first names end in "y"

### Bonus

* Return an array with all of the characters' names whose name contains "ll" somewhere
* Return an array with all of the characters' names whose name contains multiple k's
* Return an array with all of the characters whose first name begins with the same letter as their last name, sorted alphabetically (ie "Bathilda Bagshot". Note: "Nearly Headless Nick" counts here!)

### Tips:
* Try to minimize your use of ".each". In most of these cases, there will be another enumerable method that will be a better tool for the job!
* Ruby Docs for Array, String, and Enumerable are you friend!

---
###### Written by Peter Lai
