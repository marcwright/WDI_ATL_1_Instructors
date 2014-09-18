var Student = Backbone.Model.extend({

  defaults: {
    name: '',
    email: '',
    phone: '',
    location: '',
    employer: '',
    misses_wdi: true
  }

});

var StudentsCollection = Backbone.Collection.extend({
  model: Student,
  url: '/students'
});

var studentsList = new StudentsCollection();
studentsList.fetch();
