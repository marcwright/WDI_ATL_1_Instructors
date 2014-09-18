#Intro to CoffeeScript
"Write less code to get more done."

##What is CoffeeScript?

CoffeeScript is a short-handed way of writing JavaScript, in a style similar to Ruby.  It is compiled down to raw JavaScript.

On December 13, 2009, Jeremy Ashkenas made the first Git commit of CoffeeScript with the comment: "initial commit of the mystery language." The original compiler was written in Ruby.

(CoffeeScript has been a default part of the Rails framework since version 3.1)

In the gemfile of any new Rails 3.1+ app look for `gem 'coffee-rails'`

With this gem included in your project, whenever you generate a new controller (using `rails generate`), the js file that is automatically created will have a `.js.coffee` extension.

###NOTE: sublime users install the package 'Better CoffeeScript'

##Why is it cool?

"Write less code to get more done."

This...

```
var Animal, Horse, Snake, sam, tom,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Animal = (function() {
  function Animal(name) {
    this.name = name;
  }

  Animal.prototype.move = function(meters) {
    return alert(this.name + (" moved " + meters + "m."));
  };

  return Animal;

})();

Snake = (function(_super) {
  __extends(Snake, _super);

  function Snake() {
    return Snake.__super__.constructor.apply(this, arguments);
  }

  Snake.prototype.move = function() {
    alert("Slithering...");
    return Snake.__super__.move.call(this, 5);
  };

  return Snake;

})(Animal);

Horse = (function(_super) {
  __extends(Horse, _super);

  function Horse() {
    return Horse.__super__.constructor.apply(this, arguments);
  }

  Horse.prototype.move = function() {
    alert("Galloping...");
    return Horse.__super__.move.call(this, 45);
  };

  return Horse;

})(Animal);

sam = new Snake("Sammy the Python");

tom = new Horse("Tommy the Palomino");

sam.move();

tom.move();
```

becomes this...

```
class Animal
  constructor: (@name) ->

  move: (meters) ->
    alert @name + " moved #{meters}m."

class Snake extends Animal
  move: ->
    alert "Slithering..."
    super 5

class Horse extends Animal
  move: ->
    alert "Galloping..."
    super 45

sam = new Snake "Sammy the Python"
tom = new Horse "Tommy the Palomino"

sam.move()
tom.move()
```

So yeah, it's cool.

###Syntax
Indentation is important and it uses a Ruby-like syntax.  CoffeeScript doesn’t require parentheses, curly braces, or semicolons, and has added a variety of ruby-like aspects

##Examples

####Variables

**Defining variables eliminates the use of "var", and the declarations are hoisted:**

	beers = ["Heineken", "PBR", "Bud Lite", "Newcastle"]
	fridge = "full of beer"
	
compiles to
	
	var beers, fridge;

	beers = ["Heineken", "PBR", "Bud Lite", "Newcastle"];

	fridge = "full of beer";
	
Notes:
	
	No var declarations
	No semicolons
	

####Conditionals & Loops

**Conditionals are easy to declare, usually in one line:**

	happyLorin = true if fridge == "full of beer""

compiles to
		
	var happyLorin;
	if (fridge === "full of beer") {
		happyLorin = true;
	}
	
	
**OR**
	
	
	if fridge == "full of beer" and beers.length > 0
		happyLorin = true
	
compiles to
	
	var happyLorin;
	if (fridge === "full of beer" && beers.length > 0) {
		happyLorin = true;
	}
	
**And loops:**

	while beers.length > 0 then drinkBeer()
	
compiles to

	while (beers.length > 0) {
		drinkBeer();
	}
	
	
**OR**
	
	
	for item in items
		console.log(item)
	
compiles to
	
	var item, _i, _len;
	for (_i = 0, _len = items.length; _i < _len; _i++) {
		item = items[_i];
		console.log(item);
	}
	
		
**OR**
	
	
	for i in [5..0]
		alert(i)
	
compiles to
	
	var i, _i;
	for (i = _i = 5; _i >= 0; i = --_i) {
		alert(i);
	}

	
**AND**
	
	
	for item in items when item isnt "PBR"
		console.log(item)
	
compiles to
	
	var item, _i, _len;
	for (_i = 0, _len = items.length; _i < _len; _i++) {
		item = items[_i];
		if (item !== "PBR") {
			console.log(item);
		}
	}
	

####Functions

**Functions look completely different:**

	drinkBeer = ->
		items.pop()
		
compiles to
	
	drinkBeer = function() {
		return items.pop();
	}
** Notice how the last line of a function is always returned


####Objects

**Objects are shorter too:**

	fridge = 
		beer: ["beer1", "beer2", "beer3", "beer4"]
		iceCream: ["chocolate", "vanilla", "pistachio"]
		consume: (item) ->
			item.pop()
			
