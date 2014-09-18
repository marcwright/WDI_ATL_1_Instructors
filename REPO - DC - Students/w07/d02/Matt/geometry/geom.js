function Rectangle(length, width) {
  this.length = length;
  this.width = width;
}

Rectangle.prototype = {
  isSquare: function() {
    return this.length === this.width;
  },
  area: function() {
    return this.length * this.width + ' sq';
  },
  perimeter: function() {
    return this.length + this.length + this.width + this.width;
  }
}

function Triangle(sideA, sideB, sideC) {
  this.sideA = sideA;
  this.sideB = sideB;
  this.sideC = sideC;
}

Triangle.prototype = {
  perimeter: function() {
    return this.SideA + this.SideB + this.SideC;
  },
  isEquilateral: function() {
    return this.SideA === this.SideB && this.SideB === this.SideC;
  },
  isIsosceles: function() {
    return this.SideA === this.SideB || this.SideB === this.SideC || this.SideA === this.SideC;
  }
}


function LineSegment(x1, y1, x2, y2) {
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
}
