define(function(require) {

  // Imports:
  var Backbone = require('backbone');
  var students = require('../models/student');
  var StudentsListView = require('../views/list');
  var StudentDetailView = require('../views/detail');

  // Implementation:

  var StudentsRouter = Backbone.Router.extend({
    routes: {
      'students': 'list',
      'students/:id': 'detail',
      '*default': 'list'
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
      var view = new StudentsListView({collection: students});
      this.setView(view);
    },

    // Detail route handler:
    // triggered when the "#students/:id" route is navigated to.
    detail: function(id) {
      var view = new StudentDetailView({model: students.get(id)});
      this.setView(view);
    }
  });

  return new StudentsRouter();
});