var canvasW = 500;
var canvasH = 100;

var svg = d3.select('#graph')
	.append('svg')
	.attr('width', canvasW)
	.attr('height', canvasH);

var scaleY = d3.scale.linear().range([0, canvasH]);

function drawGraph() {
	var data = getRandomDataset();
	
	scaleY.domain([0, d3.max(data)]);
	
	// Bars:

	var bars = svg.selectAll('rect')
		.data(data);

	bars
		.enter()
		.append('rect')
		.attr('y', canvasH)
		.attr('height', 0);

	bars
		.transition()
		.attr('x', function(d, i) { return i * (canvasW / data.length); })
		.attr('width', function(d, i) { return canvasW / data.length - 2; })
		.attr('y', function(d, i) { return canvasH-scaleY(d); })
		.attr('height', function(d) { return scaleY(d); })
		.attr("fill", function(d) {
		    return "rgb(0, 0, " + (d * 10) + ")";
		});

	bars
		.exit()
		.transition()
		.attr('height', 0)
		.attr('y', canvasH)
		.remove();

	
	// Labels:

	var labels = svg.selectAll('text')
			.data(data);

	labels
		.enter()
		.append('text')
		.attr("font-family", "sans-serif")
		.attr("font-size", "11px")
		.attr("fill", "white")
		.attr("text-anchor", "middle");

	labels
		.transition()
		.text(function(d) {
			return d;
		})
		.attr('x', function(d, i) {
			return i * canvasW / data.length + (canvasW / data.length - 2) / 2;
		})
		.attr('y', function(d) {
			return canvasH - scaleY(d) + 14;
		});

	labels.exit().remove();
}

drawGraph();


// Configure Refresh button:
document.getElementById('refresh').onclick = drawGraph;