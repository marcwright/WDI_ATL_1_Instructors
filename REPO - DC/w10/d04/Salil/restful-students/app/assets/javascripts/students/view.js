
var StudentsListView = Backbone.View.extend({
  tagName: 'div',
  className: 'students-list',
  template: _.template($('#students-list').html()),

  render: function(){
    var rendered = this.template({ collection: this.collecition });
    return this.$el.html(rendered);
  }
});

var StudentsDetailView = Backbone.View.extend({
  tagName: 'div',
  className: 'student-detail',
  template: _.template($('#student-detail').html()),

  render: function(){
    var rendered = this.template(this.model.toJSON());
    return this.$el.html(rendered);
  }
});


var view = new StudentsListView({ collection: studentsCollection });
view.render().appendTo('#student-container');

var detail = new StudentsDetailView({ collection: studentsCollection.at(0) });
view.render().appendTo('#student-container');
