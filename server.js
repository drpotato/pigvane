var application_root = __dirname,
    express = require("express"),
    path = require("path"),
    sqlite3 = require('sqlite3').verbose();

var db = new sqlite3.Database('highscores.db');

db.serialize(function() {
  db.run("CREATE TABLE IF NOT EXISTS highscore (name TEXT, score INTEGER)");
});

var app = express();

// Config

app.configure(function () {
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(path.join(application_root, "dev")));
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

app.get('/retrieve_scores', function (req, res) {

	var query = "SELECT * FROM highscore ORDER BY score DESC LIMIT 10;";
	db.serialize(function() {
		db.all(query, function (err, rows){
			console.log("Sending Data.");
			res.send(JSON.stringify(rows));
		});
	});
});

app.get('/enter_score', function (req, res) {
	var query = "INSERT INTO highscore (name,score) VALUES ('" + req.query.name + "','" + req.query.score +"');";
	db.serialize(function() {
		db.run(query);
	});

	res.send("");
});

process.on('SIGTERM', function () {
  console.log("Closing");
  db.close()
});

// Launch server

app.listen(8000);