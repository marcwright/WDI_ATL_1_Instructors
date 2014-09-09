## Learning Objectives:

#### Concepts
- Articulate an approach to learning a new library
- Explain what an ORM is and why we use it (vs. straight sql)
- Explain what ActiveRecord is
- Explain the basic idea of metaprogramming and how AR leverages this to provide an interface to the DB
- Predict the SQL commands that will be issued during particular AR method calls
- Explain how we use AR to manage relationships
- Explain the use and usefulness of AR validations and how they affect persistence
- Compare and contrast SQL constraints with AR Validations

#### Mechanics
- Use ActiveRecord commands:
  - new
  - save
  - create
  - all
  - find
  - find_by
  - where
  - update
  - delete vs destroy
- Set up an ActiveRecord Association for a one-to-many relationship
- Set up an ActiveRecord Association for a many-to-many relationship
- Set up the following validations
  - presence
  - uniqueness

Framing:

Libraries. Common solutions to common problems. Teach you how to learn - can you pick up the concepts and mechanics of a new library?

Strategy:

- Conceptual overview - ie what is this thing?!
- Install the library and follow setup instructions (so you can try out examples)
- Examples
- API details


#### Conceptual Overview

*Activity [Individual, Think-Pair-Share]*

- Read http://edgeguides.rubyonrails.org/active_record_basics.html [Sec. 1-3]
- Share out: someone to explain each section.

- What does ActiveRecord do? 
  - What problem does it solve?
  - How does it solve it?

Interface between our code and our datastore is very porous. Writing SQL out in our code can be a liability:
* Our code becomes tightly coupled to the implementation of our database
* Verbose - obscures our intentions with oodles of text
* We want to focus on what our application does - NOT the implementation details of our storage system

#### Installing it

* gem install activerecord
* Walk through setup and including it.

- Follow the docs [Section 5,6] and try to persist a Musical to the database
- How do we know it worked?
- Are there multiple ways to do this?
- Seed file


- READ http://edgeguides.rubyonrails.org/active_record_querying.html
- http://api.rubyonrails.org/classes/ActiveRecord/FinderMethods.html

- Explore options to read, update and delete:
  * Return all musicals
  * Find the first musical in the database
  * Find a musical by it's title
  * Find all musicals composed by Richard Rodgers
  * Order the musicals by year
  * Find all musicals more recent than 1980
  * Return a list of just the titles of the musicals


  * Musical.all
  * Musical.first
  * Musical.find_by(title: "Wicked")
  * Musical.where(composer: "Richard Rodgers")
  * Musical.order(:year)
  * Musical.where("year > 1980")
  * Musical.pluck(:title)

* ::new
* ::find
* ::where
* #save
* #attributes

* Class vs Instance methods. Why?

* Module
  * Namespace
  * not instantiable
  * Group together methods / classes that don't fit into inheritance chain
  * Borrowable
  * Multiple Inheritance

- Make a Musicals DB with CRUD
- Make a Game of Thrones Character DB with CRUD
- Refactor Superhero DB using AR


::where
::order
::limit

#### Associations

Activity [Individual]:

- Read http://edgeguides.rubyonrails.org/association_basics.html [Sec. 1, 2, 2.1 - 2.3]

Activity [Code Together]:

- Musicals, Songs

- dependent: :destroy

Lab:

- Books, Authors
- Fridge Management App