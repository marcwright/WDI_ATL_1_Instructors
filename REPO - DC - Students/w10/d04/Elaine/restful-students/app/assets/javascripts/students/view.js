
var StudentsListView = Backbone.View.extend({
  tagName: 'div',
  className: 'students-list',

  template: _.template($('#students-list').html()),

  events: {
    'submit': 'createStudent'
  },

  render: function() {
    var rendered = this.template({collection: this.collection});
    return this.$el.html(rendered);
  },

  createStudent: function(evt) {
    evt.preventDefault();

    var name = this.$('[name="name"]').val();
    this.$('[name="name"]').val('');

    this.collection.create({
      name: name
    });
  }

});


var StudentDetailView = Backbone.View.extend({
  tagName: 'div',
  className: 'student-detail',

  template: _.template($('#student-detail').html()),

  render: function() {
    var rendered = this.template(this.model.toJSON());
    return this.$el.html(rendered);
  }

});

