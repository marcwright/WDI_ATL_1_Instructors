function Rectangle(length, width) {
  this.length = length;
  this.width = width;
}

Rectangle.prototype = {

  isSquare: function() {
    return this.width === this.length;
  },

  area: function() {
    return this.width * this.length;
  },

  perimeter: function() {
    return this.width + this.length * 2;
  }
};

var rect1 = new Rectangle(100, 100);
rect1.isSquare();
rect1.area();
rect1.perimeter();


function Triangle(sideA, sideB, sideC) {
  this.sideA = sideA;
  this.sideB = sideB;
  this.sideC = sideC;
}

Triangle.prototype = {

  isEquilateral: function() {
    return this.sideA === this.sideB && this.sideB === this.sideC;
  },

  if (sideA === sideB) {
    sideA = true;
  }

  isIsosceles: function() {

  }

};

var tri1 = new Triangle(50, 100, 100);


function LineSegment(x1, y1, x2, y2) {
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
}
