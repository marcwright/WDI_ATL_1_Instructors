function romanize(number) {

  var lookups = [
  {arabic: 1000, roman: "M"},
  {arabic: 900, roman: "CM"},
  {arabic: 500, roman: "D"},
  {arabic: 400, roman: "CD"},
  {arabic: 100, roman: "C"},
  {arabic: 90, roman: "XC"},
  {arabic: 50, roman: "L"},
  {arabic: 40, roman: "XL"},
  {arabic: 10, roman: "X"},
  {arabic: 9, roman: "IX"},
  {arabic: 5, roman: "V"},
  {arabic: 4, roman: "IV"},
  {arabic: 1, roman: "I"},
  ];

  var romanized = "";

  for( var i = 0; i < lookups.length; i++ ) {
    var lookup = lookups[i];
    while(number >= lookup.arabic) {
      romanized += lookup.roman;
      number -= lookup.arabic;
    }
  }

  return romanized;
}

//   var number = number;
//   var romans = [];

//   while (number >= 1000) {
//     romans.push("M");
//     number -= 1000;
//   }

//   while (number >= 900) {
//     romans.push("CM");
//     number -= 900;
//   }

//   while (number >= 500) {
//     romans.push("D");
//     number -= 500;
//   }

//   while (number >= 400) {
//     romans.push("CD");
//     number -= 400;
//   }

//   while (number >= 100) {
//     romans.push("C");
//     number -= 100;
//   }

//   while (number >= 90) {
//     romans.push("XC");
//     number -= 90;
//   }

//   while (number >= 50) {
//     romans.push("L");
//     number -= 50;
//   }

//   while (number >= 40) {
//     romans.push("XL");
//     number -= 40;
//   }

//   while (number >= 10) {
//     romans.push("X");
//     number -= 10;
//   }

//   while (number >= 9) {
//     romans.push("IX");
//     number -= 9;
//   }

//   while (number >= 5) {
//     romans.push("V");
//     number -= 5;
//   }

//   while (number >= 4) {
//     romans.push("IV");
//     number -= 4;
//   }

//   while (number > 0) {
//   romans.push("I");
//   number -= 1;
// }

//   var romanString = romans.join("");

//   return romanString;

