var canvasW = 500;
var canvasH = 100;

// Create the Scalable Vector Graphics canvas on which we can draw awesome svgs
var svg = d3.select("#graph")
  .append('svg')
  .attr('width', canvasW)
  .attr('height', canvasH);


function redrawGraph() {

  // Redraw the graph image...
  var data = getRandomDataset();

  // scaleY becomes a function into which you can plug data (see below)
  var scaleY = d3.scale.linear()
    .range([0, canvasH])
    .domain([0, d3.max(data)]); // used to translate the percentage that the data falls within to the correspeding pixel count with the range

  // creates a selection group of elements, which may or may not exist
  var bars = svg.selectAll('rect').data(data);

  // enter
  bars
    .enter()
    .append('rect') // append a rectangle for each bar element
    .attr('y', canvasH) // this specifies it's y position on the coordinate plain
    .attr('height', 0); // this sets

  // known as the update group, (implicit)
  bars
    .transition() // tells says everyhing that follows this
    .attr('x', function(d, i){ return i * (canvasW / data.length); }) // sets up the NUMBER of bars where i is the index
    .attr('y', function(d){  return canvasH - scaleY(d); }) // this specifies it's y position on the coordinate plain
    .attr('width', 10) // sets up the with
    .attr('height', function(d, i){ return scaleY(d); })
    .attr('fill', function(d){ return 'rgb(0, 0, ' + d * 9 + ')' });

  bars
    .exit()
    .transition()
    .attr('height', 0)
    .attr('y', canvasH)
    .remove();
}

//////////////////////////////////////////
// Funsies to see if I can make things
//////////////////////////////////////////

var rotationDegreeTracker = 0;

var $rotateGroup = $("#rotate-group");

function rotate(){
  var newRotation = "rotate(" + rotationDegreeTracker + " 250 225)";
  $rotateGroup.attr("transform", newRotation);
  rotationDegreeTracker += 5;
}

setInterval(rotate, 10);
