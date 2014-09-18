define(function(require){
  var Backbone = require('backbone');
  var countries = require('../models/countries');
  // Requires:
  // - Backbone

  var CountryListItemView = Backbone.View.extend({
    tagName: 'li',

    initialize: function() {
      this.listenTo(this.model, 'change', this.render);
      this.render();
    },

    render: function() {
      this.$el.toggleClass('playing', this.model.get('isPlaying'));
      this.$el.toggleClass('eliminated', this.model.get('isEliminated'));
      this.$el.html('<a href="#'+ this.model.get('alpha2Code') +'">'+ this.model.get('name') +'</a>');
    }
  });


  var CountryListView = Backbone.View.extend({
    el: '#countries-list',

    initialize: function() {
      this.listenTo(this.collection, 'sync reset', this.render);
      this.render();
    },

    render: function() {
      var list = document.createDocumentFragment();

      this.collection.each(function(model) {
        var item = new CountryListItemView({model: model});
        item.render();
        list.appendChild(item.el);
      });

      return this.$el.html(list);
    }
  });
  return new CountryListView({collection: countries});
});
