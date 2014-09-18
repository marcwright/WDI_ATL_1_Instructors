/*
* @Author: stephenstanwood
* @Date:   2014-06-24 14:43:11
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-24 16:42:48
*/

var MuppetAddView = Backbone.View.extend({
  el: '#muppet-add',

  events: {
    'submit': 'onSubmit'
  },

  onSubmit: function( e ) {
    e.preventDefault();
    this.collection.create({
      name: this.$( '[name="name"]' ).val(),
      image: this.$( '[name="image"]' ).val(),
      rating: parseInt( this.$( '[name="rating"]' ).val() )
    });

    this.$( 'input' ).val( '' );
  }
});

var MuppetsListView = Backbone.View.extend({
  el: '#muppet-list',

  initialize: function() {
    this.listenTo( this.collection, 'add remove change:rating', this.render );
    this.render();
  },

  render: function() {
    var html = '';

    for ( var i = 0, n = muppets.length; i < n; i++ ) {
      var m = muppets.at( i );

      html += '<li>' + m.toString();
      html += '<button data-remove="' + m.cid + '">X</button>';
      html += '<button data-up="' + m.cid + '">UP</button>';
      html += '<button data-down="' + m.cid + '">DOWN</button>';
    }

    this.$el.html( html );
  },

  events: {
    'click [data-remove]': 'onRemove',
    'click [data-up]': 'onUpVote',
    'click [data-down]': 'onDownVote'
  },

  onRemove: function( e ) {
    var cid = $( e.target ).attr( 'data-remove' );
    this.collection.get( cid ).destroy();
  },

  onUpVote: function( e ) {
    var cid = $( e.target ).attr( 'data-up' );
    this.collection.get( cid ).upvote( 1 );
    this.collection.sort();
    this.render();
  },

  onDownVote: function( e ) {
    var cid = $( e.target ).attr( 'data-down' );
    this.collection.get( cid ).upvote( -1 );
    this.collection.sort();
    this.render();
  }

});

muppets.fetch().then( function() {
  new MuppetAddView( { collection: muppets } );
  new MuppetsListView( { collection: muppets } );
});


