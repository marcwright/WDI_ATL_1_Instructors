function doubleSort(array){
  var numbers = array.filter(function(element){
    return !isNaN(element);
  });

  var words = array.filter(function(element){
    return isNaN(element);
  });

  numbers.sort(function(a,b){
    return a - b;
  });
  words.sort();

  var sorted = array.map(function(element){
    if(isNaN(element)){
      return words.shift();
    } else {
      return numbers.shift();
    }
  });

  return sorted;
}
