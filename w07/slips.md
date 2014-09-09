- Define some common content accessibility considerations
  - color contrast should be strong enough to be easily viewed by the visually impaired
  - aria roles should make clear what the divisions of content represent
  - alt text for `<img>` tags so that screen readers can give the visually impaired an idea of what they should see
  
- Identify the 3 places that CSS selectors can go
  - inline
  - in the HTML document head
  - in an external stylesheet
  
- Diagram the major parts of the box model
  - content
  - padding
  - border
  - margin
  
- Explain the difference between inline and block elements
  - by default, block level elements will expand to the width of their container's width and will come after the previous element in the markup
  - by default, inline elements are only as wide as their contents, and theydo not begin with a new line
  
- Describe the benefits of alphabetizing style rules
  - decreases unnecessary duplication and overwrites between different members of the software development team
 
- Explain what Ruby on Rails is, and why it's so popular
  - Ruby on Rails is a web development framework written in Ruby. It's insanely popular because it needs little configuration, allowing developers to bypass much of the setup work that they would normally have to do. 
  
- Explain what a gemfile is and what it does
  - a Gemfile is where you declare the gem dependencies for your Rails project's various environments, so that the environments dont load gems unnecessary to the individual environments' responsibility. 
  
- Explain what a user story is, and what specific points it should include
	- a user story is an articulation of a user's expectation at a specific point in their use of an application. Generally it follows the format below:
		- as a _____
		- I want to ______
		- so I can _____
		
- Explain the benefit of testing using an element's ID rather than its display text
  - the display text in an application is likely to change over the course of the application's development, so if you're relying on display text within your tests, you will have to change your tests to accomodate. 
  
- Provide a high-level explanantion of what authentication is
  - authentication is the process process of confirming whether a user is who they claim to be
  
- Explain the difference between authentication and authorization
  - Authentication confirms that you are who you say you are. Authorization determines what level of access a particular authenticated user should have to secured resources. 
  
- Describe some basic security measures for handling sensitive data such as passwords
  - sensitive data is typically hashed, sometimes repeatedly
  
- Create a user model that validates fields and implements `has_secure_password`

```ruby
class User < ActiveRecord::Base
  validates :name, :presence => :true
  has_secure_password
end
``` 

- Explain what an API is and what is stands for
  - an application programming interface specifies how some software components should interact with each other

- Explain what HTTParty is and what it does
  - HTTParty makes HTTP requests from our servers, allowing us to request and retrieve information persisted in remote databases without having to worry about configuring the HTTP request.

- Explain what JSON is and what it stands for
  - JSON is a data interchange format based on JavaScript's object literal. It is easy to parse and generate and gets passed around as plain text, making it language agnostic.
  - it stands for 'JavaScript Object Notation'

- Explain what SCRUM is and how it relates to Agile
  - SCRUM is an implmentation of Agile that uses frequest face-to-face checkins between the members of the development team to encourage rapid realignment of goals and resources. 
  - Three common questions
    - What did you do yesterday?
    - What are you planning to do?
    - Any stumbling blocks that are holding you up?

- Provide a general overview of what Agile means?
  - Agile is a software development methodology that assumes requirements change, based on developing incrementally, and encourages rapid and flexible response to change.

- Describe what a database index is, and why we'd add one for common field lookups
  - a database index is not unlike a book index, in that it tallies the appearances of values in a given table column. Indexes increase the speed of record retrieval, because we don't have to do a full table scan to find all records where a is_admin column is true;

  
   
  
  



  
