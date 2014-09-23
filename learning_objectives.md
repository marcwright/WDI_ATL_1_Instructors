## Week 1 

### Command Line
- See the path of the current directory
- See the contents in the current directory (including hidden files)
- Create new files and directories
- Change directories
- Copy files and directories
- Move files and directories
- Delete files and directories
- Open files and directories using Sublime

### Git & Github
- Explain the difference between Git and Github
- Initialize a local git repository
- Create a new repository on Github
- Clone a repository from Github
- Pull changes from a repository on Github
- Add and commit changes to a git repository
- Push changes from a local git repository to Github
- Fork an existing repository from Github
- Add and remove a remote
- Use Github to submit a pull request
- Explain the difference between a fork, branch and clone
- Explain the difference between a fetch, merge and pull

### Ruby basics & Strings
- Describe the different types in Ruby (numbers, strings, collections, etc.)
- Explain the difference between a string and a symbol and when you would use each
- Manipulate strings using concatenation & interpolation
- Use common string methods to manipulate strings

### Ruby Collections & Enumeration
- Explain the difference between an array and a hash and when you would use each
- Create an array, access items in an array, change the value of items in an array
- Create a hash, access items in a hash, change the value of items in a hash
- Create, access items in, change the value of items in, and manipulate items in nested collections (arrays & hashes)
- Use common array and hash methods to manipulate collections
- Explain what a block is
- Use built in Ruby methods to enumerate over a collection 
- Explain the difference between each and map

### Ruby Control Flow
- Use boolean logic (&&, ||, !) to combine and manipulate boolean statements
- Use if, else, elsif statements to control logic flow in a Ruby program
- Use the ternary operator for more concise if/else statements
- Use Ruby case statements
- Use while loops to execute code multiple times

### Ruby Methods
- Explain what a method is and why it is useful
- Define and use methods with arguments
- Return values from a method

### Ruby Objects
- Write a class with an initialize method
- Write setters and getters
- Explain when and why you would use use attr_accessor
- Define class and instance methods and explain the difference between the two
- Explain the use of self in Ruby
- Instantiate and use an object
- Write a class that inherits from another class
- Explain what a module is. How does it differ from a class?
- Explain the difference between local, instance and class variables

### Ruby Other
- Reference the Ruby docs
- Explain what a gem is
- Debug a Ruby program using pry
- Create a multi-file Ruby project using require & require_relative
- Follow a Ruby Style Guide
- Name variables, classes and methods in a semantic way
- Explain the principle of DRY

## Week 2

###Networking
- Explain the parts of a url
- Explain what the client-server model is
- Describe the basics of HTTP protocol. What is in an HTTP Request?
- Explain the difference between GET and POST and when you would use each
- Use HTML forms to submit HTTP Requests (GET and POST)
- Explain what REST is
- TCP vs UDP
- IP

### Sinatra & Ruby
- Build a Sinatra app that responds to requests
- Write and match routes using Sinatra
- Use ERB templates and render views
- Pass values into views using instance variables
- Redirect a request
- Write a form that formats parameters as expected by the server
- Handle parameters (url parameters & form parameters)
- Read data from a file and save data to a file
- Explain what a session is
- Explain what a cookie is

###HTML & CSS
- Create an HTML page and use common tags
- Link a stylesheet
- Use CSS Selectors and change the CSS properties of the element(s) selected
- Explain the difference between an id and a class and when you should use each
- Place elements on the page keeping in mind the CSS box model (content, padding, border, margin)
- Position elements using CSS (absolute, relative, fixed)
- Explain the basics of CSS specificity and precedence
- Create a static web page using HTML & CSS that matches a Photoshop mockup

## Week 3

### SQL
- Explain what a database is and why you would use one
- Use psql to:
  - Create a new database and connect to it
  - Remove a database
  - Create a table with an id primary key and other columns
  - Remove a table
- Write basic SQL queries:
  - SELECT
  - INSERT
  - UPDATE
  - DELETE
- Add, remove and alter columns in a database
- Explain what "auto-incrementing primary key" means for a database table
- Explain what a foreign key is and why you would use one
- Explain what a constraint is
- Modify SQL queries using WHERE
- Explain what a join is and when you would use one
- Use aggregate functions in database queries
- Design a database schema
- Connect a Ruby program to a database and run queries to both save and retrieve infromation

### ActiveRecord
- Explain what an ORM is
- Explain what ActiveRecord is
- Include ActiveRecord in a Sinatra app and configure the database connection
- Use ActiveRecord commands:
  - new
  - save
  - create
  - all
  - find
  - find_by
  - where
  - update_attributes
  - delete vs destroy
- Build a Sinatra app using ActiveRecord 
- Set up an ActiveRecord Association for a one-to-many relationship

### Sinatra Other
- Explain the MVC software pattern
- Explain the design principle of separation of concerns
- Explain what the Gemfile and Bundler are and how they are used
- Configure an app and deploy it to Heroku

##Week 4

