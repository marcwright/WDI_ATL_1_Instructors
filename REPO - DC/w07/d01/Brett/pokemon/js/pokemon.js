var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function(){
   _.each(pokemon.pokemonList, function(monster) {
    console.log(monster.name);
   });
  },

  findPokemonByName : function(name){
    console.log(_.findWhere(pokemon.pokemonList, {"name": name}));
  },

  findStrongestPokemon : function(){
      var strongestPokemon = _.max(pokemon.pokemonList, function(monster){
        return monster.stats.attack; });
      console.log(strongestPokemon);
  },

  findPokemonByType : function(type){
    var match = _.filter(pokemon.pokemonList, function(monster){
      return _.contains(monster.type, type);
    });

    return match;
  },

  findAllTypes : function(){
    var types = [];
    _.each(pokemon.pokemonList, function(monster) {
      debugger;
      types.push(monster.type, function(element){ return element; }
        ));
    })

    return console.log(types);

  },

  totalStats : function(name){
  }
}
