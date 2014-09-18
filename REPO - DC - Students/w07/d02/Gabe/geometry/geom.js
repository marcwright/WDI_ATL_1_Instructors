function Rectangle(length, width) {
  this.length = length;
  this.width = width;
}

Rectangle.prototype = {

  isSquare: function() {
    return this.length === this.width;
  },
  area: function() {
    return (this.length)*(this.width);
  },
  perimeter: function() {
    return (this.length + this.width + this.length + this.width);
  }
}


function Triangle(sideA, sideB, sideC) {
  this.sideA = sideA;
  this.sideB = sideB;
  this.sideC = sideC;
}

Triangle.prototype = {

  isEquilateral: function(){
    var eq1 = (this.sideA === this.sideB);
    var eq2 = (this.sideB === this.sideC);
    return (eq1 && eq2);
  },
  isIsosceles: function(){
    var eq1 = (this.sideA === this.sideB);
    var eq2 = (this.sideA === this.sideC);
    return (eq1 || eq2);
  },
  area: function(){
    var s = ((this.sideA + this.sideB + this.sideC)/2);
    var a  = (s * (s - this.sideA) * (s - this.sideB) * (s - this.sideC));
    return (Math.sqrt(a));
  },
  isObtuse: function(){
    var asqr = Math.pow(this.sideA, 2);
    var bsqr = Math.pow(this.sideB, 2);
    var csqr = Math.pow(this.sideC, 2);
//NOT FINISHED

  }
}

function LineSegment(x1, y1, x2, y2) {
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
}

LineSegment.prototype = {

  length: function(){
    //NOT FINISHED
  }
l
