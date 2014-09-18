var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function(){
    _.each(allPokemon, function(pokemon) {
        console.log( pokemon.name );
    });
  },

  findPokemonByName : function(name){
    return _.find(allPokemon, function(pokemon) {
      return pokemon.name === name;
    });
  },

  findStrongestPokemon : function(){
    return _.sortBy(allPokemon, function(pokemon) {
      return (-1) * pokemon.stats['attack'];
    })[0];
  },

  findPokemonByType : function(type){
    return _.filter(allPokemon, function(pokemon) {
      return pokemon.type[0] === type || pokemon.type[1] === type;
    });
  },

  findAllTypes : function(){
    var types = _.reduce(allPokemon, function(res, pokemon){ return res.concat(pokemon.type); }, []);
    return _.uniq(types);
  },

  totalStats : function(name){
    var p = pokemon.findPokemonByName(name);
    return _.reduce(p.stats, function(memo, num){ return memo + parseInt(num); }, 0);
  }
}
