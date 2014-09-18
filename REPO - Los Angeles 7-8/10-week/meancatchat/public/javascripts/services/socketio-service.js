$(function(){

	var socket = io.connect();

	var name = $('#name');

	var messageForm = $('#send-message');

	var messageBox = $('#message');

	var chat = $('#chat');

	messageForm.submit(function(e){
		e.preventDefault();

		socket.emit('send message', {name: name.val(), message: messageBox.val()});

		messageBox.val('');
	});


	socket.on('new message', function(data){
		chat.append(data.name + ': ' + data.message +'<br>');
	});
});