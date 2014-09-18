/*
soundManager.setup({
    url: '/swf/',
    onready: function() {
        var mySound = soundManager.createSound({
            id: 'aSound',
            url: '/sa-ip.mp3'
        });
        mySound.play();
    }
});
*/

var myPlayer = myPlayer || {};
myPlayer.play = function() {
    song = myPlayer.getSong();
    song.play();
};

myPlayer.getSong = function() {
    return soundManager.createSound({
        id: 'track',
        url: '/sa-ip.mp3'
    });
};

myPlayer.setup = function() {
    $('#playbutton').click(function(ev) { ev.preventDefault(); myPlayer.play(); });
};


soundManager.setup({
    url: '/swf/',
    onready: myPlayer.setup
});
