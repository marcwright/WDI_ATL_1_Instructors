define(function(require){

  var Backbone = require('backbone');
  var detailview = require('../templates/detailHTML');

  var DetailView = Backbone.View.extend({
    tagName: 'div',

    render: function(){
        return this.$el.html(detailview);
    }
  });

  //Export a new instance of HomeView
  return new DetailView();
});
