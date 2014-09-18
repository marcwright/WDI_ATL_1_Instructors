/*
* @Author: stephenstanwood
* @Date:   2014-06-27 12:42:39
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-27 21:10:41
*/

var CountriesRouter = Backbone.Router.extend({
  routes: {
    ':id': 'detail'
  },

  clearView: function() {
    if ( this.view ) {
      this.view.remove();
    }
  },

  detail: function( alpha2Code ) {
    this.clearView();
    var m = countries.where({ alpha2Code: alpha2Code });

    this.view = new CountryDetailView({ model: m[0] });
    this.view.render().appendTo( '#country-main' );
  }
});
