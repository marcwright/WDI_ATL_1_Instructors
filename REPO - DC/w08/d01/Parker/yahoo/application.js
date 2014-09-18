$(document).ready(function() {
  $('form').on('submit', function(ev) {
    ev.preventDefault();
    var symbol = $('#symbol_input').val();
    $.ajax({
      url: '/' + symbol,
      success: function(data) {
        var symbols = ['name', 'symbol', 'lastTrade', 'time', 'date', 'updatedAt'];
        for (var i = 0; i < symbols.length; i++) {
          update($('#' + symbols[i]), data[symbols[i]]);
      }
    });
  });
});