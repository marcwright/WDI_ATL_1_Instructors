// Create collection and router:
var students = new StudentCollection();
var router = new StudentsRouter({collection: students});

// Fetch collection, and then start history:
countries.fetch().then(function() {
  Backbone.history.start();
});
