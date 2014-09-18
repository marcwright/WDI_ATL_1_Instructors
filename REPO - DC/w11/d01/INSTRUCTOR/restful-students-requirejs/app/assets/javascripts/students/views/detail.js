define(function(require) {

  // Imports:
  var Backbone = require('backbone');

  // Implementation:

  var StudentDetailView = Backbone.View.extend({
    tagName: 'div',
    className: 'student-detail',
    template: _.template(require('text!../templates/detail.html')),

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

  return StudentDetailView;
});