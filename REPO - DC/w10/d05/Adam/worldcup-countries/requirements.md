# World Cup Countries

Build a simple app that tracks World Cup country playoff status. There's no backend and no persistence here (wahoo!). We're just trying to manage views.

## 1. Model

- Make a Country model with the following fields:

	- alpha2Code
	- name
	- isPlaying
	- isEliminated

- Make a Countries collection that fetches data from "http://restcountries.eu/rest/v1".


## 2. Views

### CountryDetailView

- Give it a "div" tag with a class of "country-detail".

- Make it render using the provided "#country-detail" template (the image uses a lower-cased "alpha2Code").

- Setup "change" event handlers for the checkbox inputs. Have each checkbox set its value into the view's model.
	

### CountryListItemView

- It will be instanced with a Country model.

- Give it an `li` tag.

- Make the view listen to its model. The view should re-render itself on model "change".

- **When the view renders:**
	- toggle a "playing" class on the view's element if the model "isPlaying".
	
	- toggle an "eliminated" class on the view element if model "isEliminated".
	
	- Display the country's name text, and link it to "#{{ alpha2Code }}".

### CountryListView

- It will be instanced with a Countries collection.

- Attach this view to the "#countries-list" document element.
 
- Make the view re-render when its collection triggers "sync" or "reset".

- **When the view renders:** clear its current content, and then append a new `CountryListItemView` for each model in the collection.

## 3. Router

- Create a router that handles an ":id" route.

- **When handling a route:** 
	
	- find a model for the route (routes will reference an "alpha2Code" value). 
	
	- Build a new `CountryDetailView` for the model.
	
	- Remove any existing country detail view, and then append this new view into the "#country-main" document element.
	
## 4. Main

- Create an instance of the Countries Collection.
- Create an instance of the CountryListView, attached to the collection.
- Create an instance of the Router.
- Fetch the countries collection, and then start Backbone history.
