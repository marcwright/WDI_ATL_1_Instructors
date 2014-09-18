define(function(require) {

  // Imports:
  var Backbone = require('backbone');

  // Implementation:

  var StudentsListView = Backbone.View.extend({
    tagName: 'div',
    className: 'students-list',
    template: _.template(require('text!../templates/list.html')),
    
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

  return StudentsListView;
});