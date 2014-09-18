define(function(require) {
  var Backbone = require('backbone');
  var templateText = require('text!../templates/homeTemplate.html');

  var HomeView = Backbone.View.extend({
    //el: '.watchio-home',
    tagName: 'div',
 
    render: function() {
      return this.$el.html(templateText);
    }
  });
  return HomeView;
});
