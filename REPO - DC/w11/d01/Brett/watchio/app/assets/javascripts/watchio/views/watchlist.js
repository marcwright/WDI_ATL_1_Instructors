define(function(require) {

  var Backbone = require("backbone");
  var watchlistItems = require("../models/watchlist");

  var WatchlistView = Backbone.View.extend({
    el: "#watchlist",

    initialize: function() {
      this.listenTo(this.collection, "sync add remove", this.render);
      this.render();
    },

    render: function() {
      var html = "";

      this.collection.each(function(model) {
        html += "<li><a href='#movies/" + model.get("imdb_id") + "'>" + model.get("title") + "</a></li>";
      });

      this.$el.html(html);
    }
  });

  return new WatchlistView({collection: watchlistItems});
});
