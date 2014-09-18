function romanize( number ) {
  var numeralMap = [
    { arabic: 1000, roman: "M" },
    { arabic: 900, roman: "CM" },
    { arabic: 500, roman: "D" },
    { arabic: 400, roman: "CD" },
    { arabic: 100, roman: "C" },
    { arabic: 90, roman: "XC" },
    { arabic: 50, roman: "L" },
    { arabic: 40, roman: "XL" },
    { arabic: 10, roman: "X" },
    { arabic: 9, roman: "IX" },
    { arabic: 5, roman: "V" },
    { arabic: 4, roman: "IV" },
    { arabic: 1, roman: "I" },
  ];

  // find the biggest numeral that can fit in the number
  // subtract that value from the number and repeat the process
  var numerals = [];
  var mapping;
  for ( var i = 0; i < numeralMap.length; i++ ) {
    mapping = numeralMap[i];
    while ( number >= mapping.arabic ) {
      number -= mapping.arabic;
      numerals.push( mapping.roman );
    }
  }

  return numerals.join("");
}