## Sinatra CRUD

### Concepts

- Explain what "persistent storage" refers to.
- Explain what CRUD is, and what it pertains to.
- Explain what REST is, and what it pertains to.
- Define what HTTP request types are, and name the five major ones we've discussed.
- Explain the parts of a URL in detail, including the query and fragment.
- Explain the difference between GET and POST and when you would use each.
- Describe, in simple terms, the premise of REST.
- Write a form that formats parameters as expected by the server
- Handle parameters (url parameters & form parameters)
- Use Sinatra/HTTP as a user interface to a database backed app (ActiveRecord).

## Web Accessibility / SEO

### Concepts
- Define some common content accessibility considerations.
- Explain what the Document Outline is, and why it's important.
- Define what Section 508c is, and explain common requirements that address it.
- Define what WCAG is, and explain common requirements that adddress it.
- Define what ARIA roles are, and what they're used for.
- Explain image "alt" texts, and what they're used for.
- Explain cross-browser compatibility, and name a few major concerns.
- Explain what SEO is, and why it's important.
- Explain what the document <title> tag is, and why it's important.

### Mechanics
- Create an HTML document outline based on content heirarchy.
- Configure ARIA roles on major content divisions.

## Layout

### Concepts
- Explain what CSS is.
- Define the three places that CSS styles can go.
- Explain what selectors are, and how they target HTML elements.
- Explain what selector specificity is, and how it is calculated.
- Explain the major parts of the box model.
- Explain the difference between inline and block elements.
- Explain document flow, and how floats/positioning changes it.
- Explain the difference between absolute and relative positioning.
- Explain what problems ID selectors and "!important" styles cause.
- Describe the benefits of alphabetizing style rules.

### Mechanics
- Create an external stylesheet, and link it into an HTML document.
- Use basic styles to set fonts, sizes, colors, backgrounds, etc.
- Use basic block styles to set element padding, margins, borders, etc.
- Use "float" to shift elements within a layout.
- Use "position" to arrange elements within a layout.

## Rails

### Concepts

- Explain what Ruby on Rails is, and why it's so popular.
- Explain what "convention over configuration" means and how it applies to Rails.
- Explain what a Gemfile is, and what is does.
- Explain what environments are, and which common ones we're working with.
- Explain what "rake" is, and what it does.
- Explain what a database migration is, and what problems it solves.
- Explain what a database seed file is.
- Explain what routes are, and where they're defined.
- Explain what resources are, and how they can be nested.
- Describe the lifecycle of an HTTP request in Rails.
- Describe what strong parameters are, and what problem they address.
- Explain what the Asset Pipeline is.

### Mechanics

- Create a new Rails project and a database for it (using Rake).
- Create a new database migration, configure it, run it, and roll it back.
- Follow Rails naming conventions while creating models, views and controllers.
- Route requests to controller actions.
- Render views from controller actions.
- Setup CRUD actions (new, create, index, show, edit, update, destroy)
- Use Rake to list all resource routes, their methods, and their helper prefixes.
- Use helpers to create resource links and forms.
- Update resources using strong parameters with whitelisted keys.
- Include images and CSS in the assets directory.
