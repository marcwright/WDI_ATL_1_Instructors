var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function(){
    _.each(pokemon.pokemonList, function(monster) {
      console.log(monster.name);
    });
  },

  findPokemonByName : function(name){
    var match = _.find(pokemon.pokemonList, function(monster) {
      return monster.name === name
    });
    return match;
  },

  findStrongestPokemon : function(){
    var strongest = _.max(pokemon.pokemonList, function(monster) {
      return parseInt(monster.stats.attack)
    });
    return strongest;
  },

  findPokemonByType : function(type){
    var genus = _.filter(pokemon.pokemonList, function(monster) {
      return _.contains(monster.type, type) == true;
    })
    return genus;
  },

  findAllTypes : function(){
    return _.uniq(_.flatten(_.pluck(allPokemon, 'type')))
  },

  totalStats : function(name){
    poke = pokemon.findPokemonByName(name);
      var stats = _.toArray(poke.stats);
      return _.reduce(stats, function(memo, num){ return parseInt(memo) + parseInt(num); }, 0);
  }

}
