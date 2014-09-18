//****************************
//
//Roman Numeral Converter
//
//
//****************************
function romanize(number) {
  var roman = ''; //empty variable for roman num
    if (number <= 0 || isNaN(number)) {
      roman = "ERRRORRRRR Enter a positive integer"
    } else {

      var arabicNum = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]; //arabic numerals
      var romanNum = ['M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I']; // roman numerals
      for (var i = 0; i < arabicNum.length; i++) { //for-loop going through length of arabic numeral array
        while (number >= arabicNum[i]) { // while-loop continuing as long as inputted value is greater than value in arabicNum array
          roman += romanNum[i]; //adds [i] roman number to roman string
          number -= arabicNum[i]; //subracts arabic number from total number
        }
      }
    }
    return roman; //return roman string
  };


