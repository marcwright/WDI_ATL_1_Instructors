define(function(require) {

  var Backbone = require("backbone");
  var searchResults = require("../models/search");
  // var _ = require("underscore");
  // var templateText = require("text!../templates/searchresults.html")

  var SearchView = Backbone.View.extend({
    el: "#search",

    initialize: function() {
      this.listenTo(this.collection, "sync", this.render);
      this.render();
    },

    events: {
      "submit form": "onSubmit",
      "change [name='search-results']": "onSelectResult"
    },

    onSubmit: function(event) {
      event.preventDefault();
      var searchTerm = this.$("[name='search']").val();
      this.collection.search(searchTerm);

      this.$("form").val("");
    },

    onSelectResult: function(event) {
      event.preventDefault();
      var selection = this.$(event.target).val();
      window.location.hash = selection;
    },

    render: function() {
      var html = "";

      this.collection.each(function(model) {
        html += "<option value='#movies/" + model.get("imdbID") + "'>" + model.get("Title") + "</option>";
      });

      this.$("[name='search-results']").html(html);
    }

  });

return new SearchView({collection: searchResults});
});
