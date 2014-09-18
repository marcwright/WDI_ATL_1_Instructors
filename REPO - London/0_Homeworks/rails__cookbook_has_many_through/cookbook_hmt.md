# Switching the cookbooks ingredients-recipes association to a `has_many :through`

Continue to tweak your cookbook, adding validations and custom helpers.

Also, change the "habtm" relationship between recipes and ingredients into a "has_many :through"


It should all 'Just Work' with an IngredientsRecipe model and corresponding changes to the associations - the existing forms submitting 'ingredient_ids' will work for 'through' relationships too.

This new association type will support the ability to add a "quantity" field (to the IngredientsRecipe join model), and to update that in the recipe form will be a bit more work. 



## To put into hipchat after they've been working on it for an hour or so

A couple of homework hints... there are several ways of approaching the "manage 'has_many :through' relationships" problem
there are plugins that do it
and some approaches that hide javascript in the background
and to do it manually will probably require a bit of jiggling around with parameters
as far as I know there's no magic solution... just working as close to a solution as possible
pretty much all solutions will require using "accepts_nested_attributes_for" in models and possible a "fields_for" helper on the form

if you have not made good headway by half-eight, I'd firmly suggest that you draw a line - we will cover a solution tomorrow morning - but there's no sense in you flogging yourself to exhaustion tonight 