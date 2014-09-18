- Explain the difference between views with an "el" reference versus a "tagName"
    - views with an el reference point at an existing DOM element
    - views with a tagName attribute are built independent of the DOM, and can be appended wherever they please.
- Create a Backbone Collection that syncs with a RESTful API
    - `var Students = Backbone.Collection.extend({ model: Student, url: '/students' })
- Explain what a Regular Expression is
    - a regular expression object is built to match patterns in strings and text objects.
- Articulate the process we've used when researching new libraries and frameworks
  - Identify what problem the library solves
  - How does the library/frame work solve that problem?
  - Identify the alternatives
  - Read the documentation
- What factors should you consider when choosing a library or framework for a particular problem
    - How large is the library/framework?
    - How much configuration will it take and will your deadline allow for much configuration?
- Explain what a Backbone Router is
    - A Backbone Router tracks changes to the url fragment and manages the appending and removing of Views to the page
- Explain what a Backbone Model is
    - A Backbone Model is a client-side representation of Data and its associated logic
- Describe the idea of encapsulation and why it is so powerful
    - the black-boxing of data with the methods that operate on that data.
    - An illustration: "Your pastor handles his shit. You handle yours, and you interface when you have to, keeping your respective business to yourselves."
- Explain what a branch is and why we would use one
    - A Git branch allows you to persist work in isolation from your master copy, in essence keeping it free of potentially unsafe changes
- Compare and contrast arrays and hashes and when you would use each
    - arrays are ordered sets of data, while hashes are bags of key-value pairs
    - you'd use an array where order is important and the elements therin are of uniform construction, and a hash where flexibility is important
- Explain the difference between `.each` and `.map` and when you would use each one
    - `.each` returns the original collection, while `.map` is used to return a modified collection based on the first. We often use each to draw up data in 
- Explain what a foreign key is and why you would use one
    - a record's foreign key identifies an associated record in database table. it is typically an integer.
- Articulate the concept of "convention over configuration" and the tradeoffs associated with it
    - convention over figuration is the idea of using pre-existing solutions to common problems as opposed to writing that logic yourself.
    - it decreases development time, but is often bulky (see: Handlbars) and provides way more than most projects really require
- Explain what an ORM is and why we use it (vs. writing raw SQL)
    - an object-relational mapper maps entries in a database table to objects in memory, and vice versa. We use it because it's immensely easier than writing raw SQL, and because it protects us from 
- Explain the basic idea of metaprogramming and how ActiveRecord leverages this to provide an interface to the DB
    - metaprogramming is code that writes code. ActiveRecord::Base evaluates the database attributes associated with a given model and provides getters and setters for those attributes
- Explain what a database migration is, and what problems it solves
    - database migrations help us configure our Rails databases. We could handle the setup in raw SQL, but different database setups require different commands, and the migrations handle the necessary configuration
- Describe what a database index is, and why we'd add one for common field lookups
    - a database index is not unlike a book index, in that it tallies and stores references to the appearances of values in a given table column. Indexes increase the speed of record retrieval, because we don't have to do a full table scan to find all records where a is_admin column is true;
- Explain the difference between inline and block elements
    - by default, block level elements will expand to the width of their container's width and will come after the previous element in the markup
    - by default, inline elements are only as wide as their contents, and theydo not begin with a new line
- Explain the difference between synchronous and asynchronous program execution
    - When you execute something synchronously, you wait for it to finish before moving on to another task. 
    - When you execute something asynchronously, you can move on to another task before it finishes.