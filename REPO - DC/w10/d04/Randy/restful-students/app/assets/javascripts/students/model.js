var StudentModel = Backbone.Model.extend({

 defaults: {
  name: '',
  email: '',
  phone: '',
  location: '',
  employment: ''
 }
});

var StudentsCollection = Backbone.Collection.extend({
  model: StudentModel,
  url: 'students',
});

var studentsCollection = new StudentsCollection();

