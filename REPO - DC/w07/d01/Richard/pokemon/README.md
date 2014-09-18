# Underscore.js: Gotta Catch 'Em All!

### Overview

Tired of writing for loops and wish you had all the awesome semantic enumerators that we had in Ruby? You can with [underscore.js!](http://underscorejs.org/)

* Your job will be to write the methods found in the pokemon.js file. The methods are namespaced behind the `pokemon` object.

* I've put the JSON of the pokemon data in the `js/data.js` file. You do not need to touch this file. You will have access to all of the data using `pokemon.pokemonList`

* I've written stubs for a few methods that you are going to write:
-  printAllPokemonNamesToConsole
  - prints all pokemon names to the console
-  findPokemonByName
  - takes a name as an argument and returns an object
  - `pokemon.findPokemonByName("Pikachu"); => Object {id: "025", name: "Pikachu", img: "http://img.pokemondb.net/artwork/pikachu.jpg", type: Array[1], stats: Object…}`
-  findStrongestPokemon
  - returns the strongest pokemon(highest attack stats)
  - `pokemon.findStrongestPokemon(); => Object {id: "149", name: "Dragonite", img: "http://img.pokemondb.net/artwork/dragonite.jpg", type: Array[2], stats: Object…}`
-  findPokemonByType
  - returns a list of all of the pokemon of a particular type
  - `pokemon.findPokemonByType("Ghost"); => [Object, Object, Object]` (Where the objects are Gastly, Haunter and Gengar)
-  findAllTypes
  - returns a list of the unique pokemon types
  - `pokemon.findAllTypes(); => ["Grass", "Poison", "Fire", "Flying", "Water", "Bug", "Normal", "Electric", "Ground", "Fighting", "Psychic", "Rock", "Steel", "Ice", "Ghost", "Dragon"]`
-  totalStats
  - sums up all the stat numbers for a particular pokemon
  - `pokemon.totalStats("Jigglypuff"); => 270`

# Bonus

* Peruse the underscore.js docs for other interesting / useful functions and figure out how they work.

* When you have some free time, it's also worth checking out the [annotated source code](http://underscorejs.org/docs/underscore.html) to see how the library works under the hood.
