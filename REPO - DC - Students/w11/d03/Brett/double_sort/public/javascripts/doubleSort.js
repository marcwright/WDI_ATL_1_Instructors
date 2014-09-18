function doubleSort(array) {
  var numberArray = [];
  var wordArray = [];
  var mappingArray = [];

  for (var i = 0; i < array.length; i++) {

    if (!isNaN(array[i])) {
      numberArray.push(parseInt(array[i]));
      mappingArray.push(1);
    } else {
      wordArray.push(array[i]);
      mappingArray.push("word");
    }
  }

  if (hasNumbers === true) {
    return sortedArray.sort(sortNumber);
  } else {
    return sortedArray.sort();
  }
}

function sortNumber(a, b) {
  return a - b;
}


// save index of the item to reconstruct array with original pattern
