/*
* @Author: stephenstanwood
* @Date:   2014-06-27 12:42:39
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-27 20:13:44
*/

var router;

countries = new CountryCollection();
countries.fetch().then( function() {
  countryListView = new CountryListView({ collection: countries });
  router = new CountriesRouter();
  Backbone.history.start();
});
