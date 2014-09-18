var studentCollection = new StudentCollection();
var router = new StudentsRouter({collection: studentCollection});

studentCollection.fetch().then(function() {
  Backbone.history.start();
});

