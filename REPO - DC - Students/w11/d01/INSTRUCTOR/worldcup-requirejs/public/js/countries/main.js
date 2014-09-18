define(function(require) {

  var Backbone = require('backbone');
  var countries = require('./models/countries');
  var router = require('./routers/routes');
  var listView = require('./views/list');

  countries.fetch().then(function() {
    Backbone.history.start();
  });

});
