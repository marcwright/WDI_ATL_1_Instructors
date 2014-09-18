var CountryRouter = Backbone.Router.extend({
  routes: {
    ":id": "detail"
  },

  initialize: function(options) {
    this.collection = options.collection;
  },

  setView: function(newView) {
    if (this.view) {
      this.view.remove();
    }

    this.view = newView;
    this.view.render().appendTo("#country-main");
  },

  detail: function(id) {
    var view = new CountryDetailView({model: this.collection.findWhere({alpha2Code: id})});
    this.setView(view);
  }
})
