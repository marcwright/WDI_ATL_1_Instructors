// # Air Conditioning

// - Ask the user what the current temperature is, if the A/C is functional, and what temperature they wish it was.
// - If the airconditioner is functional and the current temperature is above the the desired temperature... display "Turn on the A/C Please"
// - If the airconditioner is non-functional and the current temperature is above the the desired temperature... display "Fix the A/C now!  It's hot!"
// - If the airconditioner is non-functional and the current temperature is below the the desired temperature... display "Fix the A/C whenever you have the chance...  It's cool..."

function airConditioner( functional, currentTemp, desiredTemp ) {
  this.functional = functional;
  this.currentTemp = currentTemp;
  this.desiredTemp = desiredTemp;
}

airConditioner.prototype.manage = function() {
  if ( this.functional ) {
    if ( this.currentTemp > this.desiredTemp ) {
      return "Turn on the A/C please.";
    }
  } else {
    if ( this.currentTemp > this.desiredTemp ) {
      return "Fix the AC now, it's hot!";
    } else {
      return "Fix the A/C whenever you have a chance, it's cool.";
    }
  }
};

function getAirConditionerDetails() {
  var acResponse = prompt( "Is the AC functional?" ).toLowerCase();
  var functionalAC = acResponse[0] === "y";

  var currentTemp = prompt( "What's the current temperature?" );
  var currentTempInt = parseInt( currentTemp );

  var desiredTemp = prompt( "What is the desired temperature?" );
  var desiredTempInt = parseInt( desiredTemp );

  return new airConditioner( functionalAC, currentTempInt, desiredTempInt );
}

var myAC = getAirConditionerDetails();
console.log( myAC.manage() );