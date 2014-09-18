function Rectangle(length, width) {
  this.length = length;
  this.width = width;
}

Rectangle.prototype = {
  isSquare: function() {
    return this.length === this.width
  },

  area: function() {
    console.log("The area is:" + (this.length*this.width)+".")
  },

  parimeter: function() {
    console.log("The parimeter is:" + ((this.length*2) +(this.width*2))+".")
  }
}


function Triangle(sideA, sideB, sideC) {
  this.sideA = sideA;
  this.sideB = sideB;
  this.sideC = sideC;
}

Triangle.prototype = {
  isEquilateral: function() {
    return this.sideB === this.sideA && this.sideA === this.sideC;
  },

  isIsosceles: function() {
   this.sideB === this.sideA || this.sideA === this.sideC || this.sideB === this.sideC
        return true;
  },

  area: function() {
    var s = ((this.sideA + this.sideB +this.sideC) / 2);
    var area =Math.sqrt(s*(s-this.sideA)*(s-this.sideB)*(s-this.sideC));
    debugger
    console.log("The area of a triangle with sides of length" + this.sideA + ", " + this.sideB +", " + this.sideC + " is equal to: " + area +"units.");
  }
}


function LineSegment(x1, y1, x2, y2) {
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
}
