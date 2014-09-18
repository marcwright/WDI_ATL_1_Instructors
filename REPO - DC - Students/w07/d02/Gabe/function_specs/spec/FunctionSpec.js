describe("JavaScript Functions", function() {

  // Establish a reference to global scope (this is different between a web browser and NodeJS)
  var GLOBAL = (typeof window == 'undefined') ? global : window;


it('will allow us to called named functions with their name', function() {
    function test() {
      return 1;
    }
    expect( test()).toBe(1);
});

it('will accept arguments and return a value when one is specififcally returned', function{

})


descibe("scope and closure", function() {

  it('will allows function scopes to look outward, but not look inward at nested closures.', function(){

    var outerValue = 10;

    function inner() {
      var innerValue = 20;
      expect(outerValue).toBe(10);
      expect(innerValue).toBe(20);
    }

    inner();
    expect(outerValue).toBe(10);

  })

})



});
