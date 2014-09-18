Outline: Basic computer science concepts - data types & binary numbers Algorithms - why & how to pick the best ones

Labs: 1. Write a binary number converter 2. Use Ruby benchmarking tool to refactor some badly written code (maybe Euler solutions?) http://www.ruby-doc.org/stdlib-1.9.3/libdoc/benchmark/rdoc/Benchmark.html

Lecture Notes:

Part I

Data Types & Binary Numbers:

Data types: (from Wikipedia) In computer science and computer programming, a data type or simply type is a classification identifying one of various types of data, such as real-valued, integer or Boolean, that determines the possible values for that type; the operations that can be done on values of that type; the meaning of the data; and the way values of that type can be stored.

Loosely vs/ strongly typed languages and the implications: Some programmers refer to a language as "weakly typed" if simple operations do not behave in a way that they would expect. For example, consider the following program:

x = "5" + 6

Different languages will assign a different value to 'x': One language might convert 6 to a string, and concatenate the two arguments to produce the string "56". Another language might convert "5" to a number, and add the two arguments to produce the number 11. Yet another language might convert the string "5" to a pointer representing where the string is stored within memory, and add 6 to that value to produce a semi-random address. Yet another language might simply fail to compile this program, saying that the two operands have incompatible type.

Languages that work like the first three examples have all been called "weakly typed" at various times, even though only one of them (the third) represents a safety violation. Java and Ruby are considered "strongly typed", though Java programs with type violations will not compile whereas Ruby programs won't throw an error until runtime. JavaScript is considered "weakly typed".

more at http://en.wikipedia.org/wiki/Strong_and_weak_typing

Interpreted vs compiled languages and the implications: Interpreted languages aka "scripts" do not need to be compiled, e.g. JavaScript, Perl and Ruby. Compiled languages need to be compiled to run, Java, C, C++, etc.

Binary, hexadecimal and decimal numbers: Why binary and hexadecimal numbers are so prevalent in computers (as opposed to decimal) Binary system is used by computers because they are based on electrical circuits, 0 = "off", 1 = "on" Hexadecimal system is base 16, which maps nicely to binary mathematically speaking as it is based on powers of 2. For a complete explanation:

http://www.codemastershawn.com/library/tutorial/hex.bin.numbers.php

Part II

Analysis of Algorithms:

An algorithm is basically a set of instructions for solving a problem. The runtime of an algorithm can be measured as a function. The best algorithms will do the job most efficiently. So, as a data set grows it will tend towards a worst-case scenario. f(n) represents the function and t(n) the time in: t(n) = O f(n)

Put in more simple terms, the runtime of a program is affected by things such as loops, nested loops, consecutive statements, if/else statements, common array methods (accessing, inserting, removing). All of these will cause the f(n) curve to have a different shape as n grows large.

The Master Theorem is used to analyze running time of algorithms mathematically. You can learn more about it here: http://en.wikipedia.org/wiki/Master_theorem

Common complexities and graphs of how they grow: This example is a bit outdated as most of you have probably never used a phone book. Imagine a huuuuuge book full of names and phone numbers. If you have searched through one often, you will intuitively use the most efficient search method, which is to open the book up towards the center and this immediately splits your search field in half. Then recursively search through smaller and smaller sets of data until you find what you're looking for. This describes the Binary Search algorithm.

O(1): Constant. Example: Look on page 5 in the phone book to find what you’re looking for (Hash table) This is really the best possible outcome - why Hashes are one of the most commonly used data structures. They are faster than trees and most other data structures for the most common tasks (search, delete, etc.)

O(logn): Log. Example Do a binary search on the phone book to find what you’re looking for. To be more precise, O(log n) basically means time goes up linearly while the n goes up exponentially. So if it takes 1 second to compute 10 elements, it will take 2 seconds to compute 100 elements, 3 seconds to compute 1000 elements, and so on. This is means our algorithm is pretty fast as n gets large.

O(n): Linear. Example: Look through each page, starting with page 1, in the phone book to find what you’re looking for. If you are looking for something on the last page, this is a terrible idea.

O(nlogn). Example: All the names in a phone book are out of order, sort them

O(n^2): Quadratic. Example: For every name in the phone book, look through the entire phone book starting at page 1 to see how many people have the same name

O(2^n): Exponential. Example (not relating to phone books): Test all possible combinations of a password

See this page: http://en.wikipedia.org/wiki/Best,_worst_and_average_case for a table breaking down the best, average and worst case for the most common data structures and sorting algorithms.

Use Benchmarking in Ruby to verify performance http://ruby-prof.rubyforge.org/ LAB: Refactor some poorly written / slow ruby code to reduce the time complexity / runtime.