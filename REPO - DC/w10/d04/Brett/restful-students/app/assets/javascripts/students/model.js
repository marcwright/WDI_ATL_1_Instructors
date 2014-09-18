var Student = Backbone.Model.extend({
  defaults: {
    name: "",
    email: "",
    location: "",
    phoneNumber: "",
    employment: ""
  }
});

var StudentCollection = Backbone.Collection.extend({
  model: Student,
  url: "/students"
});

