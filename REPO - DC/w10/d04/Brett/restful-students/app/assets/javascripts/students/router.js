var StudentsRouter = Backbone.Router.extend({

  routes: {
    "students": "list",
    "students/:id": "detail",
    "*default": "list"
  },

  initialize: function(options) {
    this.collection = options.collection;
  },

  setView: function(newView) {
    if (this.view) {
      this.view.remove();
    }

    this.view = newView;
    this.view.render().appendTo("#students-container");
  },

  list: function() {
    var view = new StudentListView({collection: this.collection});
    this.setView(view);
  },

  detail: function(id) {
    var view = new StudentDetailView({model: this.collection.get(id)});
  }

});

