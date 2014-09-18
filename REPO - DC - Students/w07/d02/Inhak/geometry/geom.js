function Rectangle(length, width) {
  this.length = length;
  this.width = width;
}

Rectangle.prototype = {

  isSquare: function() {
    return this.length === this.width;
  },

  area: function(){
    return this.length * this.width;
  },

  perimeter: function(){
    return (this.length * 2) + (this.width * 2);
  }
}


function Triangle(sideA, sideB, sideC) {
  this.sideA = sideA;
  this.sideB = sideB;
  this.sideC = sideC;
}

Triangle.prototype = {
  isEquilateral: function(){
    if(this.sideA === this.sideB && this.sideB === this.sideC){
      return true;
    } else {
      return false;
    }
  },

  isIsosceles: function(){
    if(this.sideA === this.sideB || this.sideB === this.sideC || this.sideC === this.sideA){
      return true;
    } else {
      return false;
    }
  },


}


function LineSegment(x1, y1, x2, y2) {
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
}

LineSegment.prototype = {
  length: function(){
    var xleng = this.x2 - this.x1;
    var yleng = this.y2 - this.y1;

    return Math.sqrt(Math.pow(xleng, 2)+ Math.pow(yleng, 2));
  }
}
