var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function(){
    _.each(this.pokemonList, function(monster){
      console.log(monster.name);
    })
  },

  findPokemonByName : function(name){
    return _.find(this.pokemonList, function(monster){
      return name === monster.name;
    });
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
