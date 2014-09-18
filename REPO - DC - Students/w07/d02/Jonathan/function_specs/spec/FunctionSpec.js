describe("JavaScript Functions", function() {

  // Establish a reference to global scope (this is different between a web browser and NodeJS)
  var GLOBAL = (typeof window == 'undefined') ? global : window;

  it('will allow us to call named functions with their name', function(){

    function test() {
      return 1;
    }

    expect( test() ).toBe(1);

  }); //it

  it('will accept arguments and return a value when one is explicitely returned', function(){

    function add(a, b) {
      a = a || 0; //setting a default
      b = b || 0; //setting a default
      return a + b;
    }

    expect( add(5, 10) ).toBe(15);

  }); //it

  it('will configure an "arguments" object will all params that were passed to the function', function() {

    function test() {
      expect(arguments[0]).toBe('Gabe');
      expect(arguments[1]).toBe('Synder');
      expect(arguments.length).toBe(2);
      expect(arguments instanceof Array).toBeFalsy();
      expect(arguments instanceof String).toBeFalsy();
      expect(arguments instanceof Number).toBeFalsy();
      expect(arguments instanceof Boolean).toBeFalsy();
      expect(arguments instanceof Object).toBeTruthy();
    }

    test("Gabe", "Synder");

  }); //it

}); //describe

describe("scope and closure", function() {

  it('will allow function scope to reference outward but not look inward at nested closures', function() {

    var outerValue = 10

    function inner() {
      var innerValue = 20;
      expect(outerValue).toBe(10);
      expect(innerValue).toBe(20);
    }

    inner();
    expect(outerValue).toBe(10);
    expect(typeof innerValue).toBe('undefined');

  }); //it

}); //describe
