## Test-Driven Development

#### Concepts
- Contrast the agile and waterfall approaches to developing software
- Explain what TDD is and its benefits. Compare it to "cowboy coding."
- Explain what a Unit Test is
- Explain what RSpec is

#### Mechanics
- Read Rspec tests that have already been written for a Ruby program and make them pass one at a time
- Set up a Ruby program with RSpec
- Set up RSpec tests using
  - `describe`
  - `it`
- Write tests using expectations
  - `to` and `not_to`
  - `eq`, `eql`, `equal`
  - `be_true`, `be_false`
- DRY up Rspec tests using
  - `let`
  - `subject`
  - `context`
  - `before`


CDHW function
Hashes vs Objects?
What is OOP? Grouping together data and behavior

##### Scrabble ~1 hour

### What is testing?
  - Check to make sure our code works in an automated way
  - It's also code!

### Who does it?
  - QA engineers at the end?
  - Programmers while they are programming as part of the development process?
  - What do you think are the pros and cons?

### Agile software development
  - iterative and incremental vs. all up front
  - Waterfall & BUFD
  - allows developers to take advantage of what is learned as they build
  - emergent design -> test driven development vs long QA process

### Why TDD?

##### More Obvious
  - regression tests
  - faster feedback loop to verify functionality (vs trial error/manual tests)
  - piece of mind
  - work as really good documentation

##### Less Obvious
  - help to focus thinking and design - one thing at a time
  - can reveal messy/hacky solutions
  - BDD: focus on behavior, better code
  - SEEMS slower but actually makes you faster. why?
  - Applicable to life! Think about how we are teaching.

### Framing
  - Today we are focusing mostly on getting used to the RSpec syntax
  - The BDD stuff and how it helps your design will come Thursday
  - Testing Behavior and not implementation
  - We're starting with more trivial examples so you can get used to the syntax

### Rspec
  - Rspec is a DSL (it is Ruby, but sepcific language/methods for testing)
  - It is a gem. What is a gem again?

##### Light example ~ 30 mins
- lib, spec
- `rspec --init`
- `require_relative`
- `spec_helper`
- red, green, refactor
- write as little as possible to make the test pass!
- Error-driven development
- describe (for classes and methods)
- it (for individual tests)

##### Rspec Calculator ~ 1 hour

##### Fortune Cookies ~ 1 hour
- rspec cheatsheet
  https://www.anchor.com.au/wp-content/uploads/rspec_cheatsheet_attributed.pdf
- let
- context

##### Rock, Paper, Scissors?
##### Bank?
##### Pig Latin?
##### Bowling? http://www.peterprovost.org/blog/2012/05/02/kata-the-only-way-to-learn-tdd#the-bowling-game-kata
