describe("JavaScript Functions", function() {

  // Establish a reference to global scope (this is different between a web browser and NodeJS)
  var GLOBAL = (typeof window == 'undefined') ? global : window;

  it ('will allow us to call named functions with their name', function() {

  	function test() {
  		return 1;
  	}
  	 expect( test() ).toBe(1);
  	});
  it ('will accept arguments and return a value when one is explicitely returned', function() {

  	function add(a, b) {
  		return a + b; 
	}

	expect( add(5, 10) ).toBe(15);
  });
 
 it ('will configure an "arguments" object with all params that were passed to the function', function() {

  	function test() {
  		 expect(arguments[0]).toBe('Gabe');
  		 expect(arguments[1]).toBe('Snyder');
  		 expect(arguments.length).toBe(2);
  		 expect(arguments instanceof Array).toBeFalsy();
  		 expect(arguments instanceof Object).toBeTruthy();

	}

	test("Gabe", "Snyder");
  });

 	describe("scope and closure", funtion () {
 		it("will allow function scopes to reference outward, but not look inward at nested closures.", function() {

 		var outerValue = 10;

 		function inner() {
 			var inner = 20; 
 			expect(outer).toBe(10);
 			expect(innerValue).toBe(20);
		}

			inner();
			expect(outerValue).toBe(10);
			expect(typeof  innerValue).toBe('undefined');
 		});
 		

 	});

 });  

