define(function(require) {

  var Backbone = require("backbone");

  var WatchlistModel = Backbone.Model.extend({
    defaults: {
      title: "",
      imdb_id: ""
    }
  });

  var WatchlistCollection = Backbone.Collection.extend({
    model: WatchlistModel,
    url: "/movies"
  });

  return new WatchlistCollection();
});
