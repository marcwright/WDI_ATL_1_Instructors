console.log('list_view.js connected');

define(function(require) {
  var Backbone = require('backbone');
  var turtlesCollection = require('../models/turtle');
  var _ = require('underscore');
  var listText = require('text!../templates/list.html');
  
  var TurtleListView = Backbone.View.extend({
    el: '.content-wrapper',
    template: _.template(listText),

    initialize: function(){
      this.listenTo(this.collection, 'sync', this.render);
      this.render();
    },


    render: function() {
      var html = '';
      this.collection.each(function(model){
        html += this.template(model.toJSON());
    // 'this' resets the scope to the render function instaed of 'collection'
      }, this);
      return this.$el.html(html);
    }
  });
  
  var testingView = new TurtleListView({ collection: turtlesCollection });
    testingView.render().appendTo('.content-wrapper');

});

