var StudentsListView = Backbone.View.extend({
  tagName: 'div',
  className: 'students-list',

  initialize: function() {
    this.listenTo(this.collection, 'add', this.render);
  },

  template: _.template($('#students-list').html()),

  render: function() {
    var rendered = this.template({collection: this.collection});
    return this.$el.html(rendered);
  },

  events: {
    'submit': 'createStudent'
  },

  createStudent: function(evt) {
    evt.preventDefault();
    this.collection.create({name: $('[name="name"]').val()});
  }

});

var studentList = new StudentsListView({collection: studentsList});
studentList.render().appendTo('#students-container');

