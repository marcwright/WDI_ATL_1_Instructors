define(function(require) {

  var Backbone = require("backbone");
  var homeText = require("text!../templates/home.html");

  var HomeView = Backbone.View.extend({
    tagName: "div",
    className: "watchio-home",

    initialize: function() {
      this.render();
    },

    render: function() {
      return this.$el.html(homeText);
    }
  });

return HomeView;
});
