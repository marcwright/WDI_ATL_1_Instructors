//  Create a router that handles an ":id" route.

// - **When handling a route:**

//   - find a model for the route (routes will reference an "alpha2Code" value).

//   - Build a new `CountryDetailView` for the model.

//   - Remove any existing country detail view, and then append this new view into the "#country-main" document element.

var CountryRouter = Backbone.Router.extend({
  routes: {
    ':id': 'finder',
  },

  finder: function(id) {
    var country = countriesCollection.get(alpha2Code);
    this.view = new CountryDetailView({model: country});
    this.clearView();
    this.view.render().appendTo('#country-main');
  }
});

