var StudentModel = Backbone.Model.extend({
  defaults: {
    name: '',
    email: '',
    phone: '',
    location: '',
    employment: '',
    misses_wdi: false
  }

});

var StudentCollection = Backbone.Collection.extend({
  model: StudentModel,
  url: '/students'
});

var studentsCollection = new StudentCollection();
studentsCollection.fetch();
