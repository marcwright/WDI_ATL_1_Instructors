# Currency Converter

* [Find the exchange rate between dollars and pounds](http://www.bloomberg.com/quote/GBPUSD:CUR)

* Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.

function dollarsToPounds(){
  dollars = prompt('What is the amount in dollars?');
  pounds = dollars * 1.6747;
  return console.log('$' + dollars + ' is £' + pounds);
};

`"$NN is £NN".`

* Write a function poundsToDollars that takes a pound number as input and outputs a string of what the dollar equivalent is.

`"£NN is $NN".`

function poundsToDollars(){
  pounds = prompt('What is the amount in pounds?');
  dollars = pounds / 1.6747;
  return console.log('£' + pounds + ' is $' + dollars);
};

* Write a function currencyConverter that takes 3 arguments: the currency it is converting from, the currency you are converting to, and the amount. It should output the appropriate string.

function currencyConverter(from, to, amt){
  switch (from) {
    case 'dollars' :
      if (to === 'pounds') {
        return parseFloat(amt * 1.6747).toFixed(2);
    } else {
        return 'Invalid!';
    }
    break;
    case 'pounds' :
    if (to === 'dollars') {
      return parseFloat(amt / 1.6747).toFixed(2);
    } else {
    return 'Invalid!';
    };
    break;

  };
};

* You can get user input using the `prompt` function.

* Can you make sure the output is only 2 decimal places?
