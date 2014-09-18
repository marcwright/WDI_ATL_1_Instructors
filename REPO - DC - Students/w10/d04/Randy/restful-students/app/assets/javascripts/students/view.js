

var StudentsListView = Backbone.View.extend({
  tagName: 'div',
  className: 'students-list',

  template: _.template($('#students-list').html()),

  events: {
    "submit": "addStudent"
  },

  initialize: function() {
    this.listenTo(this.collection, "sync add", this.render);
  },

  render: function(){
    var rendered = this.template({collection: this.collection});
    return this.$el.html(rendered);
  },

  addStudent: function(evt) {
    evt.preventDefault();
    var name = this.$('[name="name"]').val();
    this.$('input').val('');

    this.collection.create({
      name: name
    });
  }
});
//========================================================//
var StudentDetailView = Backbone.View.extend({
  tagName: 'div',
  className: 'student-detail',

  template: _.template($('#student-detail').html()),

  events: {
    "click #save": "addStudentDetails",
    'click #remove': "onRemove",
    'click #done': 'onDone'
  },

  onDone: function(evt) {
    evt.preventDefault();
    window.location.hash = 'students'
  },

  render: function(){
    var rendered = this.template(this.model.toJSON());
    return this.$el.html(rendered);
  },

  addStudentDetails: function(evt){
    evt.preventDefault();
    var name = this.$('[name="name"]').val();
    var email = this.$('[name="email"]').val();
    var phone = this.$('[name="phone"]').val();
    var location = this.$('[name="location"]').val();
    var employment = this.$('[name="employment"]').val();

    this.model.save({
      name: name,
      email: email,
      phone: phone,
      location: location,
      employment: employment
    });
    window.location.hash = 'students'
  },

  onRemove: function(){
    this.model.destroy();
    location.hash = 'students';
  }
});

studentsCollection.fetch().then(function(){
});



