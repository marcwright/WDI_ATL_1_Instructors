var Country = Backbone.Model.extend({
  defaults: {
    code: '',
    name: '',
    isPlaying: false,
    isEliminated: false
  }
});

// Countries Collection (freebie...)
// Calling "fetch" will check local storage, then go get data for you if it needs it:
// You don't need to do anything here!

var Countries = Backbone.Collection.extend({
  model: Country,
  localStorage: new Backbone.LocalStorage('countries'),

  fetch: function() {
    // Check if "countries" exists within local storage:
    if (!localStorage.getItem('countries')) {
      var self = this;

      // Load JSON data, and return XHR promise.
      return $.getJSON('http://restcountries.eu/rest/v1', function(countries) {

        // Reset collection with loaded data:
        self.reset(_.map(countries, function(country) {
          return {name: country.name, code: country.alpha2Code.toLowerCase()};
        }));

        // Save all models asynchronously after the request:
        function save(index) {
          if (index < self.length) {
            self.at(index).save();
            setTimeout(function() { save(index+1); }, 0);
          }
        }

        save(0);
      });
    }

    // Otherwise, use the native Backbone.Collection fetch implementation:
    return Backbone.Collection.prototype.fetch.apply(this, arguments);
  }
});