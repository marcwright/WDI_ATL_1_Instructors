var express = require('express');
var http = require('http');
var fs = require('fs');
var app = express();
app.use('/static', express.static(__dirname + '/static'));

// Serve our app root.
app.get('/', function(request, response) {
    fs.createReadStream('./views/index.html').pipe(response);
});

server = http.createServer(app);
server.listen(process.env.PORT || 4000);
var io = require('socket.io').listen(server);

io.sockets.on('connection', function(socket) {
    socket.emit('connected');

    socket.on('chat', function(data) {
        socket.broadcast.emit('chat', data);
    });

    socket.on('action', function(data) {
        socket.broadcast.emit('action', data);
    });
});
