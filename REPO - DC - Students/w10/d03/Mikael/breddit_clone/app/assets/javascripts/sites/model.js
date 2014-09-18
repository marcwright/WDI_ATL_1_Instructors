var Site = Backbone.Model.extend({

  defaults: {
    title: "",
    site_url: "",
    rating: 0
  },

  ratingChange: function(mod) {
    this.save({rating: this.get('rating') + mod });
    this.collection.sort();
  }

});

var SiteCollection = Backbone.Collection.extend({
  model: Site,
  url: '/sites',
  comparator: function(model){
    return -model.get('rating');
  }
});
