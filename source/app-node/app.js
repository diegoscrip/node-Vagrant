const express = require('express'); 
var mysql = require('mysql');
const app = express();

app.get('/', function(req, res) {	
    res.send('Hello, world!');
});

app.get('/db', function(req, res) {	
	var connection = mysql.createConnection({
	  host     : '192.168.99.2',
	  user     : 'root',
	  password : 'root',
	  database : 'cap'
	});
	
	connection.connect(function(err) {
	  if (err) {
		console.error(err);
		res.send('Connect failed!');
	  } else {
		res.send('Connected!');
	  }
	});
});

app.listen(8081, function() {	
	console.log('Iniciando a aplicação na porta ' + 8081);
});