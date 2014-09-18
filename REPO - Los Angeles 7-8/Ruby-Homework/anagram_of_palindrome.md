A string is a palindrome if it has exactly the same sequence of characters when read left-to-right as it has when read right-to-left. For example, the following strings are palindromes:

- "kayak"
- "anna"
- "neveroddoreven"

A string is an anagram of a string B if A can be obtained from B by rearranging the characters. For example, in each of the following pairs one string is an anagram of the other:

- "mary" and "army"
- "rocketboys" and "octobersky"
- "hogwarts" and "hogwarts"

Write a function:

    def solution(s)

that, given a non-empty string s consisting of N characters, returns 1 if s is an anagram of some palindrome and returns 0 otherwise.

Assume that:
- N is an integer within the range [1..100,000]
- string s consists only of lower-case letters (a-z)

For example, given s = "dooernedeevrvn", the function should return 1, because "dooernedeevrvn" is an anagram of the palindrome "neveroddoreven". Given s = "aabcba", the function should return 0.

