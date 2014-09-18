# Raindrops exercise - c.1hr 30mins

** DON"T MENTION FIZZBUZZ! **


We're going to look at how many ways there are to solve a single problem, and also to try to determine how we measure what's "best"

## Definitions of "best"
Ask the class for ideas how they would define 'good' code:

- Terse
- Clear/easy to understand
- Fast
- others? 

How do we measure these?

Some are subjective, some are measurable...


## Code Test

Frequently, we get asked to do "code tests" when we're interviewing for jobs. This is a variation on one (* **DON'T** mention 'fizzbuzz', as they may have done it, but might not notice that this is pretty much the same*).

Half-hour to complete a solution to this problem:


### Test description to share with students

Write a program that converts a number to a string, the contents of which depends on the number's prime factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.

#### Examples

  - 28's prime-factorization is 2, 2, 7.
    - In raindrop-speak, this would be a simple "Plong".
  - 1755 prime-factorization is 3, 3, 3, 5, 13.
    - In raindrop-speak, this would be a "PlingPlang".
  - The prime factors of 34 are 2 and 17.
    - Raindrop-speak doesn't know what to make of that,
      so it just goes with the straightforward "34".

#### Hint

Okay, the 'prime factorization' stuff is a red-herring. It's irrelivant that the numbers 3, 5, & 7 are primes - all that's important is whether they divide evenly into the given number. 

#### Source
http://exercism.io


## Benchmarking

Run through a couple of student solutions.

Talk about their relative merits in line with the measures the students suggested earlier.

Show how to benchmark code - look at the speed of their code to compare.

Demonstrate that the working code of mine is far slower, but is (most likely) far more maintainable - to add another two conditions, it's just a case of two more hash key/value pairs.

Then show the super-fast code in operation - it should be *much* faster than any of their solutions (unless they hard-coded results, which we should disqualify them for).

Ask if they can imagine what sort of thing I did: after allowing them to guess... tell them what I did was "cheat".

The fast code uses 'caching' - when the app first runs, it populates a hash with the answers for all of the values from 1-105. Then when asked for during the benchmarking, all that needs to happen is to look the values up in the hash. The trivial amount of time it takes to populate the hash (1/10,000th the time it displays in the benchmark, because it only gets done one once) is more than made up by the time saved when asking for the data.

[Is it worth the time?](http://xkcd.com/1205)





