function startLoading() {
  $('#updatemessage').slideDown();
  var $submitButton = $('form input[type="submit"]');
  $submitButton.attr('disabled', true).val('Please wait...');
}

function endLoading() {
  var $submitButton = $('form input[type="submit"]');
  $submitButton.attr('disabled', false).val('Look up');
  $('#updatemessage').slideUp();
}

function updatePage(data) {
  console.debug("updatePage called.");
  var thingsToUpdate = ['name', 'symbol', 'lastTrade', 'time', 'date', 'updatedAt'];
  $.each(thingsToUpdate, function(i, thing) {
    $thing = $('#' + thing);
    $thing.text(data[thing]);
    $thing.effect('highlight', 1000);
  });
  if(!$('#quote_container').is(":visible")) {
    $('#splash_container').hide();
    $('#quote_container').show();
  }
}

$(document).ready(function() {
// Save original page on load
var originalContent = $('#content');

// Submit form via AJAX
$('form').on('submit', function(ev) {
  ev.preventDefault();
  startLoading();

  var stockSymbol = $('#symbol_input').val();
  var successHandler = function(data) {
    console.log("SuccessHandler invoked.");
    updatePage(data);
    if (typeof history !== "undefined") {
      history.pushState(data, "page title", "/" + data.symbol);
    }
  };
  $.ajax({url: '/' + stockSymbol}).success(successHandler).complete(endLoading);
});
// Update page when user clicks 'back' (corollary to pushState)
$(window).on('popstate', function(event) {
  if (event.originalEvent.state) {
    console.debug("Restoring page state via HTML5 history");
    updatePage(event.originalEvent.state);
  } else {
    console.debug("Restoring page state using smelly jQuery swapping.");
    $('#content').replaceWith(originalContent);
  }
});

});
