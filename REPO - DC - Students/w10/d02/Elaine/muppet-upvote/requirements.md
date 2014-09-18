# Muppet Up-Vote

Up/down-vote your Muppets!

# 1. Model

Within `js/muppets/model.js`, do the following...

* Create a Muppet model for managing a muppet's `name`, `image`, and `rating`.

* Add an additional "upvote" method onto the model. It should accept either "1" or "-1" as an argument, and use that value to adjust the model's rating. [Save](http://backbonejs.org/#Model-save) the changed model rating.

* Create a Muppets collection for managing a list of Muppet models. [Keep it sorted](http://backbonejs.org/#Collection-comparator) based on `rating`. Add a LocalStorage adaptor.

* Create an instance of your Muppets collection.


# 2. View

Within `js/muppets/view.js`, do the following...

* Create a "muppet-add" view which binds the HTML form to the muppets collection. Bind a "submit" event handler that passes form input into the collection.

* Create a "muppets-list" view which binds the HTML list to the muppets collection. Have the list re-render whenever muppets are added, removed, or when a rating changes (see [Event docs](http://backbonejs.org/#Events-catalog)).

* For each muppet list item, render the Muppet's name, image, and current rating. Also include three buttons for each muppet:

	* X: removes the muppet from the list.
	* UP: calls `upvote(-1)` on the muppet, then resorts the collection.
	* DOWN: calls `upvote(1)` on the muppet, then resorts the collection.