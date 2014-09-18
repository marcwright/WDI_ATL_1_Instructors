##Capybara CRUD

####Objective: 
Use BDD w/ Capybara to create a one-model Rails CRUD app that allows Zoo managers to add, view, and remove animals from the Smithsonian National Zoo. The model and behavioral specs are below.

An __Animal__ has the following attributes:

- name
- age
- species
- sex

####Behavioral Specs

Upon visiting the root url (`'/'`)
- users are presented with a heading of "Welcome to the Smithsonian National Zoo"
- users are presented with a list of the animals in the zoo
  - each list item should link to that animal's profile page
- users should be able to click a link that takes them to `'/animals/new'`

Upon visiting an animal's profile page (example: `/animals/3`)
  - users are presented with an h1 header with name of the Animal with ID of 3
  - users should be able to click a link back to the root url
  - users should be presented with a link that reads "Remove Animal"
    - upon clicking the link for removing an animal, users should be taken to a confirmation page that reads: "<animal_name> has been removed from the Smithsonian National Zoo."

Upon clicking the link to remove an animal
  - 






