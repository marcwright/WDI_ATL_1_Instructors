var StudentsListView = Backbone.View.extend({
// We tell the view how to render
  tagName: 'div',
  className: 'students-list',
  template: _.template($('#students-list').html()),


// MODEL --> Need logic to communicate with model
  initialize: function(){
    this.listenTo(this.collection, 'sync', this.render );
  },

// DOM --> Execution logic: use the given template and fill it with info
  render: function(){
    var rendered = this.template({});
    return this.$el.html(rendered);
  },

// Behavior: When an event occurs, run a function. The function is defined below
  events: {
    'submit' : 'createStudent'
  },

// Function will talk to the model when a user enters something into a form
  createStudent: function(evt){
    evt.preventDefault();
    var name = this.$('[name="name"]').val();
    this.$('input').val('');

    this.collection.create({
      name: name
    });
  }
});

// We have a lot of code on this page. But a user won't see any of this code
// until it's instantiated.
var studentsList = new StudentsCollection();
var studentsView = new StudentsListView({ collection: studentsCollection})
  studentsView.render().appendTo('#students-container')

