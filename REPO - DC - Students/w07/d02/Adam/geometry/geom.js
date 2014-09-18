function Rectangle(length, width) {
  this.length = length;
  this.width = width;
}


function Triangle(sideA, sideB, sideC) {
  this.sideA = sideA;
  this.sideB = sideB;
  this.sideC = sideC;
}

//TBD

Triangle.prototype = {
  isEqualateral: function() {
    return this.SideA === this.sideB && this.sideB === this.sideC;
  },
  isIsosceles: function() {
    return this.SideA === this.sideB || this.sideB === this.sideC || this.sideA === this.sideC;
  },
  area: function() {
    var s = ( this.sideA + this.sideB + this.sideC ) /2;
    var inner = s * (s - this.sideA) * (s - this.sideB) * (s - this.sideC);
    return Math.sqrt( inner );
  }
  isObtuse: function() {
    var aSquared = Math.pow(this.sideA, 2);
    var bSquared = Math.pow(this.sideB, 2);
    var cSquared = Math.pow(this.sideC, 2);

    var ifAIsLargestSide = bSquared + cSquared < aSquared;
    var ifBIsLargestSide = cSquared + aSquared < bSquared;
    var ifCIsLargestSide = aSquared + bSquared < cSquared;

    return ifAIsLargestSide || ifBIsLargestSide || ifCIsLargestSide;
  }
}


function LineSegment(x1, y1, x2, y2) {
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
}

LineSegment.prototype = {
  length: function() {
    var xs = this.x2 - this.x1;
    var ys = this.y2 - this.y1;

    return Math.sqrt(Math.pow(xs, 2) + Math.pow(ys, 2));
  }
}
