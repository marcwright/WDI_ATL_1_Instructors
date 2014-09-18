/*
* @Author: stephenstanwood
* @Date:   2014-06-03 09:31:22
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-03 15:38:15
*/

describe("JavaScript Functions", function() {

  // Establish a reference to global scope (this is different between a web browser and NodeJS)
  var GLOBAL = (typeof window == 'undefined') ? global : window;

  it('will allows us to call named functions with their names', function() {

    function test() {
      return 1;
    }

    expect( test() ).toBe(1);
  });

  it('will accept arguments and return a value when one is explicitly returned', function() {

    function add(a, b) {
      return a + b;
    }

    expect( add(5, 10) ).toBe(15);
  });

  it('will configure an "arguments" object with all params that were passed to the function', function() {

    function test() {
      expect( arguments[0] ).toBe( 'Gabe' );
      expect( arguments[1] ).toBe( 'Snyder' );
      expect( arguments.length ).toBe( 2 );
      expect( arguments instanceof Object).toBeTruthy();
    }

    test('Gabe', 'Snyder');
  });

  describe('declaration, assignment, and hoisting', function() {
    it('will hoist function declartions to the top', function() {

        expect( test() ).toBe(1);
        expect( typeof test ).toBe('function');

        function test() {
          return 1;
        }
    });
  });

  describe('context', function () {
    it('will bind the function invocation pattern to the global scope object', function () {
      function test() {
        return this;
      }

      expect( test() ).toBe(GLOBAL);
    });

    it('will bind the method invocation pattern to the object that hosts the function', function() {
      var obj = {
        beep: function() {
          return this;
        }
      };

      var obj2 = {
        test: obj.beep
      };

      expect( obj.beep() ).toBe( obj );
      expect( obj2.test() ).toBe( obj2 );

      expect( obj.beep === obj2.test ).toBeTruthy();
    });

    it('will bind the call and apply invocation pattern to a passed object', function() {
      function test() {
        return this;
      }

      var target = {};

      expect( test.call( target ) ).toBe( target );
    });

    it('will bind the constructor invocation pattern to a brand new object instance...', function() {

      function TestWidget(name) {
        this.name = name;
      }

      var gabe = new TestWidget('Gabe');
      var tom = new TestWidget('Tom');

      expect( gabe.name ).toBe( 'Gabe' );
      expect( tom.name ).toBe( 'Tom' );
    });
  });

  describe('prototypal inheritance', function() {

    it('will link a function\'s prototype object to all constructed instances', function () {

      function Person(name) {
        this.name = name;
      }

      Person.prototype = {
        greet: function() {
          return 'hello, i\'m ' + this.name;
        }
      };

      var person = new Person("Larry");

      expect( person.greet() ).toBe( 'hello, i\'m Larry' );
      expect( person.hasOwnProperty( 'name' )).toBeTruthy();
      expect( person.hasOwnProperty( 'greet' )).toBeFalsy();

    });
  });
});