### General Rails
- Explain what Ruby on Rails is and it's architectural components using a diagram
- Explain what `convention over configuration` means and how it relates to Ruby on Rails
- Describe the lifecycle of an HTTP request in Ruby on Rails
- Follow Rails naming conventions when creating models, views and controllers
- Create a Rails App with CRUD actions (new, create, index, show, edit, update, destroy)
- Debug your Rails app by looking at error messages and using the rails console and pry
- Explain what `fat models, skinny controllers` means

### Model
- Draw an ERD diagram to model relationships
- Build a Rails app with a one to many relationship
- Build a Rails app with a many-to-many relationship
- Create a database migration file to create or alter a database table
- Migrate the database
- Roll back migrations
- Create a seed file and seed a database

### View
- Define routes in a RESTful way using `resources`
- Use path helpers & `rake routes` to match routes to controller actions
- Use partials to DRY up your views
- Use link helpers
- Explain the difference between `form_for` and `form_tag` and when you would use each
- Use form helpers
- Write custom helper methods

### Controller
- Define controller actions for CRUD actions
- Implement before actions in the controller
- Explain strong parameters / whitelisting in Rails
- Explain the difference between redirect and render

### Auth
- Access and set session variables
- Explain the difference between Authentication and Authorization
- Write an application with auth using bcrypt

##Week 5

###Asset Pipeline
- Explain what the Rails Asset Pipeline is and why it is used
- Include assets in the asset pipeline & use asset helpers in a Rails app

### Agile Development
- Explain what Agile Development is
- Explain what TDD/BDD stand for and articulate the philosophy and its benefits
- Develop an app incrementally using User Stories

### Rspec
- Explain what Rspec is
- Read Rspec tests that have already been written for a Ruby program and make them pass one at a time

##Week 6

### JavaScript Basics
- Compare and contrast Ruby & JavaScript as programming languages
- Describe the different types in JavaScript (numbers, strings, collections, etc.)
- Follow a JavaScript Style Guide
- Name variables and functions in a semantic way
- Explain the difference between `pass by reference` and `pass by value`
- Create an array, access items in an array, change the value of items in an array
- Use a for loop for iteration

### JavaScript functions & Objects
- Define a function in JavaScript
- Explain the difference between calling and referencing a function in JavaScript
- Explain what prototypal inheritance is and how it differs from classical inheritance
- Create objects using literal notation
- Create objects using constructors and defining methods on the prototype
- Access property values in a JavaScript object

### JavaScript Scope
- Explain what the `window` refers to in JavaScript
- Use `var` to declare your variables in the current scope
- Explain what `this` refers to in various contexts
- Identify what creates a new scope JavaScript

### The DOM & Events
- Explain what the DOM is
- Write JavaScript code that runs after the window has loaded
- Create DOM elements
- Select DOM elements by: id, class name, tag, or using a query selector
- Change the attributes or content of a DOM element
- Add and remove elements from the DOM
- Add event listeners

### Libraries
- Include functionality from another library
- Write functions for your own JavaScript library
- Explain what underscore.js is and when it is useful

### JavaScript Timers
- Use setTimeout to execute code after a specific delay
- Use setinterval & clearinterval to repeatedly execute code at specific intervals

### Programming Concepts
- Describe the idea of encapsulation and why it is so powerful
- Compare and contrast functional and object-oriented programming
- Given a problem or scenario, model the objects (data & behavior) you would use

##Week 7

### AJAX
- Explain what JSON is and what it is used for
- Explain what AJAX is and why you would use it
- Make a GET request using XMLHttpRequest and handle a JSON response
- Explain what preventDefault does for a form
- Explain what a callback function is

### jQuery
- Reference the jQuery documentation to figure out things you don't know how to do
- Create a jQuery object
- Select DOM elements by: id, class name, tag, or using a query selector
- Change the attributes or content of a DOM element
- Change the css of a DOM element
- Append and remove elements from the DOM
- Add event listeners using jQuery
- Explain what delegated events are
- Explain what stopPropagation does in relation to events
- Make AJAX requests using jQuery

### JavaScript & Rails
- Include JavaScript files in a Rails app
- Decide and defend what functionality should be implemented on the client-side with JavaScript and what should be implemented on the server-side with Rails
- Use AJAX in the context of a Rails app to GET information from the server
- Use AJAX in the context of a Rails app to POST information to the server

##Week 8

### Project Management Tools & Project Planning
- Use Pivotal Tracker to manage User Stories
- Resolve merge conflicts in Github
- Hold a Daily Scrum with a team to prioritize and stay organized

###File Upload
- Explain why we would not store files directly in a Postgres Database
- Explain conceptually and draw a diagram of how file upload works
- Use a multi-part form to upload files

###Interactive Interfaces
- Include and utilize a jQuery plugin or external library to create interactive UI components
- Compare HTML5 Canvas and SVG

###SASS
- Explain what a CSS pre-processor is and why it is useful
- Use variables in SASS
- Nest CSS with SASS

##Week 9 & 10

