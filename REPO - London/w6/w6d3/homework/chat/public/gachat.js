$(function() {
    var $button = $('form').on('submit', function(ev) {
        ev.preventDefault();
        $.ajax({
            url: '/chat',
            type: 'POST',
            data: {'username': $('#username').val(), 'message': $('#message').val(), 'since': $('#since').val()}
        }).success(function(data) {
            console.log(data);
            $.each(data, function(i, chatline) {
                $('ul').append('<li><span class="username">&lt;' + chatline.username + "&gt;</span> <span class='message'>" + chatline.message + "</span>");
            });
            $('#since').val(data[data.length-1].timestamp);
        });
    });
});
