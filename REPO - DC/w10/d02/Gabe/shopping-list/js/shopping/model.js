
//CREATES THE MODEL FOR AN ITEM BEING ADDED TO LIST
var ItemModel = Backbone.Model.extend({

  //the deaults are a name, and a quantity
  defaults: {

    name: '',
    quantity: 0

  }




});


//CREATES A COLLECTION OF MODELS (A COLLECTION OF ITEMS)
var ItemsCollection = Backbone.Collection.extend({

  model: ItemModel,
  localStorage: new Backbone.localStorage('shopping')

});

var items = new ItemsCollection();
