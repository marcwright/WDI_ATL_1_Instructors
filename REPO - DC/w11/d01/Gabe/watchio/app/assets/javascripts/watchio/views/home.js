define(function(require){

  var Backbone = require('backbone');
  var homeview = require('../templates/homeHTML');

  var HomeView = Backbone.View.extend({
    tagName: 'div',

    render: function(){
        return this.$el.html(homeview);
    }
  });

  //Export a new instance of HomeView
  return new HomeView();
});
