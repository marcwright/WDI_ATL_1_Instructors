function romanize(number) {
  var result = [];
  if (number >= 1000) {
    var numM = Math.floor(number / 1000);
    var count3 = 0;
    while (count3 < numM) {
      result.push('M');
      count3++;
    };
    number = number % 1000;
  };
  if (number >= 900) {
    number = number - 900;
    result.push('CM');
  };
  if (number >= 500) {
    number = number - 500;
    result.push('D');
  };
  if (number >= 400) {
    number = number - 400;
    result.push('CD');
  };
  if (number >= 100) {
    var numC = Math.floor(number / 100);
    var count4 = 0;
    while (count4 < numC) {
      result.push('C');
      count4++;
    };
    number = number % 100;
  };
  if (number >= 90) {
    number = number - 90;
    result.push('XC');
  };
  if (number >= 60) {
    number = number - 60;
    result.push('LX');
  };
  if (number >= 50) {
    number = number - 50;
    result.push('L');
  };
  if (number >= 40 ) {
    number = number - 40;
    result.push('XL');
  };
  if (number >= 10) {
    var numX = Math.floor(number / 10);
    var count2 = 0;
    while (count2 < numX) {
      result.push('X');
      count2++;
    };
    number = number % 10;
  };
  if (number >= 5 && number !== 9) {
    result.push('V');
    number = number % 5;
  };
  if (number === 4) {
    result.push('IV');
  } else if (number === 9) {
    result.push('IX');
  } else {
    var count = 0;
    while (count < number) {
      result.push('I');
      count++;
    };
  };

  return result.join('');
}
