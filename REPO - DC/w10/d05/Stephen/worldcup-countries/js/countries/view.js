/*
* @Author: stephenstanwood
* @Date:   2014-06-27 12:42:39
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-27 21:45:26
*/

var CountryDetailView = Backbone.View.extend({
  tagName: 'div',
  className: 'country-detail',

  events: {
    'change [name="eliminated"]' : 'onElimination',
    'change [name="playing"]' : 'onPlaying'
  },

  onElimination: function() {
    this.model.toggleElimination();
    var status = this.model.get( 'isEliminated' );
    $( '[name="[eliminated]"]' ).prop( 'checked', status );
  },

  onPlaying: function() {
    this.model.togglePlaying();
    var status = this.model.get( 'isPlaying' );
    $( '[name="[playing]"]' ).prop( 'checked', status );
  },

  template: _.template( $( '#country-detail' ).html() ),

  render: function() {
    var rendered = this.template( this.model );
    return this.$el.html( rendered );
  }
});

var CountryListItemView = Backbone.View.extend({
  tagName: 'li',

  initialize: function() {
    this.listenTo( this.model, 'change', this.render );
    this.render();
  },

  render: function() {
    var html = '<a href="#' + this.model.alpha2Code + '">' + this.model.name + '</a>';
    this.$el.html( html );

    if ( this.model.get( 'isPlaying' ) ) {
      this.$el.addClass( 'playing' );
    } else {
      this.$el.removeClass( 'playing' );
    }

    if ( this.model.get( 'isEliminated' ) ) {
      this.$el.addClass( 'eliminated' );
    } else {
      this.$el.removeClass( 'eliminated' );
    }
  }
});

var CountryListView = Backbone.View.extend({
  el: '#countries-list',

  initialize: function() {
    this.listenTo( this.collection, 'sync reset', this.render );
    this.render();
  },

  render: function() {
    this.$el.empty();

    for ( var i = 0, n = this.collection.length; i < n; i++ ) {
      var view = new CountryListItemView({ model : this.collection.at( i ) });
      this.$el.append( view.el );
    }
  }
});


