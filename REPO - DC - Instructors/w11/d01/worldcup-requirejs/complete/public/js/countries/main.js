define(function(require) {

  // Imports:

  var Backbone = require('backbone');
  var countries = require('./models/countries');
  var router = require('./routers/routes');
  var CountryListView = require('./views/list');

  // Implementation:

  var listView = new CountryListView({collection: countries});

  countries.fetch().then(function() {
    Backbone.history.start();
  });
});