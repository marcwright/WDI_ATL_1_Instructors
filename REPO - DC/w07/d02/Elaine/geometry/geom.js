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

var rect = new Rectangle(10, 5);

// expect( rect.isSquare() ).toBeFalsy;
// expect( rect.area() ).toBe(50);
// expect( rect.perimeter() ).toBe(30);


function Triangle(sideA, sideB, sideC) {
  this.sideA = sideA;
  this.sideB = sideB;
  this.sideC = sideC;
}

Triangle.prototype = {

  isEquilateral: function() {
    return (this.sideA === this.sideB && this.sideA === this.sideC);
  },
  isIsosceles: function() {
    return (this.isEquilateral === false && this.sideA === this.sideB || this.sideA === this.sideC || this.sideB === this.sideC);
  },
  area: function() {
    var s = (this.sideA + this.sideB + this.sideC)/2;
    return (Math.sqrt(s*(s-this.sideA)*(s-this.sideB)*(s-this.sideC)));
  },
  isObtuse: function() {
    maxSide = Math.max(this.sideA, this.sideB, this.sideC);
    minSide = Math.min(this.sideA, this.sideB, this.sideC);
    if this.sideA !== maxSide && this.sideA !== minSide {
      var otherSide = this.sideA;
    } else if this.sideB !== maxSide && this.sideA !== minSide {
      var otherSide = this.sideB
    };
    return (Math.pow(maxSide, 2) > Math.pow(shortSide, 2) + (other))
  }
};

function LineSegment(x1, y1, x2, y2) {
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
}