### Rspec
* Explain the difference between BDD & TDD
* Set up a Ruby program with Rspec
* Set up Rspec tests using
  * `describe`
  * `context`
  * `subject`
  * `it`
  * `before`
  * `let`
* Write tests using expectations
  * `to` and `not_to`
  * `eq`, `eql`, `equal`
  * `be_true`, `be_false`
* Set up a Rails app with Rspec (instead of Test::Unit)

### Advanced Rails
* Create a custom validator in Rails
* Add complex logic to your models
* Explain and implement single table inheritance
* Explain and implement a self-join 

###Programming concepts  
* Model a complex application (>5 models)
* Break down a problem from Model, to User Stories, to Behavior, to Tests, to Code
* Write meaningful Unit Tests at the appropriate place in the development workflow
* Explain and follow the principles of good software design
  * DRY
  * Naming
  * Test
  * Small

###Regex
* Write regular expressions in Ruby to match patterns of characters
* Use regex to validate input and output

###Exception Handling
* Explain what an exception / error is and when you might encounter one
* Explain the call stack and the path an error takes
* Handle an exception in Ruby using begin, rescue, ensure

###Shoulda
* Explain what shoulda matchers are and why they are useful
* Use shoulda matchers for model validation
* Use shoulda matchers for ActiveRecord associations

###Factory Girl
* Explain what the factory girl gem does and why it is useful
* Use factories to create test objects in Rails

###Capybara
* Explain what acceptance testing is and why it is used
* Explain what Capybara is and generally how it tests your app
* Explain the difference between acceptance testing and unit testing
* Explain how acceptance testing fits into the Agile workflow

##Week 11

###Blocks, Procs & Lamdas
* Explain what a closure is. Name the closures in Ruby and the ones in the JavaScript.
* Explain the difference between a Proc, Block and Lambda

###Recursion
* Define recursion and give an example
* Explain the difference between single recursion and multiple recursion

###Backbone Introduction
* Explain what Backbone.js is and when you might use it
* Explain why Backbone.js is not quite MVC and how it differs from the MVC pattern in Rails

### Backbone Views & Router
* Explain what the el property is in a Backbone view
* Create and use templates for Backbone using Underscore.js
* Add event listeners (such as click or submit) to elements in your Backbone view
* Explain what a render function does for a Backbone view
* Associate a Backbone View with a Backbone Model
* Update a Backbone View and re-render it when its associated model changes
* Explain what a Backbone router is and how its role differs from your Rails router
* Create a Backbone router to connect URLs to parts of your application

### Backbone Models & Collections
* Explain why you access and set properties in a Backbone Model using `get` and `set` instead of setting them directly.
* Connect Backbone to Rails & sync models & collections
* Use fetch to make an AJAX request in Backbone
* Group Backbone models into collections
* Articulate how you might structure a Backbone app with mutliple models, views and collections

##Week 12

###Jasmine
* Explain what Jasmine is and when it is useful
* Use `describe` and `it` blocks with expectations and matchers to write Jasmine tests
* Compare Jasmine to Rspec
* Include Jasmine in a Rails app and run Jasmine tests
* Write a unit test using Jasmine

###CS Fundamentals

* Explain what memory is and how it differs from storage systems.
* Explain what the difference between a bit, a byte and a word.
* Explain what a reference is.
* Explain what a pointer is.
* Differentiate between the heap and the stack, and explain when each is used.
* Explain what garbage collection is.
* Describe the basic rules of Ruby memory management:
   * (Almost) everything is an object
   * The Ruby Interpreter only uses the system's heap
   * The Ruby Interpreter allocates and removes objects from memory using garbage collection
   * Variables are stored, and assignment is done, by reference
* Describe the difference between mutable and immutable objects.
* Give examples of languages that are compiled (into machine code or bytecode) and interpreted, and explain the difference.

###Data Structures & Algorithms

* Explain the difference between discrete and continuous, and which realm a computer operates within
* Describe a few basic data structures: Linked lists, trees, and graphs
* Explain what Big O time complexity measures and why we would use it
* Explain what an algorithm is
* Describe how a Bubble Sort is performed and it's time complexity
* Describe how a Quick Sort is performed and it's time complexity
* Explain what a divide and conquer algorithm is
* Benchmark code in Ruby to compare which code runs faster

###Rails Optimization
* Explain premature optimization and the place of optimization in your workflow
* Explain what you ALWAYS do before you start optimizing and how you would figure out what to optimize first
* Describe the n+1 query problem
* Explain the difference between a development and production environment for Rails
* Describe the relative speed of I/O in different locations: Memory, File System, Network
* Explain what a caching is and how it relates to I/O
* Name and describe a few specific Rails optimization tools: ActiveRecord::includes, Rails cache fetch , fragment caching
* Explain what a CDN is and when you might need one
* Explain concatenation and minification

###Test Coverage
* Explain what test coverage is, what it measures, and when it can be a useful metric
* Explain why having a high test coverage percentage does not necessarily mean you have a well tested app
* Use Rcov to measure the test coverage of your Rspec tests
