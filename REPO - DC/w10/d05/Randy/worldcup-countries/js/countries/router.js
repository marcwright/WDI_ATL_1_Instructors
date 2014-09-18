
var CountriesRouter = Backbone.Router.extend({

  routes: {
    ':id': 'detail',
  },

  clearView: function(){
    if (this.view){
      this.view.remove();
    }
  },

  detail: function(id){
    this.clearView();
    countries.each(function(country){
      if (country['attributes'].alpha2Code === id){
      correctModel = country
      };
    });
    this.view = new CountryDetailView({model: correctModel});
    this.view.render().appendTo('#country-main');
  }

});
