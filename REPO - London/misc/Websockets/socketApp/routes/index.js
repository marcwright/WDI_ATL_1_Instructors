var express = require('express');
var router = express.Router();

// var io = require('socket.io').listen(server);
//     io.sockets.on('connection', function(socket) {
//         socket.emit('connected');
//     });

// var socket = io.connect('http://localhost:3000/');
//     socket.on('connected', function() {
//         alert("Connected!");
//     });

/* GET home page. */
router.get('/', function(req, res) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
