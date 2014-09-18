/*
* @Author: stephenstanwood
* @Date:   2014-06-24 14:43:11
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-24 15:27:39
*/

// a model ro individual shopping list items
var ItemModel = Backbone.Model.extend({
  defaults: {
    name: '',
    quantity: 0
  },

  toString: function() {
    return this.attributes.name + ' (' + this.attributes.quantity + ')';
  }
});

// a collection for a list of shopping items
var ItemsCollection = Backbone.Collection.extend({
  model: ItemModel,
  localStorage: new Backbone.LocalStorage( 'shopping' )
});

var items = new ItemsCollection();
