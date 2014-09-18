define(function(require) {

  var Backbone = require('backbone');
  var _ = require('underscore');
  var detailHTML = require('text!../templates/detail.html');

  var DetailView = Backbone.View.extend({
    tagName: 'div',
    template: _.template(detailHTML),

    initialize: function() {
      this.listenTo(this.model, 'sync', this.render);
    },

    render: function() {
      var rendered = this.template(this.model.toJSON());
      return this.$el.html(rendered);
    }
  });

  return DetailView;
});
