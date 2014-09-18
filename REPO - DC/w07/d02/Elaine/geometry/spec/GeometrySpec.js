function Rectangle(length, width) {
  this.length = length;
  this.width = width;
}

Rectangle.prototype = {

  isSquare: function() {
    return this.length === this.width;
  },
  area: function() {
    return this.length * this.width;
  },
  perimeter: function() {
    return 2 * this.length + 2 * this.width;
  }
};

var rect1 = new Rectangle(10, 5);

expect( rect1.isSquare() ).toBeFalsy;
expect( rect1.area() ).toBe(50);
expect( rect1.perimeter() ).toBe(30);

