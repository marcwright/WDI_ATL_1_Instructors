// Student Data Model: 
var Student = Backbone.Model.extend({
  defaults: {
    name: '',
    email: '',
    phone: '',
    location: '',
    employment: ''
  }
});


// Student Models Collection:
var StudentCollection = Backbone.Collection.extend({
  model: Student,
  url: '/students'
});