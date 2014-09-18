Two non-negative integers are called *siblings* if they can be obtained from each other by rearranging the digits of their decimal representations. For example, 123 and 213 are siblings. 535 and 355 are also siblings.

A set consisting of non-negative integer **n** and all of its siblings is called the *family* of **n**. For example, the family of 553 comprises three numbers: 355, 535 and 553.

Write a function:

    def solution(n)
    
that, given a non-negative integer **n**, returns the largest number in the family of **n**. The function should return **-1** if the result exceeds 100,000,000. For example, given **n** = 213 the function should return 321. Given **n** = 553, the function should return 553.

Assume that:

- **n** is an integer within range [0..2,147,483,647]