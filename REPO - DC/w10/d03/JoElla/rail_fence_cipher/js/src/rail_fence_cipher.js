

function encode(string){
  var rail1 = [];
  var rail2 = [];
  var rail3 = [];

  for (var i = 0; i < string.length; i++){
    rail1.push(string[i]);
    for (var j = 0; j < string.length; j++){
      rail2.push(string[i]);
    }
      for (var h = 0; h <string.length; h++){
        rail3.push(string[i]);
      }
  }
    var rail = [];
    rail.push(rail1);
    rail.push(rail2);
    rail.push(rail3);

    return rail;

}


//1 2 3 2
