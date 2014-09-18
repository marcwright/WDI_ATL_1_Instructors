function romanize(number){


  var mappings = [
    {arabic: 1000, roman: 'M'},
    {arabic: 900, roman: 'CM'},
    {arabic: 500, roman: 'D'},
    {arabic: 400, roman: 'CD'},
    {arabic: 100, roman: 'C'},
    {arabic: 90, roman: 'XC'},
    {arabic: 50, roman: 'L'},
    {arabic: 40, roman: 'XL'},
    {arabic: 10, roman: 'X'},
    {arabic: 9, roman: 'IX'},
    {arabic: 5, roman: 'V'},
    {arabic: 4, roman: 'IV'},
    {arabic: 1, roman: 'I'},
  ];

  var romanized = '';

  //this is the iterator, it keeps moving foward by one until it gets to the end of the array above
  for( var i = 0; i< mappings.length; i++){
    //this creates a variable that is equal to one slice of the array above, at position "i", meaning wherever the iterator is (the iterator's current value)
    var mapping = mappings[i];
    //the while loop keeps running as long as your stored value ("number") is greater than what's found in the value for "arabic" at whatever [i] the iterator is at
    while(number >= mapping.arabic){
      //and then, so long as the number is bigger than the value presented in arabic, it adds the corresponding roman letter to your waiting string above (var romanized)
      romanized += mapping.roman;
      //then it removes the equivalent value from your stored number and goes to the top of the loop to start over
      number -= mapping.arabic;
    }
  }
  //if you don't return things, your program will suck and you'll be sad
  return romanized;
}



//below are all the simplified approaches Peter took at the beginning of his TDD process
//note that the second one basically works like the while loop, but it spells out every value instead of using a placeholder from an array


  // if(number === 2) {
  //   return 'II';
  // } else {
  //   return 'I';
  // }


  ////////////////////////////

  //   var romanized = '';
  // while(number >= 10){
  //   romanized += 'X';
  //   number -= 10;
  // }
  // while(number >= 9){
  //   romanized += 'IX';
  //   number -= 9;
  // }
  // while(number >= 5){
  //   romanized += 'V';
  //   number -= 5;
  // }
  // while(number >= 4){
  //   romanized += 'IV';
  //   number -= 4;
  // }
  // while(number > 0){
  //   romanized += 'I';
  //   number--;
  // }
  // return romanized;

  /////////////////////////////
