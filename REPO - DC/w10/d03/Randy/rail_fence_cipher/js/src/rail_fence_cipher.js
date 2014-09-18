// First line will be numberOfRails*2 - 2 for second letter.

// var rails = 3

// for (i = 0; i < rails; i++){
//   num = (i+1).toString();
//   var arrayName = 'line' + num
//   var arrayName = [];
// };

function encode(msg){
  var encodedArray = [];
  var messageArray = msg.split('');

  for (i=0; i < messageArray.length; i++){
    if (i === 0 || i%4 === 0){
      encodedArray.push(messageArray[i])
    }
  };

  for (i=0; i < messageArray.length; i++){
    if (i%2 !== 0){
      encodedArray.push(messageArray[i])
    }
  };

  for (i=0; i < messageArray.length; i++){
    if (i%2 === 0 && i%4 !== 0){
      encodedArray.push(messageArray[i])
    }
  };

  return encodedArray.join("");
}

encode('WEAREDISCOVEREDFLEEATONCE');
