describe("JavaScript Functions", function() {

  // Establish a reference to global scope (this is different between a web browser and NodeJS)
  var GLOBAL = (typeof window == 'undefined') ? global : window;

  it('will allow us to call named functions with their name', function(){
    function test(){
      return 1;
    }
    expect( test() ).toBe(1);
  });

  it('will accept arguments and return a value when one is explicitly returned', function(){
    function add(a, b){
      return a+b;
    }
    expect(add(5, 10)).toBe(15);
  });

  it('will configure an arguments object with all parameters that were passed to the function', function(){
    function test(){
      expect(arguments[0]).toBe("Gabe");
      expect(arguments[1]).toBe("Snyder");
      expect(arguments.length).toBe(2);
      expect(arguments instanceof Array).toBeFalsy();
      expect(arguments instanceof Object).toBeTruthy();
    }
    test("Gabe", "Snyder")
  });

  describe("scope and closure", function(){

    it('will allow function scopes to reference outward, but not look inward at nested closures', function(){
      var outterValue = 10;
      function inner(){
        var innerValue = 20;
        expect(outterValue).toBe(10);
        expect(innerValue).toBe(20);
      }

      inner();
      expect(outterValue).toBe(10);
      expect(typeof innerValue).toBe('undefined');
    });

    it('will override coflicting variable declarationsin an inner scope. The putter scope will be unaffected.', function(){
      var n = 5;
      function test(){
        var n = 10;
        expect(n).toBe(10);
      }

      test();
      expect(n).toBe(5);
    });

    it('allows inner scopes to access and modify variables declared in an outter scope.', function(){

      var n = 5;

      function test(){
        n = 10
        expect(n).toBe(10);
      }
      test();

      expect(n).toBe(10);
    });

    it('assigns all undeclared variables into global scope', function(){

      function alexi(){
        // var n;

        function question(){
          n = 20
        }
        question();
      }
      alexi();
      expect(GLOBAL.n).toBe(20);
    });

    it('allows immediately invoked function expressions (IIFE) to create a private scope for our sweet codez', function(){

      var iifeWasInvoked  = false;
      (function(){
        iifeWasInvoked = true;
      })();
      expect(iifeWasInvoked).toBeTruthy;
    });
  });

  describe('declaration, assignment and hoisting', function(){

    it('will hoist fucntion declarations to the top of scope, so that they can be used anywhere within that scope.', function(){

      expect(typeof test).toBe('function');
      expect(test()).toBe(1);

     // This function was deliberatly written after expectations for hoisting.
      function test(){
        return 1
      }
    });

    it('will not hoist function assignments to the top of scope, becasue that would change control flow.', function(){

      expect(typeof test).toBe('undefined');

      // This function was deliberatly written after expectations for hoisting.
      var test = function(){
        return 1
      };
    });

  });


  describe('Context', function(){

    it('Will bind the function invocation patter to the global scope object', function(){

      function test(){
        return this;
      }
      expect(test()).toBe(GLOBAL);
    });

    it('will bind the method invocation pattern to the object that host the function.', function(){

      var obj = {
        beep: function(){
          return this;
        }
      };
      expect(obj.beep()).toBe(obj);
    });


    it('Will bind the call and apply invocation pattern to a passed object', function(){

      function test(){
        return this
      };
      var target = {};
      expect(test.call(target)).toBe(target);
    });


    it('will bind the constructor invocation pattern to a brand new object instance', function(){

      function TestWidget(name){
        this.name = name;
      }

      var gabe = new TestWidget('Gabe');
      var tom = new TestWidget('Tom');

      expect(gabe.name).toBe('Gabe');
      expect(tom.name).toBe('Tom');

      expect(gabe instanceof TestWidget).toBeTruthy;
    });
  });   // Close describe context



  describe('prototypal inheritance', function(){

    it('will link a functions prototype object to all constructed object instances', function(){

      function Person(name){
        this.name = name;
      }

      Person.prototype = {
        greet: function(){
          return "Hello, I am " + this.name;
        }
      };
      var person = new Person('Larry');

      expect(person.greet()).toBe("Hello, I am Larry");
      expect(person.hasOwnProperty('name')).toBeTruthy;
      expect(person.hasOwnProperty('greet')).toBeFalsy;
    });

    it('will share methods and data structures between all instances, via the common prototype(BEWARE)', function(){
      function StuffDrawer(name){
        this.name = name;
        this.stuff = [];
      }

      StuffDrawer.prototype = {
          addStuff: function(thing){
            this.stuff.push(thing);
          }
      }

      var elaine = new StuffDrawer('Elaine');
      var parker = new StuffDrawer('Parker');

      parker.addStuff('Pencil');
      elaine.addStuff('Alarm Clock');

      expect(elaine.stuff.length).toBe(1);
    });

    it('creates prototype chains using object "__proto__" properties', function(){

      function Person(name){
        this.name = name;
      };

      Person.prototype = {
        legs: 2
      };

      var tim = new Person('Tim');
      expect(tim.__proto__).toBe(Person.prototype);
      expect(Person.prototype.__proto__).toBe(Object.prototype);
      expect(tim.__proto__.__proto__).toBe(Object.prototype);
    });


  }); // end desc proto inher
});
