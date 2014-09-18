describe("JavaScript Functions", function() {

  // Establish a reference to global scope (this is different between a web browser and NodeJS)
  var GLOBAL = (typeof window == 'undefined') ? global : window;

  it('will allow us to call named functions with their name', function() {
    function test() {
      return 1;
    }

    expect( test() ).toBe(1);
  });

  it('will accept arguments and return a value when one is explicitly returned', function() {
    function add(a, b) {
      return a + b;
    }
    expect( add(5,10) ).toBe(15);
  });

  it('will configure an "arguments" object with all parameters that were passed to the function', function() {
    function test() {
      expect(arguments[0]).toBe('Gabe')
      expect(arguments[1]).toBe('Snyder')
      expect(arguments.length).toBe(2)
      expect(arguments instanceof Array).toBeFalsy();
      expect(arguments instanceof Object).toBeTruthy();
    }
    test('Gabe','Snyder');
  });

  describe('scope and closure', function() {
    it('will allow function scopes to reference outward, but not look inward at nested closures', function() {
      var outerValue = 10;

      function inner() {
        var innerValue = 20;
        expect(outerValue).toBe(10);
        expect(innerValue).toBe(20);
      }
      inner();
      expect(outerValue).toBe(10)
      expect(typeof innerValue).toBe('undefined')
    })

    it('will override conflicting variable declarations in an inner scope. The outer scope will be unaffected', function() {
      var n = 5;
      function test() {
        var n = 10;
        expect(n).toBe(10);
      }
      test();
      expect(n).toBe(5);

    })

    it('allows inner scopes to access and modify variables declared in an outer scope', function() {
      var n = 5;
      function test() {
        n = 10;
        expect(n).toBe(10);
      }
      test();
      expect(n).toBe(10);
    });

    it('assigns all undeclared variables into global scope', function() {
      function alexi() {
        // var n;
        function question() {
          n = 20;
        }
        question();
      }
      alexi();
      expect(GLOBAL.n).toBe(20);
    });

    it('allows immediately invoked function expressions aka IIFE to create a private scope for our sweet codes', function() {
      var iifeWasInvoked = false;
      (function() {
         iifeWasInvoked = true
      })();

      expect(iifeWasInvoked).toBeTruthy();
    })
  })

  describe('declaration, assignment, and hoisting',function() {

    it('will hoist function declarations to the top of scope so that they can be used anywhere within that scope', function() {

      expect(typeof test).toBe('function');
      expect( test() ).toBe(1)

      // deliberately wrote test after expectations to test hoisting
      function test() {
        return 1;
      }


    });

    it('will not hoist function assignments to the top of scope, becuase that would change control flow', function() {

      expect(typeof test).toBe('undefined');

      // deliberately wrote test after expectations to test hoisting
      var test = function() {
        return 1;
      };

    });

  });

  describe('context', function() {

    it('will bind the function invocation pattern to the global scope object', function() {

      function test() {
        return this;
      }
      expect( test() ).toBe(GLOBAL);
    });

    it('will bind the method invocation pattern to the object that hosts the function',function() {

      var obj = {
        beep: function() {
          return this;
        }
      };
      expect( obj.beep() ).toBe(obj);
    });

    it('will bind the "call" and "apply" invocation pattern to a passed object', function() {

      function test() {
        return this;
      }

      var target = {};

      expect( test.call(target) ).toBe(target)
    });

    it('will bind the constructor invocation pattern to a brand new object instance', function() {

      function TestWidget(name) {
        this.name = name;
      }

      var gabe = new TestWidget('Gabe');
      var tom = new TestWidget('Tom');

      expect( gabe.name ).toBe('Gabe');
      expect( tom.name ).toBe('Tom');
      expect( gabe instanceof TestWidget ).toBeTruthy;

    });

  });

  describe('prototypal inheritance', function() {
    it('will link a functions prototype object to all constructed object instances', function() {
      function Person(name) {
        this.name = name;
      }
      Person.prototype = {
        greet: function() {
          return "hello, I'm " + this.name;
        }
      };

      var person = new Person("Larry");
      expect( person.greet() ).toBe("hello, I'm Larry");
      expect( person.hasOwnProperty('name') ).toBeTruthy();
      expect( person.hasOwnProperty('greet') ).toBeFalsy();
    })

  })

});
