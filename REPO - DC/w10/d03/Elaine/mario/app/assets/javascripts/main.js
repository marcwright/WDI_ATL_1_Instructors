$(function() {
  var characters = new CharacterCollection();
  var charactersView = new ListView({collection: characters});
  var formView = new FormView({collection: characters});
  characters.fetch();
});
