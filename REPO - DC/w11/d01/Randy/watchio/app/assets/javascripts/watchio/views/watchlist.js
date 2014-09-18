define(function(require){

  var Backbone = require('backbone');
  var watchListCollection = require('../models/watchlist');

  var WatchListView = Backbone.View.extend({
    el: '#watchlist',

    initialize: function(){
      this.listenTo(this.collection, 'sync', this.render);
      this.render();
    },

    render: function(){
      var html = '';
      this.collection.each(function(model){
        debugger
        html += '<li><a href="#movies/' + model.get('imdbID') + '">' + model.get('title') + '</a></li>';
      });
      this.$el.html(html);
    }

  });

  return new WatchListView({collection: watchListCollection});
});
