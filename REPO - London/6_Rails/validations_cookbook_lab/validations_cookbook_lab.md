You need to add some validations to your cookbook:

* Recipe :
  * The description is present and the length is between 30 and 400 characters
  * The name is unique
  * the category association (category_id) is only required on update
* Ingredient :
  * The image is present
  * The name is unique
  * the price have to be a numric value
* Category :
  * The name is unique and present


Errors need to be displayed on each form for each resource. Also make sure the inputs containing errors are highlighted.

Optionnal (Google is your friend):

* Recipe
  * The name only contains letters.

* Ingredient :
  * The image field begins by http or https 