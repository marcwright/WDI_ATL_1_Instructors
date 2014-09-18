/*
* @Author: Richard Hessler
* @Date:   2014-06-24 14:41:47
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-24 14:56:56
*/


//
var ItemModel = Backbone.Model.extend({

  defaults: {
    name: '',
    quantity: 0
  }
});

// A collection for a list of shopping items

var ItemCollection = Backbone.Collection.extend({
  model: ItemModel,
  localStorage: new Backbone.LocalStorage( 'storage' )
});

var items = new ItemCollection();
