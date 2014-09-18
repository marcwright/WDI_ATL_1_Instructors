var canvasW = 500;
var canvasH = 100;

// Create the SVG image...

var svg = d3.select("#graph")
  .append("svg")
  .attr("width", canvasW)
  .attr("height", canvasH);

function redrawGraph() {

  // Redraw the graph image...
  var data = getRandomDataset();
  console.log(data);

  var scaleY = d3.scale.linear()
    .range([0, canvasH])
    .domain([0, d3.max(data)]);

  var bars = svg.selectAll("rect").data(data);

  bars
    .enter()
    .append("rect")
    .attr("y", canvasH)
    .attr("height", 0);

  bars
    .transition()
    .attr("x", function(d, i) { return i * (canvasW / data.length); })
    .attr("y", function(d) { return canvasH - scaleY(d); })
    .attr("width", 10)
    .attr("height", function(d) { return scaleY(d); });

  bars
    .exit()
    .transition()
    .attr("height", 0)
    .attr("y", canvasH)
    .remove();

}
