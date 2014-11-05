//Implement the red light using jQuery. Don't forget to add the script tags.

console.log('traffic light');

function turnLightsOff() {
    document.getElementById('stopLight').style.backgroundColor = 'black';
    document.getElementById('slowLight').style.backgroundColor = 'black';
    document.getElementById('goLight').style.backgroundColor = 'black';
}

function turnRed() {
    turnLightsOff();
    document.getElementById('stopLight').style.backgroundColor = 'red';
}
// better name illuminateStop- if you think the color might change

function turnYellow() {
    turnLightsOff();
    document.getElementById('slowLight').style.backgroundColor = 'yellow';
}

function turnGreen() {
    turnLightsOff();
    document.getElementById('goLight').style.backgroundColor = 'green';
}

document.getElementById('stopButton').onclick = turnRed;

document.getElementById('slowButton').onclick = turnYellow;

document.getElementById('goButton').onclick = turnGreen;

