define(function(require){

  var Backbone = require('backbone');
  var _ = require('underscore');
  var watchList = require('../models/watchlist');
  var detailHTML = require('text!../templates/detail.html');

  var DetailView = Backbone.View.extend({
    tagName: 'div',

    template: _.template(detailHTML),

    events: {
      'click #watchlist-toggle': 'onSave'
    },

    onSave: function(evt){
      evt.preventDefault();
      //if (watchList.findWhere({title: this.model.get('Title')}) === undefined){
        var title = this.model.get('Title');
        var imdbID = this.model.get('imdbID');
        watchList.create({title: title, imdbID: imdbID});
        evt.target.textContent = "Remove from Watchlist";
      // } else {
      //   evt.target.textContent = "Add to Watchlist";
      // }
    },

    initialize: function(){
      this.listenTo(this.model, 'sync change add remove', this.render);
    },

    render: function(){
      var rendered = this.template(this.model.toJSON());
      // if (watchList !== null && watchList.findWhere({imdbID: this.model.get('imdbID')}) === undefined){
      //   $("#watchlist-toggle").textContent = "Add to Watchlist";
      // } else if (watchList !== null && watchList.findWhere({imdbID: this.model.get('imdbID')}) !== undefined){
      //   $("#watchlist-toggle").textContent = "Remove from Watchlist";
      // }

      return this.$el.html(rendered);
    },
  });
  return DetailView;
});
