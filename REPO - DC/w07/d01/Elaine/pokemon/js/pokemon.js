var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function(){
    _.each(pokemon.pokemonList, function(monster){
      console.log(monster.name);
    });
  },

  findPokemonByName : function(name){
    var enteredName = prompt('Enter the name of a pokemon.')
    return _.find(pokemon.pokemonList, function(monster){
      return monster.name === enteredName });
  },

  findStrongestPokemon : function(){
    return _.max(pokemon.pokemonList, function(monster){
      return parseInt(monster.stats.attack);
    });
  },

  findPokemonByType : function(type){
    var enteredType = prompt('Enter a type.')
    match = _.filter(pokemon.pokemonList, function(monster){
      return monster.type[0] === enteredType || monster.type[1] === enteredType
    });
    return match
  },

  findAllTypes : function(){
    var allTypes = []
    return _.pluck(pokemon.pokemonList, function(monster){
      return _.monster.type
        _.each(pokemon.pokemonList, function(element, index){
          allTypes.push(element)
      });
    });

    uniqueTypes = allTypes.filter(function(element, index) {
      return allTypes.indexOf(element) == index;
    });
    return uniqueTypes;
  },

  totalStats : function(name){
  }
}