compiles to
	
	var fridge;

	fridge = {
	  beer: ["beer1", "beer2", "beer3", "beer4"],
	  iceCream: ["chocolate", "vanilla", "pistachio"],
	  consume: function(item) {
	    return item.pop();
	  }
	};
	
####Classes

**note the use of the "class" keyword**

	class Coffee
		constructor: (name, strength=1) ->
			@name = name
			@strength = strength
			
same as

	class Coffee
		constructor: (@name, @strength=1) ->
		
		
with functions

	class Coffee
		constructor: (@name, @strength=1) ->
		
		brew: -> alert "brewing #{@name}"
		pour: (amount=1) ->
			if amount is 1
				"Poured a single cup"
			else
				"Poured #{amount} cups"
				
Instantiation

	french = new Coffee("French", 2)
	
	french.brew()
	
Inheritance
	
	class MaxgoodHouse extends Coffee
		constructor: (@name, @strength=0) ->
			@brand = "Maxgood House"
			
		brew: -> alert "Brewing #{@brand} #{@name}"
			
so if we instantiate this...

	boring = new MaxgoodHouse("Boring")
	
	boring.brew()
	
alert box yields

	Brewing Maxgood House Boring


**Parent class call**

	class MaxgoodHouse extends Coffee
		constructor: (@name, @strength=0) ->
			@brand = "Maxgood House"
			
		brew: -> alert "Brewing #{@brand} #{@name}"
		pour: (amount=1) ->
			"#{super(amount)}, but it sucks"
			
so now we get

	boring = new MaxgoodHouse("Boring")
	
	boring.pour()
	
alert box yields

	Poured a single cup, but it sucks
	
**THE FAT ARROW**

	class Coffee
		constructor: (@name, @strength=1, @inventory=0) ->
		
		pourCLick: ->
			$("#pour-#{@name}").click (event) => 
				if @inventory isnt 0
					@inventory -= 1
					alert "Poured a cup of #{@name}"
					
`=>` Binds to current value of 'this'

**A groovy example**

This...

	var selectFlights = {
		fetchingFlights : null,
		
		init : function() {
			$("#tabs ul li a").bind({
				click:
			});
			
			$("#tabs #error a").click(function (event){
				e.preventDefault();
				this.showFlights($("#tabs li a.active").attr("href"));
			});
		},
		
		showFlights : function(activeDiv){},
		changeTab : function(event){}
	});

Becomes this...

	￼class SelectFlights  		constructor: (@fetchingFlights=null) ->    		$("#tabs ul li a").bind        		click: @changeTab    		$("#tabs #error a").click (event) =>      			event.preventDefault()      			@showFlights $("#tabs li a.active").attr("href")  		showFlights : (activeDiv) ->  		changeTab : (event) =>

Instantiated
  	selectFlights = new SelectFlights()
  	
####Additional Notes

**There's no more "this" but instead we use "@"**

	fridge = 
		beer: ["beer1", "beer2", "beer3", "beer4"]
		consumeBeer: () ->
			@beer.pop()

compiles to

	var fridge;

	fridge = {
	  beer: ["beer1", "beer2", "beer3", "beer4"],
	  consumeBeer: function() {
	    return this.beer.pop();
	  }
	};


**jQuery still works:**

	$('#div').click ->
		alert("clicked")

	complies to
	
	$('#div').click(function() {
		alert("clicked");
	});

**Our jQuery document.ready function:**
	
	$(document).ready(function() {});
	OR
	$(function() {});
	
can be denoted as:
	
	$ ->


<br><br><br>

-----

##Screencasts

- A [Sip of CoffeeScript](http://coffeescript.codeschool.com/) is a Code School Course which combines 6 screencasts with in-browser coding to make learning fun. The first level is free to try out.

- If you're looking for less of a time commitment, RailsCasts' [CoffeeScript Basics](http://railscasts.com/episodes/267-coffeescript-basics) should have you covered, hitting all of the important notes about CoffeeScript in 11 minutes.
<br><br><br>

-----
##Standalone coffeescript compilation
Using homebrew, install NodeJS:

	brew install node

Install NPM, Node's package manager:

	brew install npm
	--OR--
	curl https://npmjs.org/install.sh | sh

Install CoffeeScript:

	npm install -g coffee-script
	

**Usage**

Once installed, you should have access to the coffee command, which can execute scripts, compile .coffee files into .js, and provide an interactive REPL.

**Compile command:**
	
	coffee -c scripts.js.coffee
	
	
##Sources
[http://coffeescript.org/#top](http://coffeescript.org)

[Sip of CoffeeScript](http://coffeescript.codeschool.com/)

[js2coffee](http://js2coffee.org/)

