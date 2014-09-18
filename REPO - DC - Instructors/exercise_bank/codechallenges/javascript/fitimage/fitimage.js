function fitimage(cw, ch, ir) {
    
    var w = cw;
    var h = ch;
		var cr = ch / cw; 
    
    if (cr > ir) {
        w = ch / ir;
    } else {
        h = cw / ir;
    }
    
  return {x: (cw-w)/2, y: (ch-h)/2, w: w, h: h};
}


describe('fitimage method', function() {
	
	function validate(canvas, result) {
		// Validate width and height:
		expect(result.w).to.be.at.least(canvas.w);
		expect(result.h).to.be.at.least(canvas.h);
		
		// Validate X and Y offsets:
		expect(result.x).to.equal(-(result.w-canvas.w)/2);
		expect(result.y).to.equal(-(result.h-canvas.h)/2);
	}
	
	it('should fit a landscape image to a landscape canvas.', function() {
		var image = {w: 200, h: 100};
		var canvas = {w: 100, h: 50};
		var result = fitimage(canvas.w, canvas.h, image.h/image.w);
		validate(canvas, result);
	});

	it('should fit a landscape image to a portrait canvas.', function() {
		var image = {w: 200, h: 100};
		var canvas = {w: 50, h: 100};
		var result = fitimage(canvas.w, canvas.h, image.h/image.w);
		validate(canvas, result);
	});

	it('should fit a portrait image to a landscape canvas.', function() {
		var image = {w: 100, h: 200};
		var canvas = {w: 100, h: 50};
		var result = fitimage(canvas.w, canvas.h, image.h/image.w);
		validate(canvas, result);
	});

	it('should fit a portrait image to a portrait canvas.', function() {
		var image = {w: 100, h: 200};
		var canvas = {w: 100, h: 50};
		var result = fitimage(canvas.w, canvas.h, image.h/image.w);
		validate(canvas, result);
	});
	
});



