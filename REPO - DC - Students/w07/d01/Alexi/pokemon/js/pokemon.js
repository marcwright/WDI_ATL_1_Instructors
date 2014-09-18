var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function(){
    _.each(pokemon.pokemonList, function(monster){
      console.log(monster.name);
    });
  },
  //--> pokemon.printAllPokemonNamesToConsole()

  findPokemonByName : function(name){
    var match = _.find(pokemon.pokemonList, function(monster){
      return monster.name === name;
    });
    return match;
  },  
  // --> pokemon.findPokemonByName()

  findStrongestPokemon : function(){
    var strongest = _.max(pokemon.pokemonList, function(monster){
      return parseInt(monster.stats.attack)
    });
    return strongest;
  },

  findPokemonByType : function(type){
    var ptype = _.select(pokemon.pokemonList, function(monster){
      return _.contains(monster.type, type) === true;
    });  
    console.log(ptype);
  },

  findAllTypes : function(){
    return _.uniq(_.flatten(_.pluck(pokemon.pokemonList, "type")));
  },

  totalStats : function(name){
    return _.reduce(_.values(pokemon.findPokemonByName(name).stats), function(memo, num){
      return parseInt(memo) + parseInt(num);});
  }
}
