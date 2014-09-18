## Pre-Rails Review HW

####Objective:
Tomorrow we combine all that we've learned over the past 3.5 weeks and dive into Rails. Your goal for tonight is to review the concepts below, as they will be ubiquitous going forward. 

####Ruby
- explain implicit return and how it differs from explicit return
- what's is an instance and how does it relate to a class
- what are arrays and what are hashes, and why would you use one over the other
- how to access values in a hash
- how to add key-values to a hash
- how to access values in a nested hash
- block dissection (what's what)
- `.each`
    - where would we use it?
    - what does it return?
- `.map`
    - where would we use it?
    - what does it return?
- `.select`
    - where would we use it?
    - what does it return?

####Model-View-Controller
- What is a model?
- What is a view?
- What is a controller?
- Within a Sinatra app, identify the model, the view, and the controller

####Persistence
- Foreign keys
  - what are they used for?
  - what is the naming convention for a foreign key
- Database constraints
  - what are they?
  - why do we use them?
- Naming conventions for a model and its corresponding table in the db
- What is ActiveRecord? What do we have to do to make use of it?

####HTTP requests
- what are the following HTTP requests?
  - GET
  - POST
  - PATCH/PUT
  - DELETE

####Sample Data

```ruby
num_array = [2, 44, 101, 73, 15, 9, 12, 34, 31, 79]

word_array = ["horse", "drawn", "carriage"]

simple_hash = { 
  :address => "1210 Western Avenue",
  :exterior_paint => "brown"
}

nested_hash = {
  :larry => {
    :dob => "01-21-1932",
    :eye_color => "blue"
  },
  :curly => {
    :eye_color => "blue",
    :dob => "undocumented"
  }
}
```
