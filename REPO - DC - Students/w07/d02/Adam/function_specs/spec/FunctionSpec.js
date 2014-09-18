describe("JavaScript Functions", function() {

  // Establish a reference to global scope (this is different between a web browser and NodeJS)
  var GLOBAL = (typeof window == 'undefined') ? global : window;

  it('will allow us to call named funcitons iwth their name', function() {

    function test() {
      return 1;
    }

    expect(test() ).toBe(1);
  })


  it('will accept arguments and return a value when one is specifically returned', function() {

    function add(a, b) {
      return a + b;
    }

    expect( add(5, 10) ).toBe(15);
  });

  it('will cnfigure an "arguments" object with all params that were passed to the function', function() {

    function test() {
      expect(arguments[0]).toBe('Gabe');
      expect(arguments[1]).toBe('Snyder');
      expect(arguments.length).toBe(2);


    }

    test("Gabe", "Snyder");

  });


  describe("scrope and closure", function() {

    it('will allow function scopres to reference outward, but not look inward at nested closures.', function() {

      var outerValue = 10

      function inner() {
        var innerValue = 20;
        expect(outerValue).toBe(10);
        expect(innerValue).toBe(20);
      }

      inner();
      expect(outerValue).toBe(10);
      expect(typeof innerValue).toBe('undefined');
    });


    it('will override conflicting variable declartations in an inner scope. The outer scope will be unaffected.', function () {

      var n = 5;

      function test() {
        var n = 10;
        expect(n).toBe(10);
      }

      test();
      expect(n).toBe(5);
    });

    it('allows inner scopes to access and modify variable declared in an outer scope.', function() {

      var n = 5;

      function test() {
        n = 10;
        expect(n).toBe(10);
      }

      test();
      expect(n).toBe(10);

    });

    it('assigns all underclared variables into global scrope.', function() {

      function adam() {
        //var n;

        function question() {
          n = 20;
        }

        question();
      }

      adam();
      expect(GLOBAL.n).toBe(20);
    });

    it('allows immediately invoked experessions (IIFE) to create a private scope for our sweet codez.', function() {
      var iifeWasInvoked = false;
      (function() {

        iifeWasInvoked = true;

      })();

      expect(iifeWasInvoked).toBeTruthy();

    });
  });


  describe("declaration, assignment, and hoisting", function() {

    it('will hoist function declarations to the top of scope so that they can be used anywhere within that scope.', function() {

      expect(typeof test).toBe('function');
      expect(test()).toBe(1);

      //This function was deliberately written after expectations (for hoisting).

      function test() {
        return 1;
      }
    });

    it('will not hoist function assignments to the top of scope, because that would change control flow', function() {

      expect(typeof test).toBe('undefined');

      //This function was deliberately written after expectations (for hoisting).
      var test = function() {
        return 1;
      }
    });





  });

});
