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
    return 2 * ( this.length + this.width );
  }
};


function Triangle(sideA, sideB, sideC) {
  this.sideA = sideA;
  this.sideB = sideB;
  this.sideC = sideC;
}

Triangle.prototype = {
  isEquilateral: function() {
    return this.sideA === this.sideB && this.sideB === this.sideC;
  },
  isIsosceles: function() {
    var ABequal = this.sideA === this.sideB;
    var BCequal = this.sideB === this.sideC;
    var ACequal = this.sideA === this.sideC;

    return ABequal || BCequal || ACequal;
  },
  area: function() {
    var s = 0.5 * (this.sideA + this.sideB + this.sideC);  // semiperimeter of a triangle
    var areaSquared = s * ( s - this.sideA) * ( s - this.sideB ) * ( s - this.sideC );

    return Math.sqrt( areaSquared );
  },
  isObtuse: function() {
    var aSquared = Math.pow(this.sideA, 2);
    var bSquared = Math.pow(this.sideB, 2);
    var cSquared = Math.pow(this.sideC, 2);

    // true if obtuse, based on law of cosines
    ifAIsLargestSide = bSquared + cSquared < aSquared;
    ifBIsLargestSide = cSquared + aSquared < bSquared;
    ifCIsLargestSide = aSquared + bSquared < cSquared;

    return ifAIsLargestSide || ifBIsLargestSide || ifCIsLargestSide;
  },
};

function LineSegment(x1, y1, x2, y2) {
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
}

LineSegment.prototype.length = function() {
  var xDistance = Math.pow(this.x2 - this.x1, 2);
  var yDistance = Math.pow(this.y2 - this.y1, 2);

  return Math.sqrt( xDistance + yDistance );
};