//Implement the red light using jQuery. Don't forget to add the script tags.

console.log('hello');

function changeLight(light, color) {
    $('.bulb').css('backgroundColor', 'black');
    $(light).css('backgroundColor', color);
}

$('#stopButton').click(function() {
    changeLight('#stopLight', 'red');
});

$('#slowButton').click(function() {
    changeLight('#slowLight', 'yellow');
});

$('#goButton').click(function() {
    changeLight('#goLight', 'green');
});

// $('#testButton').click(function (){
//     $('#traffic-light').hide();
// });




// function showStopLight() {
//     $('#traffic-light').show();
// }

// function turnLightsOff() {
//     $('#stopLight').css('backgroundColor', 'black');
//     $('#slowLight').css('backgroundColor', 'black');
//     $('#goLight').css('backgroundColor', 'black');
// }

// function turnRed() {
//     // showStopLight();
//     turnLightsOff();
//     $('#stopLight').css('backgroundColor', 'red');
// }
// // better name illuminateStop- if you think the color might change

// function turnYellow() {
//     // showStopLight();
//     turnLightsOff();
//     $('#slowLight').css('backgroundColor', 'yellow');
// }

// function turnGreen() {
//     // showStopLight();
//     turnLightsOff();
//     $('#goLight').css('backgroundColor', 'green');
// }

// $('#stopButton').click(turnRed);
// $('#slowButton').click(turnYellow);
// $('#goButton').click(turnGreen);


