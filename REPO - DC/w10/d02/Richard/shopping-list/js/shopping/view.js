/*
* @Author: Richard Hessler
* @Date:   2014-06-24 14:41:47
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-24 15:35:51
*/

var ItemAddView = Backbone.View.extend({

  el: '#item-add',

  events: {
    'submit': 'onSubmit'
  },

  //do this on submit
  onSubmit: function(evt) {
    //prevent page refresh
    evt.preventDefault();

    //create the item attributes of name and quantity based on input
    //fields in form and name attributes
    var name = this.$( '[name="name"]' ).val();
    var quantity = this.$( '[name="quantity"]' ).val();
    this.collection.create({
      name: name,
      quantity: quantity
    });
  }
});


//A view to print out all list items
var ItemListView = Backbone.View.extend({

  el: '#item-list',

  initialize: function() {
    this.listenTo( this.collection, 'add remove', this.render );
    this.render();
  },

  render: function() {
    var html = '';

    this.collection.each( function( model ) {
      html += '<li>' + model.get( 'name' ) + ' (' + model.get( 'quantity') + ') <button data-remove="' + model.cid + '">X</button></li>';
    });

    this.$el.html(html);
  },

  events: {
    'click [data-remove]': 'onRemove'
  },

  onRemove: function(evt) {
    var cid = $(evt.target).data('remove');
    var model = this.collection.get(cid);
    model.destroy();
  }
});

items.fetch().then( function() {
  var itemAddView = new ItemAddView( { collection: items } );
  var itemListView = new ItemListView( { collection: items } );
});
