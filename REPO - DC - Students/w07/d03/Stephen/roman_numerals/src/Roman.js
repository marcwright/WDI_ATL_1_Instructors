/*
* @Author: stephenstanwood
* @Date:   2014-06-04 09:30:43
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-04 11:17:59
*/

var ROMAN_NUMERALS = [
    [ 'M', 1000 ],
    [ 'CM', 900 ],
    [ 'D',  500 ],
    [ 'CD', 400 ],
    [ 'C',  100 ],
    [ 'XC',  90 ],
    [ 'L',   50 ],
    [ 'XL',  40 ],
    [ 'X',   10 ],
    [ 'IX',   9 ],
    [ 'V',    5 ],
    [ 'IV',   4 ],
    [ 'I',    1 ] ];

// converts a number from normal form to Roman Numerals
function romanize( num ) {
  if ( num < 0 ) throw "Can't convert negative number!";

  var res = "";

  // loop through the roman numerals from largest to smallest
  for ( var i = 0, len = ROMAN_NUMERALS.length; i < len; i++ ) {

    // figure out how many of the current symbol fit in the number
    var num_sym = parseInt( num / ROMAN_NUMERALS[i][1] );

    // add that many of the symbol to the end of the result string
    res += new Array( num_sym + 1 ).join( ROMAN_NUMERALS[i][0] );

    // decrease the number to convert by the appropriate amount
    num %= ROMAN_NUMERALS[i][1];
  }

  return res;
}
