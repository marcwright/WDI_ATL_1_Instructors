var CountryDetailView = Backbone.View.extend({
  tagName: "div",
  className: "country-detail",
  template: _.template($("#country-detail").html()),

  render: function() {
    var rendered = this.template(this.model.toJSON());
    return this.$el.html(rendered);
  },

  events: {
    "change [type='checkbox']": "onClick"
  },

  onClick: function(event) {
    if (event.target.name === "playing") {
      this.model.set({isPlaying: !this.model.get("isPlaying")});
    }
    if (event.target.name === "eliminated") {
      this.model.set({isEliminated: !this.model.get("isEliminated")});
    }
  }

});

var CountryListItemView = Backbone.View.extend({
  tagName: "li",

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
  },

  render: function() {
    var rendered = "<a href='#" + this.model.get("alpha2Code") + "'>" + this.model.get("name") + "</a>";
    if (this.model.get("isPlaying") === true) {
      this.$el.toggleClass("playing");
    }
    if (this.model.get("isEliminated") === true) {
      this.$el.toggleClass("eliminated");
    }
    return this.$el.html(rendered);
  }
});

var CountryListView = Backbone.View.extend({
  el: "#countries-list",

  initialize: function() {
    this.listenTo(this.collection, "sync reset", this.render);
    this.render();
  },

  render: function() {
    this.collection.each(function(country) {
      var countryListItem = new CountryListItemView({model: country});
      countryListItem.render().appendTo("#countries-list");
    });
  }
});
