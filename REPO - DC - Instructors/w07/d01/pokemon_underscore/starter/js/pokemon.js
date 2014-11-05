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
    return _.filter(this.pokemonList, function(pokemon){
      return _.contains(pokemon.type, type);
    });
  },

  findAllTypes : function(){
    var types = _.map(this.pokemonList, function(pokemon){
       return pokemon.type;
    });
      return _.uniq(_.flatten(types));
  },

  totalStats : function(name){
    var foundPokemon = this.findPokemonByName(name);
    return _.reduce(foundPokemon.stats, function(sum, stat){
      return sum + parseInt(stat);
    }, 0);
  }, 

  //Gerry's solution
  getAllPokemonNamesByType : function(){
    var allTypes = this.findAllTypes();
    var self = this;
    return _.map(allTypes, function(type) {
      var pokemonAsObjects = self.findPokemonByType(type);
      var pokemonNamesOnly =_.map(pokemonAsObjects, function(pokemon) {
        return pokemon.name;
      });
      return { type: type, pokemon: pokemonNamesOnly };
    });
  },

  //Mike's solution
  getAllPokemonNamesByType : function() {
      var results = [];
      _.each(this.findAllTypes(), function(type) {
        var res = { type : type, pokemon : [] };
        _.each(pokemon.findPokemonByType(type),
               function(d) { res.pokemon.push(d.name); });
        results.push(res);
      });
      return results;
    },

}