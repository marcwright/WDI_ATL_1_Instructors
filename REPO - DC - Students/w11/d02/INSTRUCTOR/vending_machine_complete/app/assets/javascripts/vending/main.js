define(function(require) {
  
  // Imports:

  // Bring in USJ to enable Rails Ajax security...
  var jquery_ujs = require('jquery_ujs');

  // Import all models and views:
  var vending = require('./models/vending');
  var products = require('./models/products');
  var changeView = require('./views/change');
  var creditView = require('./views/credit');
  var keypadView = require('./views/keypad');
  var messageView = require('./views/message');
  var productsView = require('./views/products');
  var purchasesView = require('./views/purchases');

  // Implementation:

  // Fetch data
  vending.fetch();
  products.fetch();
});