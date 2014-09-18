
var studentsCollection = new StudentsCollection();
var studentsListView = new StudentsListView({collection: studentsCollection});



studentsCollection.fetch().then(function() {
    // studentsListView.render().appendTo('#students-container');

    var studentsRouter = new StudentsRouter();
    Backbone.history.start();
  }
);
