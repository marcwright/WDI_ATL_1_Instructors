describe("JavaScript Functions", function() {

   var GLOBAL = (typeof window == 'undefined') ? global : window;
 });
 		
  it('will allow us to call named functions with their name', function(){

    function test() {
       return 1;

    }

    expect(test() ).toBe(1);
 		
  });
 	
  it ('will accept arguments and return a value when one is explicitly returned', function(){
 	
    function add(a, b){
 	
      return a  b;
 	
    }
 	
    expect( add(5, 10) ).toBe(15);
 	
  });

  it('will configure an "arguments" object with all params that were passed to the function', function() {

    function test() {
 	
      expect(arguments[0]).toBe('Gabe');
 	
      expect(arguments[1]).toBe('Snyder');
 	26	
      expect(arguments.length).toBe(2);
 	27	
      expect(arguments instanceof Array).toBeFalsy();
 	28	
      expect(arguments instanceof Object).toBeTruthy();
 	29	
    }
 	30	

 	31	
    test("Gabe", "Snyder");
 	32	
  })
 	33	

 	34	
  describe("scope and closure", function(){
 	35	
    it("will allow function scopes to reference outward, but not look inward at nested closures", function() {
 	36	
      var outerValue = 10;
 	37	

 	38	
      function inner() {
 	39	
        var innerValue = 20;
 	40	
        expect(outerValue).toBe(10);
 	41	
        expect(innerValue).toBe(20);
 	42	
      }
 	43	
      inner();
 	44	
      expect(outerValue).toBe(10);
 	45	
      expect(innerValue).toBe(undefined);
 	46	
    });
 	47	

 	48	
    it('will overide conflicting variable declarations in an inner scope. The outer scope will be unaffected', function(){
 	49	
      test
 	50	

 	51	
    });
 	52	
  });
 	53	

 	54	
});
46  w07/d02/JoElla/geometry/geom.js View
 @@ -3,6 3,22 @@ function Rectangle(length, width) {
3	3	
   this.width = width;
4	4	
 }
5	5	
 
 	6	
Rectangle.prototype = {
 	7	

 	8	
  isSquare: function(){
 	9	
    return this.length === this.width
 	10	
  },
 	11	

 	12	
  area: function(){
 	13	
    return this.length * this.width
 	14	
  },
 	15	

 	16	
  perimeter: function(){
 	17	
    return (this.length  this.width) * 2;
 	18	
  }
 	19	
};
 	20	

 	21	

6	22	
 
7	23	
 function Triangle(sideA, sideB, sideC) {
8	24	
   this.sideA = sideA;
 @@ -10,10 26,38 @@ function Triangle(sideA, sideB, sideC) {
10	26	
   this.sideC = sideC;
11	27	
 }
12	28	
 
 	29	
Triangle.prototype = {
 	30	

 	31	
  isEquilateral: function() {
 	32	
    return this.sideA === this.sideB && this.sideB === this.sideC;
 	33	
  },
 	34	

 	35	
  isIsosceles: function(){
 	36	
    return this.sideA === this.sideB || this.sideA === this.sideC || this.sideB === this.sideC;
 	37	
  },
 	38	

 	39	
  area: function(){
 	40	
    return
 	41	
  }
 	42	
};
 	43	

13	44	
 
14	45	
 function LineSegment(x1, y1, x2, y2) {
15	46	
   this.x1 = x1;
16	47	
   this.y1 = y1;
17	48	
   this.x2 = x2;
18	49	
   this.y2 = y2;
19	 	
-}
 	50	
}
 	51	

 	52	
LineSegment.prototype = {
 	53	

 	54	
  length: function() {

//var rect = new Rectangle(100, 50);
 	63	
//rect.isSquare();