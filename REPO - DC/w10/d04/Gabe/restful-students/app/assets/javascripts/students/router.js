var StudentsRouter = Backbone.Router.extend({
  routes: {
    '/students': 'list',
    '/students/:id': 'detail',
    '*default': 'list'
  },

  clearView: function() {
    if (this.view) this.view.remove();
    this.view = null;
  },

  list: function() {
    this.clearView();
    this.view = new StudentListView({collection: studentsCollection});
    this.view.render().appendTo('#students-container');
  },

  detail: function(id) {
    this.clearView();
    var student = studentsCollection.get(id);
    this.view = new StudentDetailView({model: student});
    this.view.render().appendTo('#student-container');
  }
});

var router = new StudentsRouter();
Backbone.history.start();
