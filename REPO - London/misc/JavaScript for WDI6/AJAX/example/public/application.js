function showLoading() {
  $('#updatemessage').slideDown();
}

function endLoading() {
  $('#updatemessage').slideUp();
}

function update(el, content) {
  var $el = $(el);
  $el.text(content);

  var up = true;
  var level = 15;
  var step = function () {
    var hex = level.toString(16);
    $el.css('background-color', '#FAFA' + hex + hex);
    if (up) {
      if (level > 0) {
        level--;
        setTimeout(step, 25);
      } else {
        up = false;
        level = 1;
        setTimeout(step, 25);
      }
    } else if (level < 15) {
      level += 1;
      setTimeout(step, 25);
    } else {
      el.css('background-color', '#FFF');
    }
  };
  setTimeout(step, 25);
}


$(document).ready(function() {
  $('form#trade').on('submit', function(ev) {
    ev.preventDefault();
    var $form = $(ev.currentTarget);
    var amount = $('input[name=amount]', $form).val();
    console.log(amount);
  });


  $('form#quote').on('submit', function(ev) {
    ev.preventDefault();
    var symbol = $('#symbol_input').val();
    showLoading();
    $.ajax({
      url: '/' + symbol,
      type: 'GET',
      success: function(data) {
        // NB. Do it longhand first.
        var symbols = ['name', 'symbol', 'lastTrade', 'time', 'date', 'updatedAt'];
        for (var i = 0; i < symbols.length; i++) {
          update($('#' + symbols[i]), data[symbols[i]]);
        }
      },
      complete: endLoading

    });
  });
});
