var pokemon = {

  pokemonList : allPokemon,

  // to run this: pokemon.printAllPokemonNamesToConsole();
  printAllPokemonNamesToConsole : function(){
    _.each(pokemon.pokemonList, function(monster){
      console.log(monster.name);
    });
  },

  // Ruby corollary to the above:
  //  (pokemon.pokemonList).each do |monster|
  //    puts (monster.name)
  //  end

  //////////////////////////


  // to run this: pokemon.findPokemonByName('Pikachu');
  findPokemonByName : function(name){
    var match = _.find(pokemon.pokemonList, function(monster){
      return monster.name === name
    });
    return match;
  },

  findStrongestPokemon : function(){
    return _.max(pokemon.pokemonList, function(monster){
      return parseInt(monster.stats.attack); // If you didn't parseInt you got Parasect instead of Dragonite
    });
  },

  findPokemonByType : function(type){
    // _.filter is like .select in ruby
    return _.filter(pokemon.pokemonList, function(monster){
      return _.contains(monster.type, type);
    });
  },

  findAllTypes : function(){
    var types = _.map(pokemon.pokemonList, function(pokemon) {
      return pokemon.type;
    });
    return _.uniq(_.flatten(types)); // We need to flatten since some pokemon have 2 types
  },

  totalStats : function(name){
    var foundPokemon = pokemon.findPokemonByName(name);
    return _.reduce(foundPokemon.stats, function(sum, stat) {
      return sum + parseInt(stat);
    }, 0);
  }
}