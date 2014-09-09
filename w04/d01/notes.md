### Learning Objectives

* Explain the parts of a url in detail
* Explain the difference between GET and POST and when you would use each.
* Describe, in simple terms, the premise of REST.
* Write a form that formats parameters as expected by the server
* Handle parameters (url parameters & form parameters)
* Use Sinatra/HTTP as a user interface to a database backed app (ActiveRecord).

### Framing
* We know how to CRUD things within the server
* Now with a web app, we need a way to interface with the server to tell it what to do
* Use the URL and HTTP Request type

### URL Breakdown
* scheme://domain:port/path?query_string#fragment_id
* scheme == protocol
* domain name or ip address
* optional port number
* query string, amazon search
* fragment_id, http://www.ruby-doc.org/core-2.1.1/Array.html#method-i-count

### REST
* paths used to be just the file system
* works for static files, but doesnt make sense for dynamic stuff
* lets create a convention centered around resources
* REST means we treat URLs as representative of resources
  * APIs
* GET vs POST (getting info from the server, posting & saving to database)
* GET params in URL, POST in message body
* Matches CRUD actions
* HTTP Verbs --> CRUD, w/ Controller actions
* Stateless

### Basic 1 page Sinatra App - How to Create a POST
Create people on the server
```
  get "/people"
  post "/people"
```
* binding.pry
* params w/ query string
* query string vs form

Form Elements:

* MDN Docs

* form
  * action (the path for the form where it goes on submit)
  * method (http verb)
    * post
    * Browsers only support POST and GET
    * how to do others? (We'll see in a bit) Workaround it with hidden input
* input
  * type
    * text, password, email, hidden
  * placeholder
  * https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Input
* button
* submit

**Concerns?**

* What about other verbs? Will come back to this idea
* Show put example using `name="_method" value="put"`- fake put
* http://programmers.stackexchange.com/questions/114156/why-there-are-no-put-and-delete-methods-in-html-forms

* Explore different input types
* Create a form for Flight Finder
* Create a form for a Sign Up
* Create a form for Pizza Delivery

---

* Sinatra + ActiveRecord

## Activity
* Clowns
  
```
CREATE TABLE clowns(
  id serial primary key,
  name varchar(100),
  talent varchar(100),
  is_creepy boolean
);
```

* Set it up so that you can binding.pry to CRUD it with ActiveRecord

## Let's throw Sinatra on top

## Look at RESTful routes page

* Root
* Index
* New
* Create
* Show

--- 
break

---

* Edit
* Update
* Delete

## Make Your own CRUD with Roller Coaster