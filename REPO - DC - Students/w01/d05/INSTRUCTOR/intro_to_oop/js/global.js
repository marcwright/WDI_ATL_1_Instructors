$(function() {
	"use strict";
	
	var marginTop = 0,
		slides = $('.slide'),
		mouseDown = false,
		didScroll = false;

	/**
	* Install in/out methodology into jQuery easing library.
	*/
	$.easing.easeInOut = function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
		return -c/2 * ((t-=2)*t*t*t - 2) + b;
	};

	/**
	* Scrolls the page to the next H2 tag.
	*/
	function scrollBy(dir, time) {
		var bestOffset,
			bestIndex = 0,
			scrollTop = $(window).scrollTop() + marginTop,
			offset;
	
		slides.each(function(index, el) {
			offset = Math.abs( $(el).offset().top - scrollTop );
			if ( isNaN(bestOffset) || offset < bestOffset ) {
				bestOffset = offset;
				bestIndex = index;
			}
		});
	
		bestIndex = Math.max( 0, Math.min(bestIndex+dir, slides.length-1) );
	
		if (bestIndex >= 0 && bestIndex < slides.length) {
			$.scrollTo(slides[bestIndex], time, {
				offset:{left:0, top:-marginTop},
				easing:'easeInOut'
			});
		}
	}

	/**
	* Sets the height of each slide to fill the window.
	*/
	function setSlideHeight() {
		slides.height( $(window).height() );
	}

	$(window)
		.keydown(function(evt) {
			if (evt.which === 38) {
				evt.preventDefault();
				scrollBy(-1, 1000);
			} else if (evt.which === 40) {
				evt.preventDefault();
				scrollBy(1, 1000);
			}
		})
		.mousedown(function() {
			mouseDown = true;
		})
		.mouseup(function() {
			if (didScroll) {
				scrollBy(0, 500);
			}
			mouseDown = false;
			didScroll = false;
		})
		.scroll(function() {
			if (mouseDown) {
				didScroll = true;
			}
		})
		.resize(function() {
			setSlideHeight();
			scrollBy(0, 0);
		});
	
	setSlideHeight();
});


// Syntax highlight (lazy render):
(function() {
	var elements = $("code.js, code.html");
	var i = 0;
	
	// Request Animation Frame method:
	var requestAnimFrame = window.requestAnimationFrame ||
		window.webkitRequestAnimationFrame ||
		window.mozRequestAnimationFrame ||
		function( callback ) {
			window.setTimeout(callback, 1000 / 60);
		};

	function syntaxJs( code ) {
		return code
			.replace(/(".*?")/g, "<span class='str'>$1</span>") // << strings
			.replace(/(^|\s)(\/\/.+)/g, "$1<span class='cmt'>$2</span>") // << comments
			.replace(/(^|[\(\){}:\s\.])(var|function|this|new|return|true|false|if|class|public|constructor|private|extends|super)([\(\){};:\s\.])/g, "$1<span class='kwd'>$2</span>$3"); // << keywords
	}

	function syntaxHtml( code ) {
		return code
			.replace(/(&lt;.*?&gt;)/g, "<span class='tag'>$1</span>") // << tags
			.replace(/(".*?")/g, "<span class='str'>$1</span>"); // << strings
	}
	
	function renderSyntax() {
		var el = elements.eq(i++);
		var highlight = el.hasClass("js") ? syntaxJs : syntaxHtml;
		el.html( highlight(el.html()) );
		
		if ( i < elements.length ) {
			requestAnimFrame( renderSyntax );
		}
	}
	
	if ( elements.length ) {
		requestAnimFrame( renderSyntax );
	}
}());
