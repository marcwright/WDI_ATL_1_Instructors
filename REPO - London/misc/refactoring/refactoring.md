https://github.com/Pavling/wdi-w10d1-refactoring

> Notes drawn from the "Refactoring - Ruby Edition" book... buy it if you buy nothing else.


# Refactoring

The first thing to say about this is that the word refactoring has two definitions depending on context. You might find this annoying (I certainly do), but it serves as yet another example of the realities of working with natural language.
The first definition is the noun form.

> Refactoring (noun): A change made to the internal structure of software to make it easier to understand and cheaper to modify with- out changing its observable behavior.

> Refactor (verb): To restructure software by applying a series of refactorings without changing its observable behavior.

So you might spend a few hours refactoring, during which you might apply a couple of dozen individual refactorings.

## Is refactoring just cleaning up code?
In a way the answer is yes, but refactoring goes further because it provides a technique for cleaning up code in a more efficient and controlled manner.

The biggest thing I want to highlight is that refactoring does not change the observable behavior of the software. The software still carries out the same function that it did before. Any user, whether an end user or another programmer, cannot tell that things have changed.

# The Two Hats
When you use refactoring to develop software, you divide your time between two distinct activities: adding function and refactoring.

- When you add function, you shouldn't be changing existing code; you are just adding new capabilities. You can measure your progress by adding tests and getting the tests to work.
- When you refactor, you make a point of not adding function; you only restructure the code. You don't add any tests (unless you find a case you missed earlier); you only restructure the code. Additionally, you only change tests when you absolutely need to in order to cope with a change in an interface.

As you develop software, you probably find yourself swapping hats frequently. You start by trying to add a new function, and you realize this would be much easier if the code were structured differently. So you swap hats and refactor for a while. Once the code is better structured, you swap hats and add the new function. Once you get the new function working, you realize you coded it in a way that's awkward to understand, so you swap hats again and refactor. All this might take only ten minutes, but during this time you should always be aware of which hat you're wearing.



# Why Should You Refactor?

- Refactoring Improves the Design of Software
- Refactoring Makes Software Easier to Understand
- Refactoring Helps You Find Bugs
- Refactoring Helps You Program Faster


# When Should You Refactor?

- Refactor the third time you do something
- Refactor When You Add Function
- Refactor When You Need to Fix a Bug
- Refactor As You Do a Code Review
- Refactoring for Greater Understanding (aka, Refactor to the Same Thing)

# Why Refactoring Works

- Programs that are hard to read are hard to modify.
- Programs that have duplicated logic are hard to modify.
- Programs that require additional behavior that requires you to change running code are hard to modify.
- Programs with complex conditional logic are hard to modify.

# What Do I Tell My Manager's

- If the manager is technically savvy, introducing the subject may not be that hard.
- If the manager is genuinely quality oriented, then the thing to stress is the quality aspect.

Of course, many managers say they are driven by quality but are more driven by schedule. In these cases - more controversially - Don't tell!
- A schedule- driven manager wants me to do things the fastest way I can; how I do it is my business. The fastest way is to refactor; therefore I refactor.


# An example of refactoring.

If we pick a large program, describing it and how it is refactored is too complicated for a lesson (even the simple one is going to take half-a-day).
However, with a program that is small enough to be comprehensible, refactoring does not look like it is worthwhile.

Frankly it is not worth the effort to do the refactoring that I'm going to show you on a small program like the one I'm going to use. But if the code I'm showing you is part of a larger system, then the refactoring soon becomes important. So I have to ask you to look at this and imagine it in the context of a much larger system.

## Starting point
The sample program is simple. It is a program to calculate and print a statement of a customer's charges at a video store. The program is told which movies a customer rented and for how long. It then calculates the charges, which depend on how long the movie is rented, and identifies the type of movie. There are three kinds of movies: regular, children's, and new releases. In addition to calculating charges, the statement also computes frequent renter points, which vary depending on whether the film is a new release.
Several classes represent various video elements. 


### Movie
Movie is just a simple data class.

### Rental
The rental class represents a customer renting a movie.

### Customer
The customer class represents the customer of the store. Like the other classes it has data and accessors.

Customer also has the method that produces a statement.


## Comments on the Starting Program
What are your impressions about the design of this program?

- not well designed
- certainly not object oriented.

For a simple program like this, that does not really matter.

Quick and dirty simple programs can be okay.
But as a representative fragment of a more complex system, then I have some real problems.
- That long statement routine in the Customer class does far too much. Many of the things that it does should really be done by the other classes.

But, the program works.
- Is my criticism just an aesthetic judgment, a dislike of ugly code?

Yes - It is... until we want to change the system.
The interpreter doesn't care whether the code is ugly or clean. But when we change the system, there is a human involved, and humans do care.

A poorly designed system is hard to change.
- hard to figure out where the changes are needed.
- and if it is hard to figure out what to change, there is a strong chance that the programmer will make a mistake and introduce bugs.

# Requirements
In this case we have a couple of changes that the users would like to make.

First they want a statement printed in HTML so that the statement can be Web enabled and more buzzword compliant.

Consider the impact this change would have. As you look at the code you can see that it is impossible to reuse any of the behavior of the current statement method for an HTML statement. Your only recourse is to write a whole new method that duplicates much of the behavior of statement. Now, of course, this is not too onerous. You can just copy the state- ment method and make whatever changes you need.

But what happens when the charging rules change? You have to fix both statement and html_statement and ensure the fixes are consistent. The problem with copying and pasting code comes when you have to change it later. If you are writing a program that you don't expect to change, then cut and paste is fine. If the program is long lived and likely to change, then cut and paste is a menace.

The second change is that the users want to make changes to the way they classify movies, but they haven't yet decided on the change they are going to make.

They have a number of changes in mind.
These changes will affect both the way renters are charged for movies and the way that frequent renter points are calculated.

As an experienced developer you are sure that whatever scheme the users come up with, the only guarantee you're going to have is that they will change it again within six months.

The statement method is where the changes have to be made to deal with changes in classification and charging rules. If, however, we copy the statement to an HTML statement, we need to ensure that any changes are completely consistent. Furthermore, as the rules grow in complexity it's going to be harder to figure out where to make the changes and harder to make them without making a mistake.

You may be tempted to make the fewest possible changes to the program; after all, it works fine. Remember the old engineering adage: “if it ain't broke, don't fix it.” The program may not be broken, but it does hurt. It is making your life more difficult because you find it hard to make the changes your users want. This is where refactoring comes in.

### Tip
When you find you have to add a feature to a program, and the program's code is not structured in a convenient way to add the feature, first refactor the program to make it easy to add the feature, then add the feature.



