define(function(require) {
  
  // Imports:

  var Backbone = require('backbone');
  var _ = require('underscore');

  // Implementation:
  
  var HomeView = Backbone.View.extend({
    tagName: 'div',
    className: 'main-home',
    template: _.template( require('text!../templates/home.html') ),

    render: function() {
      return this.$el.html(this.template());
    }
  });

  return HomeView;
});