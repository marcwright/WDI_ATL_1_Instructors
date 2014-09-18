define(function(require) {

  var Backbone = require("backbone");
  var _ = require("underscore");
  var detailHTML = require("text!../templates/detail.html");
  var watchlist = require("../models/watchlist");

  var DetailView = Backbone.View.extend({
    tagName: "div",
    template: _.template(detailHTML),

    initialize: function() {
      this.listenTo(this.model, "sync", this.render);
      this.listenTo(watchlist, "add remove sync", this.renderButtonText);
    },

    events: {
      "click #watchlist-toggle": "onSave"
    },

    onSave: function(event) {
      event.preventDefault();

      var title = this.model.get("Title");
      var imdbID = this.model.get("imdbID")

      var saved = watchlist.findWhere({imdb_id: imdbID});

      if (saved) {
        saved.destroy();
        this.$("event.target").text("Add to watchlist");
      } else {
        watchlist.create({
          title: title,
          imdb_id: imdbID
        });

        this.$("event.target").text("Remove from watchlist");
      }

    },

    render: function() {
      var rendered = this.template(this.model.toJSON());
      this.$el.html(rendered);
      this.renderButtonText();
      return this.$el
    },

    renderButtonText: function() {
      var imdbID = this.model.get("imdbID")
      var saved = watchlist.findWhere({imdb_id: imdbID});

      if (saved) {
        this.$("#watchlist-toggle").text("Remove from watchlist");
      } else {
        this.$("#watchlist-toggle").text("Add to watchlist");
      }

    }
  });

  return DetailView;
});
