var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function(){
      _.each(pokemon.pokemonList, function(pokemon) {
        console.log(pokemon.name);
      });
  },

  findPokemonByName : function(name){
      var myPokemon = _.find(pokemon.pokemonList, function(poke){
        return poke.name === name;
      });
      console.log(myPokemon);
  },

  findStrongestPokemon : function(){
    var strongPokemon = _.max(pokemon.pokemonList, function(pokemon) {
      return pokemon.stats.attack;
    });
    console.log(strongPokemon);
  },

  findPokemonByType : function(type){
    var typePokemon = _.where(pokemon.pokemonList, function(pokemon) {
      return pokemon.type === type;
    });
    console.log(typePokemon)
  },

  findAllTypes : function(){
    var uniqueTypes = _.unique(pokemon.pokemonList, function(pokemon) {
      return pokemon.type;
    })
    console.log(uniqueTypes);
  },

  totalStats : function(name){
    var pokemonWithStats = _.find(pokemon.pokemonList, function(pokemon) {
      return poke.name === name;
    })
      _.reduce(pokemonWithStats.stats, function(memo,stat) {
        return (memo + stat);
      }
    })
  }
}
