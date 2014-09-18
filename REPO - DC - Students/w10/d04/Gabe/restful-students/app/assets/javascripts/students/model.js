var StudentModel = Backbone.Model.extend({

  defaults: {
    name: '',
    email: '',
    location: '',
    employment: '',
    misses_wdi: false
  },

});

var StudentsCollection = Backbone.Collection.extend({
  model: StudentModel,
  url: '/students'
});

var studentsCollection = new StudentsCollection();
studentsCollection.fetch({async: false});

