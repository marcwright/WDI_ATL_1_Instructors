define(function(require) {

  // Imports:
  var $ = require('jquery_serialize_object');
  var Backbone = require('backbone');

  // Implementation:

  var Student = Backbone.Model.extend({
    defaults: {
      name: '',
      email: '',
      phone: '',
      location: '',
      employment: ''
    }
  });

  var StudentCollection = Backbone.Collection.extend({
    model: Student,
    url: '/students'
  });

  return new StudentCollection();
});