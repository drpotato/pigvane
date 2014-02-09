var connect = require('connect');
connect.createServer(
	connect.static(__dirname+'/dev')
).listen(8000);

