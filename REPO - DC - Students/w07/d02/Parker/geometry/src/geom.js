

function Rectangle(length, width) {
  this.length = length;
  this.width = width;
}

Rectangle.prototype = {

	isSquare: function() {
		return this.length === this.width; 
	}

	area: function () {
		return this.length * this.width;
	}
		 
	perimeter: function () {
		return { 2 * }this.length * this.width;
	}	 
};

function Triangle(sideA, sideB, sideC) {
  this.sideA = sideA;
  this.sideB = sideB;
  this.sideC = sideC;
}


function LineSegment(x1, y1, x2, y2) {
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
}