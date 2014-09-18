// ### CountryDetailView

// - Give it a "div" tag with a class of "country-detail".

// - Make it render using the provided "#country-detail" template (the image uses a lower-cased "alpha2Code").

// - Setup "change" event handlers for the checkbox inputs. Have each checkbox set its value into the view's model.


// ### CountryListItemView

// - It will be instanced with a Country model.

// - Give it an `li` tag.

// - Make the view listen to its model. The view should re-render itself on model "change".

// - **When the view renders:**
//   - toggle a "playing" class on the view's element if the model "isPlaying".

//   - toggle an "eliminated" class on the view element if model "isEliminated".

//   - Display the country's name text, and link it to "#{{ alpha2Code }}".

// ### CountryListView

// - It will be instanced with a Countries collection.

// - Attach this view to the "#countries-list" document element.

// - Make the view re-render when its collection triggers "sync" or "reset".

// - **When the view renders:** clear its current content, and then append a new `CountryListItemView` for each model in the collection.

//CountryDetailView
var CountryDetailView = Backbone.View.extend({
  tagName: 'div',
  className: 'country-detail',
  template: _.template($('#country-detail').html()),

  initialize: function(){
    this.listenTo($('#checkbox'), 'change', this.render);
  },

  render: function(){

    var rendered = this.template({country: this.model});
    this.$el.html(rendered);
  }

});

//CountryListItemView
var CountryListItemView = Backbone.View.extend({
  model: Country,
  tagName: 'li',


  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
  },

  render: function(){

    var rendered = this.template({model: this.model});
    this.$el.html(rendered);
  }
});


//CountryListView
var CountryListView = Backbone.View.extend({
  tagName: 'ul',
  collection: CountriesCollection,
  className: 'countries-list',
  template: _.template($('#countries-list').html()),

  render: function(evt) {
    evt.preventDefault();
    var rendered = this.template({collection: this.collection});
    this.$el.html(rendered);
    this.$el.reset();
  }
});
