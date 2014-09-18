function romanize(number){
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

  for( var i = 0; i< mappings.length; i++){
    var mapping = mappings[i];
    while(number >= mapping.arabic){
      romanized += mapping.roman;
      number -= mapping.arabic;    
    }
  }
  return romanized;
}