

function romanize(number){
  var numerals = {
    1000: "M",
     900: "CM",
     500: "D",
     400: "CD",
     100: "C",
      90: "XC",
      50: "L",
      40: "XL",
      10: "X",
       9: "IX",
       5: "V",
       4: "IV",
       1: "I"
  };
  var numholder = [];

    for (var i = 0; i < numerals.length; i++){
        if (number >= parseInt(numerals.keys(i))){
          numholder.push(numerals[i]);
          number -= parseInt(numerals.keys([i]));
        }
      }
    }
  return numholder.join("")
}

/*  while (number > 0) {
    if (number >= 1000) {
      numholder.push("M");
      number -= 1000;
    } else if (number >= 900){
      numholder.push("CM");
      number -= 900;
    } else if (number >= 500) {
      numholder.push("D");
      number -= 500;
    } else if (number >= 400){
      numholder.push("CD");
      number -= 400;
    } else if (number >= 100) {
      numholder.push("C");
      number -= 100;
    } else if (number >= 90) {
      numholder.push("XC");
      number -= 90;
    } else if (number >= 50){
      numholder.push("L");
      number -= 50;
    } else if (number >= 40){
      numholder.push("XL");
      number -= 40;
    } else if (number >= 10){
      numholder.push("X");
      number -= 10;
    } else if (number >= 9){
      numholder.push("IX");
      number -= 9;
    } else if (number >= 5){
      numholder.push("V");
      number -= 5;
    } else if (number >= 4){
      numholder.push("IV");
      number -= 4;
    } else if (number >= 1){
      numholder.push("I")
      number -= 1;
    }

  }

  return numholder.join("");
}





function romanize(number){
  var numholder = [];
  while (number > 0) {
    if (number < 4) {
      for (var i = 0; i < number; i++){
        numholder.push("I");
      }
      number = 0;
    } else if (number > 4 && number < 10){

      number -= 5;
    } else if {

    }

  }

  return numholder.join("");
}
*/
