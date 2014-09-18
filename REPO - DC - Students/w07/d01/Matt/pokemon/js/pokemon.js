var pokemon = {

  pokemonList : allPokemon,

  // return all pokemen
  printAllPokemonNamesToConsole : function(){
    _.each(pokemon.pokemonList, function(monster){
      return console.log(monster.name);
    });
  },

  // to run this: pokemon.findPokemonByName('Pikachu');
  findPokemonByName : function(name){
    var match = _.find(pokemon.pokemonList, function(monster){
      return monster.name === name
    });
    return match;
  },

  // find pokemon with the strongest attack stats
  findStrongestPokemon : function(){
    var maxStrength = _.max(pokemon.pokemonList, function(monster){
      return parseInt(monster.stats.attack);
    });
    return maxStrength;
  },

  // find by a specific type
  findPokemonByType : function(type){
    var match = _.filter(pokemon.pokemonList, function(monster) {
    return _.any(monster.type, function(typeOf){
      return typeOf == type
    })})
    return match;
  },

  // return all types of pokemen
  findAllTypes : function(){
    return  _.uniq(_.flatten(_.pluck(allPokemon, 'type')))
  },

  // find total stats for a specific pokeman
  totalStats : function(name){
    return _.reduce(_.values(pokemon.findPokemonByName(name).stats),
      function(memo, stat){
        return parseInt(memo) + parseInt(stat);
      })
  }
}
