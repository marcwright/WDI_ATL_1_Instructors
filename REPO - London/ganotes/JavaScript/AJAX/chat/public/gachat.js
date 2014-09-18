function addLines(data) {
    $.each(data, function(i, chatline) {
        $('ul').append('<li><span class="username">&lt;' + chatline.username + "&gt;</span> <span class='message'>" + chatline.message + "</span>");
    });
}

function updateTimestamp(data) {
    $('#since').val(data[data.length-1].timestamp);
}


$(function() {
    var $button = $('form').on('submit', function(ev) {
        ev.preventDefault();
        var ajaxOptions = {
            url: '/chat',
            type: 'POST',
            data: {'username': $('#username').val(), 'message': $('#message').val(), 'since': $('#since').val()}
        };
        $.ajax(ajaxOptions).success(addLines).success(updateTimestamp);
        });
    });
});
