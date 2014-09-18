// # Currency Converter

// * [Find the exchange rate between dollars and pounds](http://www.bloomberg.com/quote/GBPUSD:CUR)

// * Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.

// `"$NN is £NN".`

// * Write a function poundsToDollars that takes a pound number as input and outputs a string of what the dollar equivalent is.

// `"£NN is $NN".`

// * Write a function currencyConverter that takes 3 arguments: the currency it is converting from, the currency you are converting to, and the amount. It should output the appropriate string.

// * You can get user input using the `prompt` function.

// * Can you make sure the output is only 2 decimal places?

function Money( options ) {
  this.unit = options.unit;
  this.currency = options.currency;
}

Money.USDExchangeRates = {
  GBP: 0.60,
  MXN: 12.91,
  USD: 1
};

Money.symbols = {
  USD: "$",
  GBP: "£",
  MXN: "$"
};

Money.prototype.exchange = function( desiredCurrencyCode ) {
  // exchange from current currency to USD
  var totalUSD = this.unit * Money.USDExchangeRates[this.currency];
  // exchange from USD to desired currency
  var totalCurrency = Money.USDExchangeRates[desiredCurrencyCode] / totalUSD;

  return Money.symbols[desiredCurrencyCode] + totalCurrency.toFixed(2);
};