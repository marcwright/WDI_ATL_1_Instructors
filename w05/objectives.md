## Agile Workflow

### Concepts

- Provide a general overview of what "Agile" means.
- Explain what SCRUM is, and how it relates to agile.
- Describe the process of requirements gathering.
- Explain what a user story is, and what specific points it should include.
- Describe what the backlog is, and how it gets prioratized.
- Describe what a sprint is, and the major parts of a sprint cycle.
- Describe what a wireframe is, and what it accomplishes.
- Describe the structure of a daily scrum meeting.
- Explain what Pivotal Tracker is and why we use it.

### Mechanics

- Distill project requirements into user stories.
- Prioritize a backlog, and plan a sprint.
- Wireframe intended application flow before starting work.


## BDD & Testing

### Concepts

- Explain the difference between unit tests and acceptance tests.
- Explain what Capybara is, and what it accomplishes.
- Explain the benefit of testing using an element's ID rather than its display text.

### Mechanics

- Write unit tests for models using Rspec and Shoulda Matchers
- Write acceptance tests for routes and controllers using Rspec and Capybara.
- Compose acceptance tests for a complete CRUD workflow.


## Authentication

### Concepts

- Provide a high-level explanation of what Authentication is.
- Explain the difference between session data and cookie data.
- Explain the difference between encryption and hashing.
- Explain the difference between authentication and authorization.
- Describe some basic security measures for handling sensative data, such as passwords.
- Describe what a database index is, and why we'd add one for common field lookups.
- Describe what the ActiveRecord `has_secure_password` method does.

### Mechanics

- Create a user model that validates fields and implements `has_secure_password`.
- Create a users controller that handles user signups.
- Create a sessions controller that handles signin and signout.
- Create session helpers for managing the current user, signin status, and request forwarding.
- Configure authorization for protected resources.

## APIs

### Concepts

- Explain what an API is and what it stands for
- Explain what JSON is and what it stands for
- Explain why is JSON language-agnostic
- Explain what HTTParty is and what it does

### Mechanics

- Access data via an API
- Parse and output API data into an application view.


## More Rails

### Concepts

- Explain what model validation errors are and describe how we access them
- Explain what a helper module is and why we would use one

### Mechanics

- Print out error messages for an invalid form submission.
- Print out a flash message from a controller into a view.
- Render a view partial with passed local variables.
- Write and include custom helper methods
