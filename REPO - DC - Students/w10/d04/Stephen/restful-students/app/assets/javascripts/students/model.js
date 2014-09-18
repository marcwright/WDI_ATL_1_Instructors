/*
* @Author: stephenstanwood
* @Date:   2014-06-26 15:05:02
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-27 12:08:17
*/

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

var router;
var studentsCollection = new StudentCollection();
studentsCollection.fetch().then( function() {
  router = new StudentsRouter();
  Backbone.history.start();
});

