var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function(){
    _.each(this.pokemonList, function(monster){
      console.log(monster.name);
    });
  },

  findPokemonByName : function(name){
    return _.find(pokemon.pokemonList, function(monster){
      return monster.name === name
    });
  },

  findStrongestPokemon : function(){
    return _.max(pokemon.pokemonList, function(monster){
      return monster.attack
    });
  },

  findPokemonByType : function(type){
  },

  findAllTypes : function(){
  },

  totalStats : function(name){
  }
}
