// Create collection and router:
var students = new StudentCollection();
var router = new StudentsRouter({collection: students});

// Fetch collection, and then start history:
students.fetch().then(function() {
  Backbone.history.start();
});