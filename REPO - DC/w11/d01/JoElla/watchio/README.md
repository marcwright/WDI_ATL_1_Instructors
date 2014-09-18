# Watch.io

## 1. Setup Search

* Create a Search model/collection that fetches from `http://www.omdbapi.com/?s={{ title }}`. Export an instance of the Search collection for use by other modules.

* Create a SearchView that binds to the document's "#search" element. Export a instance of SearchView, with the Search collection attached. SearchView should submit new search terms, and rerender whenever new search data syncs.

* Require SearchView into the main application module.


## 2. Create Home & Detail components

* Create an instanceable HomeView that renders the homepage template (ascii artwork). Export the view's constructor so that other components can instance it.

* Create a MovieDetail model that fetches data from `http://www.omdbapi.com/?i={{ imdbID }}`. Export the model's constructor so that other components can instance it.

* Create an instanceable MovieDetailView. Have the view re-render its template whenever data syncs with its model. Export the view's constructor so that other components can instance it.


## 3. Setup a Router

* Create a router component that responds to "home" and "movies/:id" routes. Have all other routes default to the home behavior.

* **When "home" triggers**: remove any existing main view, and then render a new HomeView into the document's "#main" element.

* **When "movies/:id" triggers**: remove any existing main view. Then, create a new MovieDetail model for the route ID, render it with a MovieDetailView into the document's "#main" element, and then fetch the model.

* Require the router into the main application module, and then start Backbone history.


## 4. Create a Watchlist

* Setup a database and resources for a "/movies" API. This should persist a "title" and an "imdb_id" for watchlist movies.

* Create a Watchlist model/collection module that syncs with the "/movies" endpoint. Export an instance of the Watchlist collection for use by other modules.

* Create a WatchlistView that binds to the document's "#watchlist" element. Export a instance of WatchlistView, with the Watchlist collection attached. WatchlistView should render a list of movie detail links whenever data syncs with the Watchlist.

* Require Watchlist and WatchlistView into the main application module. Fetch Watchlist at the end of the main module.

## 5. Hook up "Add to Watchlist"

* Require Watchlist into MovieDetailView. Make the "#watchlist-toggle" button toggle its MovieDetail into and out of the Watchlist.

* Update the "#watchlist-toggle" button text read "Add to Watchlist" or "Remove from Watchlist" whenever items are added-to or removed-from the Watchlist.

## Done?

1. Help your peers.
2. Research [router pushState](http://backbonejs.org/#History-start), and get it working.
3. Setup user login, and then retool the app to manage watchlist items specifically for the current user.