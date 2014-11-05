var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole : function(){
    _.each(this.pokemonList, function(monster){
      console.log(monster.name);
    });
  },

  findPokemonByName : function(name){
    var thepokemoniwant = _.find(this.pokemonList, function(monster) {
      return monster.name === name;
    });
    return thepokemoniwant;
  },

  findStrongestPokemon : function(){
    return _.max(this.pokemonList, function(monster){
      return parseInt(monster.stats.attack);
    });
  },

  findPokemonByType : function(type){
    return _.filter(this.pokemonList, function(monster){
      return _.contains(monster.type, type);
    });
  },

  findAllTypes : function(){
    var types = _.map(this.pokemonList, function(pokemon) {
      return pokemon.type;
    });
    return _.uniq(_.flatten(types));
  },

  totalStats : function(name){
    var foundPokemon = this.findPokemonByName(name);
    return _.reduce(foundPokemon.stats, function(sum, stat) {
      return sum + parseInt(stat);
    }, 0);
  }
}