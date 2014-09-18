# Koopa CRUD

### Prompt

You are Bowser, aka The King Koopa, and you have decided to design a Sinatra application that allows you the create, read, update, and destroy (CRUD) Koopas via your web browser.

### Directions

1. Set up a `koopas_db` database.
2. Define a `Koopa` class that inherits from ActiveRecord and create the appropriate table in your db. Each koopa should have the following attributes:
  - name
  - color 
  - has_shell (TRUE on creation)
  - photo_url
3. Using your newfound knowledge of routes and forms, make your app meet the following specs:

* the root path (`'/'`) should display a list of all Koopas. 
  - each list entry on the page should dynamically link to the appropriate koopa profile page.
* `/koopas/4` should display the profile page for the koopa with id of 4. (Similarly, `/koopas/6` should display koopa #6's profile.)
  -  each profile page should have links for editing and destroying that particular koopa
* `/koopas/new` should display a form for creating a koopa
* `/koopas/7/edit` should take you to a form for editing the koopa with id of 7
* Make sure your creations, destructions, and updates persist 

### Bonus

* Only display the link for destroying a particular koopa when they don't have a shell.
<div></div>
