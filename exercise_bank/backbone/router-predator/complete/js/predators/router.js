var PredatorRouter = Backbone.Router.extend({
  routes: {
    'predators': 'list',
    'predators/:id': 'detail',
    '*default': 'list'
  },

  clearView: function() {
    if (this.view) this.view.remove();
    this.view = null;
  },

  list: function() {
    this.clearView();
    this.view = new PredatorListView({collection: predatorsCollection});
    this.view.render().appendTo('#predator-container');
  },

  detail: function(id) {
    this.clearView();
    var predator = predatorsCollection.get(id);
    this.view = new PredatorDetailView({model: predator});
    this.view.render().appendTo('#predator-container');
  }
});

var router = new PredatorRouter();
Backbone.history.start();