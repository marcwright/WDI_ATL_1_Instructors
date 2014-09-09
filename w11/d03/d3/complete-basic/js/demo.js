var canvasW = 500;
var canvasH = 100;

var svg = d3.select('#graph')
  .append('svg')
  .attr('width', canvasW)
  .attr('height', canvasH);


function redrawGraph() {

  var data = getRandomDataset();

  var scaleY = d3.scale.linear()
    .range([0, canvasH])
    .domain([0, d3.max(data)]);

  var bars = svg.selectAll('rect').data(data);

  bars
    .enter()
    .append('rect')
    .attr('height', 0)
    .attr('y', canvasH);

  bars
    .transition()
    .attr('x', function(d, i) { return i * (canvasW / data.length); })
    .attr('y', function(d) { return canvasH - scaleY(d); })
    .attr('width', 10)
    .attr('height', function(d) { return scaleY(d) })
    .attr('fill', function(d) { return 'rgb(0,0,'+ d*10 +')'; });

  bars
    .exit()
    .transition()
    .attr('y', canvasH)
    .attr('height', 0)
    .remove();
}

redrawGraph();
document.getElementById('refresh').onclick = redrawGraph;