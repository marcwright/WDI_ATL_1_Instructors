function valid(creditCardNumber) {

  var ccNumberArray = creditCardNumber.toString().split("").reverse();

  for (var i = 1; i < ccNumberArray.length; i+=2) {
    ccNumberArray[i] = ccNumberArray[i] * 2;
  }

  for (var i = 0; i < ccNumberArray.length; i++) {
    if (ccNumberArray[i] > 10) {
      var splitNumber = ccNumberArray[i].toString().split("");

      for (var digit = 0; digit < splitNumber.length; digit++) {
        splitNumber[digit] = parseInt(splitNumber[digit]);
      }

      ccNumberArray[i] = splitNumber.reduce(function(a, b) {
        return a + b;
      });
    } else {
      ccNumberArray[i] = parseInt(ccNumberArray[i]);
    }
  }

  // Sum the values in the array
  var total = ccNumberArray.reduce(function(a, b) {
    return a + b;
  });

// Check if the sum is divisible by 10

  if (total % 10 === 0) {
    return true;
  } else {
    return false;
  }

}
