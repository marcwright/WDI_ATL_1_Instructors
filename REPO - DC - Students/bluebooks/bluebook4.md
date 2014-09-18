## Blue Book W05 Answers

Below are some exemplary student answers to the questions from last week's blue book quiz.

#### Question 1: Explain what "convention over configuration" means and how it applies to Rails.

Student Answer: "Convention over configuration is the practice of adhering to a clearly defined set of rules in lieu of having to perform a bunch of configuration.  This is integral to Rails, which has a lot of built in "magic" that can only be tapped into by sticking with convention.  An example would be classes being singular and camelcase and tables being plural and lowercase."

#### Question 2: Explain the difference between inline and block elements.

Student Answer: "By default, block elements, like `<div>`, fill the entire width of their containing element. Inline elements, like `<span>` or `<b>` only effect the content of a part of a single line."

#### Question 3: Explain what REST is, and what it pertains to.

Student Answer: "REST is a way of setting up meaningful URL routes.  With RESTful routes, we can define behavior for URLs that make intuitive sense like http://facebok.com/users/1/posts/231 (user 1's 231st post).  Rails will preconfigure RESTful routes for us via :resources."

#### Question 4: Define what Section 508c is, some common requirements that address it, and why it's important.

Student Answer: "Section 508C is an accessibility statute that is important to know about, especially when working in a government town like DC.  508C requires federal government websites to meet accessibility requirements (alt text for images, skip navigations, roles, color ratio requirements) so that people with disabilities are not discriminated against." 

#### Question 5: Describe the lifecycle of an HTTP request in Rails.

Student Answer: "An HTTP request is routed to a particular controller by the routes in `routes.rb`. The chosen controller takes the request and retrieves any necessary data from the model. Any data retrieved is pulled from the model and handed off to the view. The user downloads the view in the form of a webpage."
