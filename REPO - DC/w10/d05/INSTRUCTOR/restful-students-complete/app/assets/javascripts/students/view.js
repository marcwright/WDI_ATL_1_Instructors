// The Students List View:

var StudentsListView = Backbone.View.extend({
  tagName: 'div',
  className: 'students-list',
  template: _.template($('#students-list').html()),

  // Configures the view to re-render upon syncing with the API:
  initialize: function() {
    this.listenTo(this.collection, 'sync', this.render);
  },

  // Renders the list display based on collection contents:
  render: function() {
    var rendered = this.template({students: this.collection});
    return this.$el.html(rendered);
  },

  events: {
    'submit form': 'onSubmit'
  },

  // Triggered upon submitting the creation form:
  // creates a new collection model with the submitted name.
  onSubmit: function(evt) {
    evt.preventDefault();
    var name = this.$('[name="name"]').val();
    this.collection.create({name: name});
    this.$('input').val('');
  }
});


// The Students Detail View:

var StudentDetailView = Backbone.View.extend({
  tagName: 'div',
  className: 'student-detail',
  template: _.template($('#student-detail').html()),

  // Renders the detail view display:
  render: function() {
    var rendered = this.template(this.model.toJSON());
    return this.$el.html(rendered);
  },

  // Redirects the window location back to the list view:
  done: function() {
    window.location.href = '#students';
  },

  events: {
    'click #done': 'onDone',
    'click #remove': 'onRemove',
    'click #save': 'onSave'
  },

  // Triggered when the "done" button is clicked:
  onDone: function(evt) {
    evt.preventDefault();
    this.done();
  },

  // Triggered when the "save" button is clicked:
  onSave: function(evt) {
    evt.preventDefault();
    var data = this.$('input').serializeObject();
    this.model.save(data);
    this.done();
  },

  // Triggered when the "remove" button is clicked:
  onRemove: function(evt) {
    evt.preventDefault();
    if (window.confirm('Are you sure you want to delete this student?')) {
      this.model.destroy();
      this.done();
    }
  }
});
