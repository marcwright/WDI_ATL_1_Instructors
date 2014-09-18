## More Databases & SQL

#### Concepts
- Describe what `pg` is
- Explain what a foreign key is and why you would use one
- Explain what a SQL join is and when you would use one

#### Mechanics
- Connect a Ruby program to a database and run queries to both save and retrieve information
- Set up a foreign key for a one-to-many relationship
- Set up foreign keys for a many-to-many relationship

## Mental Models for Computing

#### Concepts
- Define what a library is and what they are called in Ruby
- Articulate an approach to learning a new library
- Articulate the concept of "convention over configuration" and the tradeoffs associated with it

## ActiveRecord

#### Concepts
- Explain what an ORM is and why we use it (vs. writing SQL)
- Explain what ActiveRecord is
- Explain the basic idea of metaprogramming and how AR leverages this to provide an interface to the DB
- Predict the SQL commands that will be issued during particular AR method calls
- Distinguish between when data is stored in memory vs when it is stored in the database
- Explain the use and usefulness of AR validations and how they affect persistence
- Compare and contrast SQL constraints with AR Validations
- Explain how we use AR to manage relationships

#### Mechanics
Use ActiveRecord commands:
- new
- save
- create
- all
- find
- find_by
- where
- update
- destroy

Set up the following validations:
- presence
- uniqueness
- numericality
- length

- Set up an ActiveRecord Association for a one-to-many relationship
- Set up an ActiveRecord Association for a many-to-many relationship

## Shoulda Matchers

### Concepts
- Explain what shoulda matchers are and why they are useful

### Mechanics
- Use shoulda matchers for model validation
- Use shoulda matchers for ActiveRecord associations

## Networking

### Concepts
- Define what a communications protocol is
- Name the four basic layers of the Internet Protocol Suite (the TCP/IP stack)
- Describe the Internet Protocol(IP) and what problems it solves
- Describe the Transmission Control Protocol (TCP) and what problems it solves
- Describe the Hypertext Transfer Protocol (HTTP) and explain what a HTTP Request is.
- Explain what a port is
- Describe the parts of a url in detail

## Sinatra Basics

### Concepts
- Describe what Sinatra is and what it is used for
- Define what WEBrick and Rack are
- Distinguish between a route and a path

### Mechanics
- Build a Sinatra app that responds to HTTP requests
- Define routes using Sinatra
- Define routes with URL paramters and access those parameters

## Sinatra with HTML & ERB

### Concepts
- Explain the idea of "separation of concerns" and why it is so important
- Explain the different roles of HTML, CSS & JavaScript
- Explain what the "DOM" is
- Explain what SEO is and what affects it
- Explain what Accessibility is and why it is important

### Mechanics
- Create an HTML page and use common tags
- Use ERB templates to create dynamic pages and render views
- Pass values into views using instance variables
- Include an external stylesheet in a Sinatra app 