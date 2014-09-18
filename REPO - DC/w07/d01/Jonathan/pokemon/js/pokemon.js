var pokemon = {

  pokemonList : allPokemon,

// pokemon.printAllPokemonNamesToConsole();
  printAllPokemonNamesToConsole : function(){
    _.each(pokemon.pokemonList, function(monster){
      console.log(monster.name);
    });
  },

// pokemon.findPokemonByName('Abra');
  findPokemonByName : function(name){
    var match = _.find(pokemon.pokemonList, function(monster){
      return monster.name === name});
      return match;
  },

  // _.findWhere = function(obj, attrs) {
  //   return _.find(obj, _.matches(attrs));
  // };

  findStrongestPokemon : function(){
  },

  findPokemonByType : function(type){
  },

  findAllTypes : function(){
  },

  totalStats : function(name){
  }
}
