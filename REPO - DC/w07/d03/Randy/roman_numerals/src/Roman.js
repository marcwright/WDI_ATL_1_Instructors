function romanize(num){

 if (num === 0){
    var roman = "The Romans had no use for your puny Zero!"
  } else {
    var roman = '';
  }

  var decimals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
  var romanNums = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];

  for(var i = 0; i < decimals.length; i++) {
    while(num >= decimals[i]) {
      roman += romanNums[i];
      num -= decimals[i];
    }
  }
    return roman;
};


// var thousands = Math.floor(num/1000) || 0;
  // var hundreds = Math.floor((num - (thousands*1000))/100) || 0;
  // var tens = Math.floor((num - (thousands*1000) - (hundreds*100))/10) || 0;
  // var fives = Math.floor((num - (thousands*1000) - (hundreds*100) - (tens*10))/5) || 0;
  // var ones = Math.floor((num - (thousands*1000) - (hundreds*100) - (tens*10) - (fives*5))) || 0;
