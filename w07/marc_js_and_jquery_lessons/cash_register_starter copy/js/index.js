var total = 0;

$('#entry').submit(enter);

function enter() {
  var entry = $('#newEntry').val();
  entry = parseFloat(entry);
  currency = currencyFormat(entry);
  
  $('#entries').append('<tr><td></td><td>' + currency + '</td></tr>');
  
  total += entry;
  
  $('#total').html (currencyFormat(total));
  
  entry.val('');
}

function currencyFormat(number) {
  var currency = parseFloat(number);
  currency = currency.toFixed(2);
  currency = '$' + currency;
  return currency;
}