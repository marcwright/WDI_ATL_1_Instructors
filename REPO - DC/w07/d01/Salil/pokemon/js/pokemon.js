var pokemon = {

  pokemonList : allPokemon,

    printAllPokemonNamesToConsole : function(){
    _.each(pokemon.pokemonList, function(monster){
      console.log(monster.name);
    });
  },

   findPokemonByName : function(name){
    var match = _.find(pokemon.pokemonList, function(monster){
      return monster.name === name
    });
    return match;
  },

  findStrongestPokemon : function(){
    var match = _.max(pokemon.pokemonList, function(monster){
      return parseInt(monster.stats.attack);
    });
    return match;
  },

  findPokemonByType : function(type){
    var match = _.filter(pokemon.pokemonList, function(monster){
      return _.any(monster.type, function(typeOf){
        return typeOf == type
      });
    });
    return match
  },

  findAllTypes : function(){
  return  _.uniq(_.flatten(_.pluck(allPokemon, 'type')))
  },

  totalStats : function(name){
   var match = _.find(pokemon.pokemonList, function(monster){
      return monster.name === name
    });
   return _.reduce(match.stats, function(memo, num){ return (parseInt(memo) + parseInt(num)) ; }, 0)
 }
}
