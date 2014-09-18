var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function() {
    _.each(pokemon.pokemonList, function(monster) {
    console.log(monster.name);    
  });
  },
  
  // to run this: pokemon.findPokemonByName('Pikachu');
  findPokemonByName : function(name){
    var match = _.find(pokemon.pokemonList, function(monster){
      return monster.name === name
    });
    return match;
  },

  findStrongestPokemon : function(){
  },

  findPokemonByType : function(type){
  },

  findAllTypes : function(){
  },

  totalStats : function(name){
  }
}
