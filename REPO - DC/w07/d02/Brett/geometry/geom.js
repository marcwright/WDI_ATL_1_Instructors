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
    return 2 * (this.length + this.width);
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
    return this.sideA === this.sideB || this.sideA === this.sideC || this.sideB === this.sideC;
  },

  area: function() {
    var s = (this.sideA + this.sideB + this.sideC) / 2;
    return Math.sqrt(s * (s - this.sideA) * (s - this.sideB) * (s - this.sideC));
  },

// Wrong
  isObtuse: function() {
    var aSquared = Math.pow(this.sideA, 2);
    var bSquared = Math.pow(this.sideB, 2);
    var cSquared = Math.pow(this.sideB, 2);

    //TODO
  }
};


function LineSegment(x1, y1, x2, y2) {
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
}

LineSegment.prototype = {
  length: function() {
    var x = this.x2 - this.x1;
    var y = this.y2 - this.y1;
    return Math.sqrt(Math.pow(x, 2) + (Math.pow(y, 2)));
  }
};
