var Character = Backbone.Model.extend({

  //the below is now made unneccesary by url in the collection variable
  //urlRoot: '/characters',
  defaults: {
    name: '',
    img_url: '',
    coins: 0
  },

  getCoin: function() {
    this.save('coins', this.get('coins') + 1);
  }

});

var CharacterCollection = Backbone.Collection.extend({
  model: Character,
  //make more sense to have the url below becuase we are using the collection to add and remove shite
  url: '/characters'
});
