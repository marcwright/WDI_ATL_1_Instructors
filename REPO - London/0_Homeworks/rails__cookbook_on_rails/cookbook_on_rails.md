#Cookbook on Rails

Weekend homework - it's quite a large task.

Reproduce the Cookbook app we built in sinatra, but this time on Rails.

## Basically, the app's supposed to do three things:

Display a list of all recipes.
Create new recipes and edit existing recipes.
Assign a recipe to a category (like "dessert" or "soup").

### Required features

- Recipe - Clicking on the link takes us to a page showing a non-editable view of the recipe. The page has links to edit and save the recipe and to return to the listing page.

- (delete) - Clicking on the link deletes the recipe from the database and from the page.

- Category - Clicking on the link causes the page to be refreshed with only recipes in that category included.

- Date - The date should be assigned by the system when a recipe is created or edited.

- Create new recipe - Clicking on the link takes us to a form to enter the recipe's name, description, and instructions, and to select a category to which to assign the recipe.

- Show all recipes - Clicking on the link displays all recipes. This is used to restore the display after the list has been filtered by clicking on one of the Category links.

- Show all categories - Clicking on the link takes us to a list view for categories with links on the page to edit and delete existing Category entries. (Footer has the "Create new category" link.)

### Optional feature

Add a 'has and belongs to many' association between ingredients and recipes. But we will add this on Monday, and turn it into a 'has many through'


