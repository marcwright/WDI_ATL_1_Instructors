/*
* @Author: Richard Hessler
* @Date:   2014-06-24 16:20:17
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-25 01:29:11
*/

//Create a "muppet-add" view which binds the HTML form to the muppets collection. Bind a "submit" event handler that passes form input into the collection.
var MuppetAddView = Backbone.View.extend({

  el: '#muppet-add',

  events: {
    'submit': 'onSubmit'
  },

  onSubmit: function(evt) {
    evt.preventDefault();

    var name   = this.$( '[name="name"]' ).val();
    var image  = this.$( '[name="image"]' ).val();
    var rating = this.$( '[name="rating"]').val();;

    this.collection.create({
      name:   name,
      image:  image,
      rating: rating
    });
  }
});

//Create a "muppets-list" view which binds the HTML list to the muppets collection. Have the list re-render whenever muppets are added, removed, or when a rating changes
var MuppetListView = Backbone.View.extend({

  el: '#muppet-list',

  initialize: function() {
    this.listenTo( this.collection, 'add remove change sync', this.render );
    this.render();
  },

  render: function() {
    var html = '';

    //For each muppet list item, render the Muppet's name, image, and current rating. Also include three buttons for each muppet:
    this.collection.each( function( model ) {
      // X: removes the muppet from the list.
      // UP: calls `upvote(-1)` on the muppet, then resorts the collection.
      // DOWN: calls `upvote(1)` on the muppet, then resorts the collection.
      html += '<li><button value="1" data-vote="' + model.cid + '">&#x2191;</button><button value="-1" data-vote="' + model.cid + '">&#x2193;</button>' + '<img src="' + model.get( 'image' ) + '"> ' + model.get( 'name' ) + ' ' + model.get( 'rating' ) + ' <button data-remove="' + model.cid + '">X</button></li>';
    });

    this.$el.html(html);
  },

  // Listens for specific events
  events: {
    'click [data-remove]' :  'onRemove',
    'click [data-vote]'   :  'vote'
    },

  // function to delete item from localStorage
  onRemove: function( evt ) {
    var cid   =  $( evt.target ).data( 'remove' );
    var model =  this.collection.get( cid );
    model.destroy();
    },

  // function to grab clicked model in collection and pass to
  // model upvote function
  vote: function( evt ) {
    var cid   =   $( evt.target ).data('vote');
    var model =   this.collection.get(cid);
    var value =   parseInt( $( evt.target ).val());
    model.upvote( value );
  }
});

muppets.fetch().then( function() {
  var muppetAddView  =  new MuppetAddView( { collection: muppets } );
  var muppetListView =  new MuppetListView( { collection: muppets } );
});
