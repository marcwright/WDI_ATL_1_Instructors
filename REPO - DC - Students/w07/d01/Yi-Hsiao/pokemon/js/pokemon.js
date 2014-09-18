var pokemon = {

  pokemonList : allPokemon,

  printAllPokemonNamesToConsole: function(){
    _.each( this.pokemonList, function( element, index, list ) {
      pokemonName = element.name;
      console.log( pokemonName );
    });
  },

  findPokemonByName: function( name ){
    var match = _.find( this.pokemonList, function( myPokemon ) {
      return myPokemon.name == name;
    });

    return match;
  },

  findStrongestPokemon: function(){
    var strongestPokemon = _.max( this.pokemonList, function( myPokemon ) {
      return parseInt( myPokemon.stats.attack );
    });

    return strongestPokemon;
  },

  findPokemonByType: function( type ){
    var match = _.filter( this.pokemonList, function( myPokemon ) {
      return _.contains( myPokemon.type, type );
    });

    return match;
  },

  findAllTypes: function(){
    var typeValues = _.map( this.pokemonList, function( value, key, list) {
      return value.type;
    });

    var flattenValues = _.flatten( typeValues );
    var uniqueValues = _.unique( flattenValues );

    return uniqueValues;
  },

  totalStats: function( name ){
    var myPokemon = this.findPokemonByName( name );
    var sumStats = _.reduce( myPokemon.stats, function( memo, num ) {
      return memo + parseInt( num );
    }, 0 );

    return sumStats;
  }
};