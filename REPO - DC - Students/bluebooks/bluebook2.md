## Question 1

Explain what inheritance is and how/when it can benefit us

#### Example 1

Inheritance is using an abstracted class in order to set a template or a boilerplate for the more specific classes below it. It allows you to not have to repeat  yourself if two classes have fundamental aspects in common and can inherit from the same abstraction.

#### Example 2

Inheritance is used in classes & sub-classes; it helps us keep our code DRY because we don't need to repeat things that the subclasses have in common with their parent class.

## Question 2

Explain what BDD/TDD is and its benefits. Compare it to "cowboy coding."

#### Example 1

"TDD is test-driven development.
BDD is behavior-driven development.

They are both ways to build software with a test-first mentality.  This can help increase the quality of the software as well as force the developers to think about what the product requirements are first, before building the product.

Cowboy coding is the antithesis of BDD/TDD, where developers code and test afterwards (or don't test at all)."

#### Example 2

Behavior Driven Development/Test Driven Development is the process of writing out tests for behavior of code before developing the code itself.  Writing out expectations for each part of an application forces the developer into planning and thinking out each part of the app.  Rushing to build out functionality of an app ("Cowboy Coding") is more likely to send the developer down blind alleys than it is to result in a well-constructed app.

## Question 3

![](http://f.cl.ly/items/360s2J0b3E2P0Z3F362t/nfl_spec.png)

Explain what lines 4, 7, 9 and 11 do for the spec above

#### Example 1

"Line 4: This line begins the testing phase for the Team class as a whole. This means that everything tested below it will be tested as a part of this class.

Line 7: This begins the specific testing for an instance method within the Team class. The specific method 'draft' will have certain expectations it will need to fulfill on a specific instance of the Team class.

Line 9: This line writes out semantically what we expect our method being tested to do when called upon. This is useful for when we write our method so we can know exactly what we are expecting it to do in English.

Line 11: This line is an actual test on the behavior of the 'draft' instance method. Every method has the possibility of doing a number of things, in a number of contexts, and each of these thing and contexts need to be tested individually. This is done to ensure that the method can perform all of its responsibilities correctly and that instituting one behavior doesn't break another. This line specifically looks to see if the result from using this method meets the expectations laid out in out test."

#### Example 2

4. Establishes a test for a new class called 'Team'.

7. Describes an instance method within the Team class.

9. Semantic phrase which describes the desired functionality of a test (lines 10 & 11).

11. This code explicitly tests for the ability for a method to successfully manipulate data.

## Question 4

List the entities and relationships involved if you were to model the HappiTails Animal Shelter

#### Example 1

Entities:
* Shelter class
* Client class
* Animal class

Relationships:
* A shelter has many clients
* A shelter has many animals
* A client has many animals
* An animal belongs to a shelter or client
* A client belongs to a shelter"

#### Example 2

Entities:  shelter, animals, clients

* The shelter has many animals
* The shelter has many clients
* One animal has one shelter, or one client (owner)
* Clients have zero to many pets

## Question 5

Explain what a database is and why you would use one as opposed to other persistent storage mechanisms (specifically File I/O)

#### Example 1

A database is a Structured storage system that allows you to persist data in an organized way.  The benefit over File I/O is while searching for info within a DB you don't need to parse all information, but can grab specific info within.  Additionally, Databases include the added ACID functionality which guarantee transactions between sender and receiver.

#### Example 2

"Database enforces ACID, which has several principles.

At a high-level ACID states that

1. data transactions should only be committed when every related transaction has gone through.
2. all data transactions should be validated consistently with the same rules
3. data should always be available once committed"