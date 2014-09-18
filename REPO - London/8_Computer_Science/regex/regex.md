# Regular Expressions
[i]: c.45.minutes

Before we do this lesson, we're going to play a game ('Heads Up' on the iPad).

[i]: play the iPad "Heads Up" game - pick one student and have them at the front of the class. Maybe do two rounds for the craic...


## What are Regular Expressions

What is being done during this game is pattern matching. 

When you say to the player "It's a farm animal", they've reduced what they'll match from "All animals" to "Just farm animals".

- You've given them a pattern to match. They can compare an animal to that, and decide if it's included or not. 

Regular expressions are patterns for text. You use them to decide whether a bit of text matches a pattern. 

We've talked about regex before and seen it in action a couple of times - but the explaination of what it's doing has always been a bit of a hand-wavey deferment. Frequently we'll use the warning:

> Some people, when confronted with a problem, think 
> "I know, I'll use regular expressions." Now they have two problems. 

But, like any spice, used in moderation, regex can be very good.


## Online Regex Tools

Have a look at these two sites, they're very good places to try out Regex:

(Regex Pal)[http://regexpal.com/]
(Rubular)[http://rubular.com/]


## Using Regex

There are lots of strings we will need to check for pattern matches in. For instance:

- What does a phone number look like? 
- What does a URL look like? 
- What does a postcode look like? 
- What does a username look like? 
- What does an email address look like? 

Regex gives us tools to match strings:

Regex | Definition
------|-----------
[abc] | A single character of: a, b, or c
[^abc] | Any single character except: a, b, or c
[a-z] | Any single character in the range a-z
[a-zA-Z] | Any single character in the range a-z or A-Z
^ | Start of line
$ | End of line
\A | Start of string
\Z | End of string
. | Any single character
\s | Any whitespace character
\S | Any non-whitespace character
\d | Any digit
\D | Any non-digit
\w | Any word character (letter, number, underscore)
\W | Any non-word character
\b | Any word boundary
(...) | Capture everything enclosed
a\|b | a or b
a? | Zero or one of a
a* | Zero or more of a
a+ | One or more of a
a{3} | Exactly 3 of a
a{3,} | 3 or more of a
a{3,6} | Between 3 and 6 of a

[i]: Run through demoing some of the above regex syntax in Rubular/Regexpal
- Regular text
- Match any character
- Match 0 or 1 of the previous things
- Match 0 or many of the previous things
- Match 1 or more of the previous things
- Character classes
- Ranges
- Groups


## Games

[Regex golf](http://regex.alf.nu/)

[Regex crossword](http://regexcrossword.com/)


### Crossword Answers

URL                                                         | answer
------------------------------------------------------------|-------
http://regexcrossword.com/challenges/beginner/puzzles/1     | HELP
http://regexcrossword.com/challenges/beginner/puzzles/2     | BOBE
http://regexcrossword.com/challenges/beginner/puzzles/3     | OOOO
http://regexcrossword.com/challenges/beginner/puzzles/4     | **//
http://regexcrossword.com/challenges/beginner/puzzles/5     | 1984
http://regexcrossword.com/challenges/intermediate/puzzles/1 | ATOWEL
http://regexcrossword.com/challenges/intermediate/puzzles/2 | WALKER
http://regexcrossword.com/challenges/intermediate/puzzles/3 | FORTY-TWO
http://regexcrossword.com/challenges/intermediate/puzzles/4 | DONTPANIC
http://regexcrossword.com/challenges/intermediate/puzzles/5 | TURNOFFANDON
http://regexcrossword.com/challenges/experienced/puzzles/1  | FOODFITFORAKING
http://regexcrossword.com/challenges/experienced/puzzles/2  | 











