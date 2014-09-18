var StudentsListView = Backbone.View.extend({
  tagName: 'div',

  template: _.template($('#students-list').html()),

  initialize: function(){
    this.listenTo(this.collection, 'add sync', this.render);
    this.render();
  },

  render: function(){
    var rendered = this.template({collection: this.collection});
    return this.$el.html(rendered);
  },

  events: {
    'submit': 'studentAdd'
  },

  studentAdd: function(evt){
    evt.preventDefault();
    console.log('submitted!');
    var name = this.$('[name="name"]').val();
    this.$('input').val('');

    this.collection.create({
      name: name
    });
  }


});

var StudentDetailView = Backbone.View.extend({
  tagName: 'form',
  className: 'student-detail',

  template: _.template($('#student-detail').html()),

  render: function(){
    console.log(this);
    var rendered = this.template(this.model.toJSON());
    return this.$el.html(rendered);
  }

});

var studentListView = new StudentsListView({collection: studentsCollection});
studentListView.render().appendTo('#students-container');

var studentDetailView = new StudentDetailView({collection: studentsCollection});
studentDetailView.render().appendTo('#students-container');

