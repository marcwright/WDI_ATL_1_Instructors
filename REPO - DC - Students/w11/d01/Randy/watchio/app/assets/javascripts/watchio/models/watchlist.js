define(function(require){

  var Backbone = require('backbone');

  var WatchListModel = Backbone.Model.extend({
    defaults: {
      title: '',
      imdbID: '',
      id: '',

    }
  });

  var WatchListCollection = Backbone.Collection.extend({
    model: WatchListModel,
    url: '/movies'
  });
  return new WatchListCollection();
});
