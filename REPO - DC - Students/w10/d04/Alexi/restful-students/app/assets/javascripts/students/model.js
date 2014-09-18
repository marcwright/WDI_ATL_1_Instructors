var Student = Backbone.Model.extend({
  defaults: {
    name: '',
    email: '',
    phone: '',
    location: '',
    employer: '',
    misses_wdi: false
  }
});

var StudentsCollection = Backbone.Collection.extend({
  model: Student,
  url: '/students'
});

var studentsCollection = new StudentsCollection();
