var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function(){
    // _.pluck(allPokemon, 'name')
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
    var match = _.max(allPokemon, function(monster){
      parseInt(monster.stats.attack)
    });
    return match;
  },

  findPokemonByType : function(type){
    var match =_.filter(allPokemon, function(monster) {
    return _.any(monster.type, function(typeOf){
      return typeOf == type;
      })
    });
    return match;
  },

  findAllTypes : function(){
    var types =_.uniq(_.flatten(_.pluck(allPokemon, 'type')));
    return types;
  },

  totalStats : function(name){
    var monster = _.reduce((_.values((_.findWhere(allPokemon, {name: name})).stats)).map(function(x){return parseInt(x,10)}), function(memo, num){ return memo + num; }, 0);
    return monster;
  }

}
