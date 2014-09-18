// Students Application Router:

var StudentsRouter = Backbone.Router.extend({
  routes: {
    'students': 'list',
    'students/:id': 'detail',
    '*default': 'list'
  },

  // Attach a passed collection option onto the router:
  // (this is a cleaner approach than referencing through global scope!)
  initialize: function(options) {
    this.collection = options.collection;
  },

  // Sets a new view into the "#students-container" region:
  // - any existing view is cleaned up and removed.
  // - the new view is rendered and dropped into the continer region.
  setView: function(newView) {
    if (this.view) {
      this.view.remove();
    }

    this.view = newView;
    this.view.render().appendTo('#students-container');
  },

  // List route handler:
  // triggered when the "#students" route is navigated to.
  list: function() {
    var view = new StudentsListView({collection: this.collection});
    this.setView(view);
  },

  // Detail route handler:
  // triggered when the "#students/:id" route is navigated to.
  detail: function(id) {
    var view = new StudentDetailView({model: this.collection.get(id)});
    this.setView(view);
  }
});