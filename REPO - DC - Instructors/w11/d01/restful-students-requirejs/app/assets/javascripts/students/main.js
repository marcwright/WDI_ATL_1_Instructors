define(function(require) {
  
  // Imports:
  var jQuery = require('jquery_ujs');
  var Backbone = require('backbone');
  var students = require('./models/student');
  var router = require('./routers/routes');

  // Implementation:
  
  students.fetch().then(function() {
    Backbone.history.start();
  });
});