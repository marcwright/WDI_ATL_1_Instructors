/*
* @Author: Richard Hessler
* @Date:   2014-06-05 16:42:55
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-05 16:42:55
*/

var encrpKey = {
    {a: 0},
    {b: 1},
    {c: 2},
    {d: 3},
    {e: 4},
    {f: 5},
    {g: 6},
    {h: 7},
    {i: 8},
    {j: 9},
    {k: 10},
    {l: 11},
    {m: 12},
    {n: 13},
    {o: 14},
    {p: 15},
    {q: 16},
    {r: 17},
    {s: 18},
    {t: 19},
    {u: 20},
    {v: 21},
    {w: 22},
    {x: 23},
    {y: 24},
    {z: 25},
    {a: 26},
    {b: 27},
    {c: 28},
    {d: 29},
    {e: 30},
    {f: 31},
    {g: 32},
    {h: 33},
    {i: 34},
    {j: 35},
    {k: 36},
    {l: 37},
    {m: 38},
    {n: 39},
    {o: 40},
    {p: 41},
    {q: 42},
    {r: 43},
    {s: 44},
    {t: 45},
    {u: 46},
    {v: 47},
    {w: 48},
    {x: 49},
    {y: 50},
    {z: 51},
  };

var encodedMessage = '';
var plainTextMessage = 'iamverytired';
var key = 'inhak';
var quotient = Math.floor(plainTextMessage.length/key.length);
var remainder = plainTextMessage.length%key.length;
var codeWord = '';

for (var i=0; i < quotient; i++){
  codeWord  += key
}

for (i = 0; i < remainder; i++){
  codeWord += key[i];
}


for (i = 0; i < codeWord.length; i++){
  var codeLetter = 0;
  codeLetter = plainTextMessage[i].value + codeWord[i].value
  encodedMessage =+ encrpKey.keys(encrpKey[codeLetter]);
}
