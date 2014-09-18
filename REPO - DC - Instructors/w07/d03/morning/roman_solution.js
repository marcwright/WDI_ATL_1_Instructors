// // numerals.js




function romanize(num){
  var romanized = '';
  while (num >= 10){
    romanized += "X";
    num -= 10;
  }
  while (num >= 9){
    romanized += "IX";
    num -= 9;
  }

// var romanValueMappings = {
//   1000: "M",
//    900: "CM",
//    500: "D",
//    400: "CD",
//    100: "C",
//     90: "XC",
//     50: "L",
//     40: "XL",
//     10: "X",
//      9: "IX",
//      5: "V",
//      4: "IV",
//      1: "I"
// };

// // create an array of keys for iterating through the object literal above
// var romanKeys = Object.keys(romanValueMappings).reverse();

// function romanize(numToRomanize){
//   var romanized = '';
//   // iterating through the mapped pairs
//   for(var i = 0; i < romanKeys.length; i++){
//     // set integer for accessing the values in mappings object
//     var testValue = parseInt(romanKeys[i]);
//     while(numToRomanize >= testValue){
//       romanized += romanValueMappings[testValue];
//       numToRomanize -= testValue;
//     }
//   }
//   return romanized;
// }

function romanize(num){
  var romanized = '';
  while (num >= 10){
    romanized += "X";
    num -= 10;
  }
  while (num >= 9){
    romanized += "IX";
    num -= 9;
  }

  while (num >55 return V
        subtract 5, then move down
    if 4 return IV

  }

  return num * 'I'
}
