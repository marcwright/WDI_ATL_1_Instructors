#TDD - Exercise #2
##Missing Numbers

A function accepts two arrays of integers.

Find the missing numbers:

- If a number occurs multiple times in the lists, you must ensure that the frequency of that number in both the lists is the same. If that is not the case, then it is also a missing number
- You have to print all the missing numbers in ascending order
- Print each missing number once, even if it is missing multiple times

Array A has these integers:

    203, 204, 205, 206, 207, 208, 203, 204, 205, 206
    
Array B contains these integers:

    203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 205, 206, 204
    
The expected return value:

    [204,205,206]
    
204 is present in both the arrays. Its frequency in A is 2, while its frequency in B is 3. Similarly, 205 and 206 occur twice in A, but three times in B. 