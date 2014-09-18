// A model for an individual character
var CharacterModel = Backbone.Model.extend ({
  defaults: {
    name: '',
    image: '',
    rating: 0
  },

  upVote: function() {
    var self = this;
    $.ajax({

    })
  },
});

// A collection of the characters
var CharactersCollection = Backbone.Collection.extend({
  model: CharacterModel,

  localStorage: new Backbone.LocalStorage('character')
})

var characters = new CharactersCollection();

characters.comparator = function(character) {
  return -character.get('rating');
};
