var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function(){
    //_.pluck(allPokemon, 'name');
    _.each(allPokemon, function(monster){
      console.log(monster.name);
    });
  },

  findPokemonByName : function(name){
    var match =  _.find(allPokemon, function(monster){
      return monster.name === name;
    });
    return match;
  },

  findStrongestPokemon : function(){
    var match = _.max(allPokemon, function(monster){
      return parseInt(monster.stats.attack);
    });
    return match;
  },

  findPokemonByType : function(type){
    var match = _.filter(allPokemon, function(monster){
      return _.some(monster.type, function (typeOf){
        return typeOf === type;
      })
    });
    return match;
  },

  findAllTypes : function(){
   return  _.uniq(_.flatten(_.pluck(allPokemon, 'type')))
  },

  totalStats : function(name){
    return _.reduce(_.values(pokemon.findPokemonByName(name).stats), function(memo, num){ return parseInt(memo) + parseInt(num); })
  }
}
