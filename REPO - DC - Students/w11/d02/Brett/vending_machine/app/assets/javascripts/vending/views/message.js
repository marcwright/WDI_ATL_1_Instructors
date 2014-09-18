define (function(require) {
  var Backbone = require("backbone");
  var vendingModel = require("../models/vending");
  var currency = require('../helpers/currency');

  var MessageView = Backbone.View.extend({
    el: "#message",

    initialize: function() {
      this.listenTo(this.model, "change", this.render);
      this.render();
    },

    render: function() {
      var html = "";

      html += "Credit: "+ this.model.get("credit") +"<br>Selection: " + this.model.get("selection");
      this.$el.html(html);
    }
  });

  return new MessageView({model: vendingModel});
});
