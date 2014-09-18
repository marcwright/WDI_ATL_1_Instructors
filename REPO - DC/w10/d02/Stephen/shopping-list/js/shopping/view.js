/*
* @Author: stephenstanwood
* @Date:   2014-06-24 14:43:11
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-24 15:35:24
*/

var ItemAddView = Backbone.View.extend({
  el: '#item-add',

  events: {
    'submit': 'onSubmit'
  },

  onSubmit: function( e ) {
    e.preventDefault();
    this.collection.create({
      name: this.$( '[name="name"]' ).val(),
      quantity: parseInt( this.$( '[name="quantity"]' ).val() )
    });

    this.$( 'input' ).val( '' );
  }
});

var ItemsListView = Backbone.View.extend({
  el: '#item-list',

  initialize: function() {
    this.listenTo( this.collection, 'add remove sync', this.render );
    this.render();
  },

  render: function() {
    var html = '';

    for ( var i = 0, n = items.length; i < n; i++ ) {
      var m = items.at( i );
      html += '<li>' + m.toString() + '<button data-remove="' + m.cid + '">X</button></li>';
    }

    this.$el.html( html );
  },

  events: {
    'click [data-remove]': 'onRemove'
  },

  onRemove: function( e ) {
    var cid = $( e.target ).attr( 'data-remove' );
    this.collection.get( cid ).destroy();
  }
});

items.fetch().then(function() {
  new ItemAddView( { collection: items } );
  new ItemsListView( { collection: items } );
});


