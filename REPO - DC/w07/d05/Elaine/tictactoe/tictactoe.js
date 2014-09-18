// function Square(name) {
//   this.name = name;
// }

// Square.prototype = {
//   symbol: ""
// };

var $squares = $('.square');
var sq1 = $squares[0];
var sq2 = $squares[1];
var sq3 = $squares[2];
var sq4 = $squares[3];
var sq5 = $squares[4];
var sq6 = $squares[5];
var sq7 = $squares[6];
var sq8 = $squares[7];
var sq9 = $squares[8];

// var square1 = new Square("s1");
// var square2 = new Square("s2");
// var square3 = new Square("s3");
// var square4 = new Square("s4");
// var square5 = new Square("s5");
// var square6 = new Square("s6");
// var square7 = new Square("s7");
// var square8 = new Square("s8");
// var square9 = new Square("s9");

var move = 0;
var emptySpaces = 9;

$squares.on("click", function() {
  if (move % 2 === 0) {
    $(this).val("X");
  } else {
    $(this).val("O");
  };
  move++;
  emptySpaces--;
  check();
});


function check() {

  if ((sq1.value === sq2.value) && (sq2.value === sq3.value) && (sq1.value !== "_")) {
      if(sq1.value!="_") { // Added check here
          alert(sq1.value + " Wins!");
          reset();
      }
  } else if ((sq4.value === sq5.value) && (sq5.value === sq6.value) && (sq4.value !== "_")) {
      if(sq4.value!="_") { // Added check here
          alert(sq4.value + " Wins!");
          reset();
      }
  } else if ((sq7.value === sq8.value) && (sq8.value === sq9.value) && (sq7.value !== "_")) {
      if(sq7.value!="_") { // Added check here
          alert(sq7.value + " Wins!");
          reset();
      }
  } else if ((sq1.value === sq5.value) && (sq5.value === sq9.value) && (sq1.value !== "_")) {
      if(sq1.value!="_") { // Added check here
          alert(sq1.value + " Wins!");
          reset();
      }
  } else if ((sq3.value === sq5.value) && (sq5.value === sq7.value) && (sq3.value !== "_")) {
      if(sq3.value!="_") { // Added check here
          alert(sq3.value + " Wins!");
          reset();
      }
  } else if ((sq2.value === sq5.value) && (sq5.value === sq8.value) && (sq2.value !== "_")) {
      if(sq2.value!="_") { // Added check here
          alert(sq2.value + " Wins!");
          reset();
      }
  } else if ((sq3.value === sq6.value) && (sq6.value === sq9.value) && (sq3.value !== "_")) {
      if(sq3.value!="_") { // Added check here
          alert(sq3.value + " Wins!");
          reset();
      }
  } else if ((sq1.value === sq4.value) && (sq4.value === sq7.value) && (sq1.value !== "_")) {
      if(sq1.value!="_") { // Added check here
          alert(sq1.value + " Wins!");
          reset();
      }
  } else if ((emptySpaces <= 0) && (complete() === true)) {
    alert("It's a tie.");
    reset();
  };
};

function complete() {
  if (sq1.value === "_" || sq2.value === "_" || sq3.value === "_" || sq4.value === "_" || sq5.value === "_" || sq6.value === "_" || sq7.value === "_" || sq8.value === "_" || sq9.value === "_") {
    return false;
  } else {
    return true;
  };
};

function reset() {
  sq1.value = "_";
  sq2.value = "_";
  sq3.value = "_";
  sq4.value = "_";
  sq5.value = "_";
  sq6.value = "_";
  sq7.value = "_";
  sq8.value = "_";
  sq9.value = "_";
  move = 0;
  emptySpaces = 9;
};
