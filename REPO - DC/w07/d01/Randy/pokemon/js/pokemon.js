var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function(){
    _.each(pokemon.pokemonList, function(monster){
      console.log(monster.name);
    });
  },

  findPokemonByName : function(name){
    _.findWhere(pokemon.pokemonList, {name: name})
  },

  findStrongestPokemon : function(){
    _.max(pokemon.pokemonList, function(monster){ return parseInt(monster['stats'].attack) });
  },

  findPokemonByType : function(type){
    var match =_.filter(allPokemon, function(monster) {
    return _.any(monster.type, function(typeOf){
      return typeOf == type
})})
    return match;
  },

  findAllTypes : function(){
    return _.unique(_.flatten(_.pluck(allPokemon, 'type')))
  },

  totalStats : function(name){

    return _.reduce(_.values(_.findWhere(allPokemon, {name: name}).stats), function(memo, num){ return parseInt(memo) + parseInt(num);})
  }
}
