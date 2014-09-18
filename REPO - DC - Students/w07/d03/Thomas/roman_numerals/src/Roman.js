function romanize(number) {
  var number = number;
  var result = number / 10
  if (result && number < 50) {
    var x = Array(result + 1).join("X")
    var number = number - (result * 10);
    debugger;
    return x
  }
};

} else if (number === 4) {
    return "IV"
  } else (number < 4) {
    return Array(number + 1).join("I");
  }
