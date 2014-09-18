function Rectangle(length, width) {
  this.length = length;
  this.width = width;
}

Rectangle.prototype = {
  isSquare: function(){
    return this.length === this.width;
  },
  area: function(){
    return this.length * this.width;
  },
  perimeter: function(){
    return (this.length*2 + this.width*2)
  }
};



function Triangle(sideA, sideB, sideC) {
  this.sideA = sideA;
  this.sideB = sideB;
  this.sideC = sideC;
}

Triangle.prototype = {
  isEquilateral: function(){
    return (this.sideA === this.sideB && this.sideB === this.sideC);
  },
  isIsosceles: function(){
    if (this.isEquilateral() === true){
      return true;
    } else if (this.sideA === this.sideB || this.sideB === this.sideC || this.sideA === this.sideC){
      return true;
    } else {
      return false;
    };
  },
  area: function(){
    var s = parseInt((this.sideA + this.sideB + this.sideC));
    var area = Math.sqrt(( s * (s - this.sideA) *(s - this.sideB)*(s - this.sideC)));
    return area;
  },
  isObtuse: function(){
    var aSquared = Math.pow(this.sideA, 2);
    var bSquared = Math.pow(this.sideB, 2);
    var cSquared = Math.pow(this.sideC, 2);

    var ifAIsLargestSide = bSquared + cSquared < aSquared;
    var ifBIsLargestSide = aSquared + cSquared < bSquared;
    var ifCIsLargestSide = aSquared + bSquared < cSquared;

    return ifAIsLargestSide || ifBIsLargestSide || ifCIsLargestSide;
  },

};


function LineSegment(x1, y1, x2, y2) {
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
}
